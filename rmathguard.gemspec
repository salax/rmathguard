# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rmathguard}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jakub Dušek"]
  s.date = %q{2010-02-24}
  s.email = ["jakub.dusek@email.cz"]
  s.files = ["lib/rmathguard/expression.rb", "lib/rmathguard/number.rb", "lib/rmathguard/digit.rb", "lib/rmathguard.rb", "MIT-LICENSE", "README.markdown"]
  s.homepage = %q{http://github.com/salax/rmathguard}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
