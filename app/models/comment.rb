class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  acts_as_votable
  has_ancestry

  validates :content, presence: true, length: { minimum: 10, maximimum: 1000 }

  after_create_commit { CommentBroadcastJob.perform_later(self) }

end
