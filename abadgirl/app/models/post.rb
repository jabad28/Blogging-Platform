class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :fashion
  belongs_to :beauty
end
