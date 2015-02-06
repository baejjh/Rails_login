class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates :reply,		:presence => true
end
