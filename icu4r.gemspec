# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "icu4r/version"

Gem::Specification.new do |s|
  s.name        = "icu4r"
  s.version     = Icu4r::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nikolai Lugovoi"]
  s.email       = ["meadow.nnick@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ICU Unicode bindings for Ruby.}
  s.description = %q{ICU Unicode bindings for Ruby.}
  s.extensions  = ["ext/icu4r/c/extconf.rb"]
  
  s.rubyforge_project = "icu4r"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.test_files = [
    "test/test_calendar.rb",
    "test/test_collator.rb",
    "test/test_converter.rb",
    "test/test_ustring.rb"
  ]
end
