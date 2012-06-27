```
# Get edge Rails source (master branch)
cd ~/src/vendor
git clone https://github.com/rails/rails.git

# Create rails app
~/src/vendor/rails/railties/bin/rails new backbone_relational_model_backend --edge --database=postgresql --force

# Create rvm gemset on Ruby 1.9.3 (Rails 4 requires Ruby 1.9.3+.)
rvm --rvmrc --create 1.9.3@backbone_relational_model_backend

# Install gem dependencies and put binaries under ./bin
bundle install --binstubs

# Set up database
createuser backbone_relational_model_backend
bin/rake -T
bin/rake db:create

# Blog model
bin/rails generate scaffold Blog name:string
bin/rake db:migrate

# Post model
bin/rails generate scaffold Post title:string body:text blog:references
bin/rake db:migrate

# Create repo on github
git init
git add .
git remote add origin git@github.com:peter/backbone_relational_model_backend.git	  
git push -u origin master

# Deploy to Heroku
# Add gem 'thin' to Gemfile
echo "web: bundle exec rails server thin -p \$PORT -e \$RACK_ENV" > Procfile
git add .; git commit -m "Added Procfile"; git push
heroku apps:create backbone-relational
gem install bundler --pre # http://railsapps.github.com/rails-heroku-tutorial.html
# Add ruby '1.9.3' to Gemfile
# https://devcenter.heroku.com/articles/rails3x-asset-pipeline-cedar
heroku logs --tail
git push heroku master
heroku run rake db:migrate
heroku restart
heroku apps:open
```
