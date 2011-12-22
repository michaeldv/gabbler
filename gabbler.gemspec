# Copyright (c) 2011 Michael Dvorkin
#
# Gabbler is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require "rake"
require File.dirname(__FILE__) + "/lib/gabbler/version"

task :default => :spec

task :spec do
  # Run plain rspec command without RSpec::Core::RakeTask overrides.
  exec "rspec -c spec"
end

Gem::Specification.new do |s|
  s.name        = "gabbler"
  s.version     = Gabbler.version
# s.platform    = Gem::Platform::RUBY
  s.authors     = "Michael Dvorkin"
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.email       = "mike@dvorkin.net"
  s.homepage    = "http://github.com/michaeldv/gabbler"
  s.summary     = "Generate pseudo-random phrases using Markov chains"
  s.description = s.summary

  s.rubyforge_project = "gabbler"

  s.files         = Rake::FileList["[A-Z]*", "lib/**/*.rb", "sample/*", "spec/*", ".gitignore"]
  s.test_files    = Rake::FileList["spec/*"]
  s.executables   = []
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", ">= 2.6.0"
end
