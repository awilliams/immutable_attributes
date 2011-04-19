begin
  require 'active_record'
rescue LoadError
  require 'activerecord'
end

module ImmutableErrors
  class ImmutableAttributeError < ActiveRecord::ActiveRecordError
  end
end

module ImmutableAttributes
  VERSION = "1.0.3"

  class Immutable < Set
    # allow setting attribute as mutable within block
    def make_mutable(*attr_names)
      self.subtract(attr_names)
      begin
        yield
      ensure
        self.merge(attr_names)
      end
    end
  end

  module ClassMethods

    def attr_immutable(*args)
      args.each do |meth|
        class_eval do
          define_method("#{meth}=") do |value|
            new_record? || read_attribute(meth).nil? ?
              write_attribute(meth, value) :
              raise(ActiveRecord::ImmutableAttributeError, "#{meth} is immutable!")
          end
        end
      end
    end

    def validates_immutable(*attr_names)
      config = { :on => :update, :if => lambda {|x| true}, :message => :immutable }
      config.update(attr_names.extract_options!)

      @immutables ||= Immutable.new
      @immutables.merge(attr_names)

      instance_eval do
        protected
        def immutables
          @immutables
        end
      end

      class_eval do
        def immutables
          # each instance maintains it's own copy of the immutable set
          @immutables ||= self.class.send(:immutables).dup
        end
      end

      validates_each(attr_names, config) do |record, attr_name, value|
        record.errors.add(attr_name, config[:message], :default => 'cannot be modified') if record.changed.include?(attr_name.to_s) && record.immutables.include?(attr_name)
      end
    end

  end
end

ActiveRecord.send :include, ImmutableErrors
ActiveRecord::Base.extend ImmutableAttributes::ClassMethods
