# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{recordselect_vho}
  s.version = "3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Volker Hochstein", "Lance Ivy"]
  s.date = %q{2011-02-03}
  s.description = %q{RecordSelect is a Rails widget to help you pick one record out of many. I designed it as a more usable and performant alternative to generating a massive dropdown list}
  s.email = %q{activescaffold@googlegroups.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".document",
    "CHANGELOG",
    "Gemfile",
    "MIT-LICENSE",
    "README",
    "Rakefile",
    "app/views/record_select/_browse.html.erb",
    "app/views/record_select/_list.html.erb",
    "app/views/record_select/_search.html.erb",
    "app/views/record_select/browse.js.rjs",
    "assets/images/cross.gif",
    "assets/images/next.gif",
    "assets/images/previous.gif",
    "assets/javascripts/jquery/record_select.js",
    "assets/javascripts/prototype/record_select.js",
    "assets/stylesheets/record_select.css",
    "init.rb",
    "install.rb",
    "lib/record_select.rb",
    "lib/record_select/actions.rb",
    "lib/record_select/conditions.rb",
    "lib/record_select/config.rb",
    "lib/record_select/extensions/active_record.rb",
    "lib/record_select/extensions/localization.rb",
    "lib/record_select/extensions/routing_mapper.rb",
    "lib/record_select/form_builder.rb",
    "lib/record_select/helpers/record_select_helper.rb",
    "lib/record_select/version.rb",
    "lib/record_select_assets.rb",
    "lib/recordselect.rb",
    "lib/recordselect_vho.rb",
    "recordselect_vho.gemspec",
    "test/recordselect_test.rb",
    "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/vhochstein/recordselect}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{RecordSelect widget as a replacement for massive drop down lists}
  s.test_files = [
    "test/recordselect_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
  end
end

