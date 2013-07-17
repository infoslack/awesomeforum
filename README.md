#Awesomeforum

###This is a simple forum application in Ruby on Rails 4

Features:

      + User registration
      + Registration questions
      + Registration categories
      + Full text search with elasticsearch
      + Pagination

Require:

      Ruby 2.0
      Rails 4.0
      Redis
      Elasticsearch

Install and run:

      git clone git@github.com:infoslack/awesomeforum
      rename config/database.sample.yml to config/database.yml
      bundle install
      rake db:create && rake db:migrate
      rails s

Run tests:

      rake spec
