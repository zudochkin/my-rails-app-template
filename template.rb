
routes = <<EOS
Rails.application.routes.draw do
  root 'home#index'
end
EOS

gem 'slim-rails'

gem 'russian', '~> 0.6.0'

gem_group :development do
  gem 'vendorer'
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'quiet_assets'
end

run 'bundle install'

puts 'Added generators to config/application.rb'

inject_into_file 'config/application.rb', after: '# config.i18n.default_locale = :de' do <<-EOS

    config.i18n.default_locale = :ru

    config.generators do |g|
      g.stylesheets false
      g.helper false
      g.javascripts false
      g.test_framework :rspec, fixtures: false
    end
EOS
end

create_file 'README.md', '# Simple rails application template'
puts 'Added README.md file'

remove_file 'README.rdoc'
puts 'Removed README.rdoc file'

generate(:controller, 'home index')

remove_file 'config/routes.rb'
create_file 'config/routes.rb', routes

run 'git init'

append_file '.gitignore', 'config/database.yml'

run 'cp config/database.yml config/database.yml.example'

run 'vendorer init'

run 'git add .'
run 'git commit -m "Initial commit"'

if yes? 'Is it {T,B}DD time?'
  say 'Good choice, motherfucker!'

  # gem_group :test do
  #   gem 'shoulda'
  # end

  gem_group :development, :test do
    # TODO: ability to choose factory_girl
    gem 'fabrication'

    gem 'rspec-rails', '~> 3.0.0.beta'
  end

  run 'bundle install'

  run 'rails generate rspec:install'

  create_file 'spec/controllers/home_controller_spec.rb', <<-EOS
require 'spec_helper'

describe HomeController do
  describe 'GET index' do
    before { get :index }
    it { expect(response).to render_template('index') }
  end
end
EOS

end
