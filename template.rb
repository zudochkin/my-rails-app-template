s = <<EOS
config.i18n.default_locale = :ru

    config.generators do |g|
      g.stylesheets false
      g.helper false
      g.javascripts false
    end
EOS

routes = <<EOS
Rails.application.routes.draw do
  root 'home#index'
end
EOS

gem 'slim-rails'

gem 'russian', '~> 0.6.0'

run 'bundle install'

puts 'Added generators to config/application.rb'
gsub_file 'config/application.rb', '# config.i18n.default_locale = :de', s

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

run 'git add .'
run 'git commit -m "Initial commit"'
