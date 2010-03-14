# encoding: utf-8

$:.unshift File.expand_path("../lib", __FILE__)

require 'rmathguard'

spec = Gem::Specification.new do |s|
  s.name     = "rmathguard"
  s.version  = RMathGuard::VERSION
  s.authors  = ["Jakub Dušek"]
  s.email    = ["jakub.dusek@email.cz"]
  s.homepage = "http://github.com/salax/rmathguard"
  s.summary  = ""

  s.platform = Gem::Platform::RUBY

  s.required_rubygems_version = ">= 1.3.1"

  s.files        = Dir.glob("lib/**/*") + %w(MIT-LICENSE README.markdown)
  s.require_path = 'lib'
end

begin
  require 'spec/rake/spectask'
rescue LoadError
  task :spec do
    $stderr.puts '`gem install rspec` to run specs'
  end
else
  desc "Run specs"
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList['spec/*_spec.rb']
    t.spec_opts  = %w(-fs --color)
    t.warning    = true
  end
end

begin
  require 'rake/gempackagetask'
rescue LoadError
  task(:gem) { $stderr.puts '`gem install rake` to package gems' }
else
  Rake::GemPackageTask.new(spec) do |pkg|
    pkg.gem_spec = spec
  end
  task :gem => :gemspec
end

desc "install the gem locally"
task :install => :package do
  sh %{gem install pkg/#{spec.name}-#{spec.version}}
end

desc "create a gemspec file"
task :gemspec do
  File.open("#{spec.name}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

task :package => :gemspec
task :default => [:spec, :gemspec]
