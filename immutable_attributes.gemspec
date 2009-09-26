# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{immutable_attributes}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2009-09-26}
  s.description = %q{Allows specified attributes to be freely overwritten _until_ the record is saved for the first time}
  s.email = %q{gems@6brand.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "README",
     "Rakefile",
     "VERSION",
     "immutable_attributes.gemspec",
     "init.rb",
     "install.rb",
     "lib/immutable_attributes.rb",
     "rails/init.rb",
     "test/immutable_attributes_test.rb"
  ]
  s.homepage = %q{http://github.com/JackDanger/immutable_attributes}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Selected attributes are permanent once a record is created}
  s.test_files = [
    "test/immutable_attributes_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
