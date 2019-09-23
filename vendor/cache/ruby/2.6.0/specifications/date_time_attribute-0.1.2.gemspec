# -*- encoding: utf-8 -*-
# stub: date_time_attribute 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "date_time_attribute".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sergei Zinin".freeze, "Robert Gauld".freeze]
  s.date = "2013-11-22"
  s.description = "Allows you to work with the date and time parts of DateTime attributes separately. Plays with time zones and ActiveModel as well.".freeze
  s.email = "szinin@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/einzige/date_time_attribute".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Splits DateTime attribute access into separate Date, Time and TimeZone attributes".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<activerecord>.freeze, [">= 4.0.2"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 4.0.2"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 4.0.2"])
  end
end
