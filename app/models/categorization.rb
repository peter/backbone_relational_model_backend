class Categorization < ActiveRecord::Base
  belongs_to :categorizable, polymorphic: true
  belongs_to :category
  # attr_accessible :title, :body
end
