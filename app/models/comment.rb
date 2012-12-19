class Comment < ActiveRecord::Base
  attr_accessible :content, :author_name
  belongs_to :commentable, polymorphic: true
end