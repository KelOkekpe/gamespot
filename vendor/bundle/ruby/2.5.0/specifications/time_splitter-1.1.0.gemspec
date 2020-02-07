# -*- encoding: utf-8 -*-
# stub: time_splitter 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "time_splitter".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michi Huber".freeze, "Joshua Kovach".freeze]
  s.date = "2015-05-20"
  s.description = "Add split accessors for Date/Time/DateTime objects to easily set the date, time, hour, or minute.".freeze
  s.email = ["michi.huber@gmail.com".freeze, "kovach.jc@gmail.com".freeze]
  s.homepage = "https://github.com/shekibobo/time_splitter".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Use `datetime_accessor :starts_at` to provide `starts_at_date`, `starts_at_time`, `starts_at_hour`, `starts_at_minute` accessors on the model.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
  end
end
