# Simple application template

* gem **slim-rails**
* **HomeController** for root route
* **README.rdoc** -> **README.md**
* **:ru** is a default locale
* added **config/database.yml** to **.gitignore**
* changed generators (no stylesheets, no helpers, no javascripts while **rails generate**)
* and initial commit

### Usage

Just run in console 

    rails new your_awesome_app_name -T -d postgresql --skip-bundle -m https://raw.github.com/vredniy/my-rails-app-template/master/template.rb
