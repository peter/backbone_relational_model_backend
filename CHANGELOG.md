```
cd ~/src/vendor
git clone https://github.com/rails/rails.git
~/src/vendor/rails/railties/bin/rails new backbone_relational_model_backend --edge --database=postgresql --force
rvm --rvmrc --create 1.9.3@backbone_relational_model_backend
# Rails 4 requires Ruby 1.9.3+.
ruby --version # => 1.9.3p194

bundle install --binstubs

createuser backbone_relational_model_backend
bin/rake -T
bin/rake db:create

bin/rails generate scaffold Blog name:string
bin/rake db:migrate

bin/rails generate scaffold Post title:string body:text blog:references
bin/rake db:migrate

	  
```
