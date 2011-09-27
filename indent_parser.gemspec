# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "indent_parser/version"

Gem::Specification.new do |s|
  s.name        = "indent_parser"
  s.version     = IndentParser::VERSION
  s.authors     = ["Jeff Su"]
  s.email       = ["me@jeffsu.com"]
  s.homepage    = "https://github.com/jeffsu/indent_parser"
  s.summary     = %q{Parser for python-style (or haml, sass, etc...) indent markup languages}
  s.description = %q{Parser for python-style (or haml, sass, etc...) indent markup languages}

  s.rubyforge_project = "indent_parser"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
