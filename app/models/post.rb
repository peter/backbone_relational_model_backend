class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :categories, through: :categorizations
  has_many :categorizations, as: :categorizable
  attr_accessible :body, :title
end
