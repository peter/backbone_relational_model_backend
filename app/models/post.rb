class Post < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :body, :title
end
