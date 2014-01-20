# Simple application template

* gem **slim-rails**
* **HomeController** for root route
* **README.rdoc** -> **README.md**
* **:ru** is a default locale and **russian** gem
* added **config/database.yml** to **.gitignore**
* changed generators (no stylesheets, no helpers, no javascripts while **rails generate**)
* added development gems: **vendorer**, **pry**, **better_errors**, **binding_of_caller**, and **quiet_assets**
* **vendorer init** for Vendorfile creating
* and initial commit

### Usage

Just run in console 

    rails new your_awesome_app_name -T -d postgresql --skip-bundle -m https://raw.github.com/vredniy/my-rails-app-template/master/template.rb
