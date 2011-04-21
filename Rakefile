require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new(:runtests) do |test|
  test.libs << 'test'
  test.pattern = 'test/test_*.rb'
  test.verbose = true
end

task :make do
  Dir.chdir('ext/icu4r/c') { `ruby extconf.rb`; `make` }
end

task :clean do
  ['rm -f ext/icu4r/c/*.so', 'rm -f ext/icu4r/c/*.o', 'rm -f ext/icu4r/c/Makefile', 'rm -f ext/icu4r/c/mkmf.log'].each do |cmd|
    `#{cmd}` && puts(cmd)
  end
end

desc "Build the icu4r source and run tests"
task :test => [:clean, :make, :runtests]

task :default => :test