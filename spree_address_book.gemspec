Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_address_book'
  s.version     = '1.2.0'
  s.summary     = 'Adds address book for users to Spree'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Roman Smirnov'
  s.email             = 'roman@railsdog.com'
  s.homepage          = 'http://github.com/romul/spree_address_book'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '~> 1.3')
  s.add_development_dependency('rspec-rails',  '~> 2.9')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('capybara')
  s.add_development_dependency('factory_girl', '~> 3.2')
end
