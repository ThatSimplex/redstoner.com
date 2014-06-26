class Forumthread < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user_author, class_name: "User", foreign_key: "user_author_id"
  belongs_to :user_editor, class_name: "User", foreign_key: "user_editor_id"
  has_many   :threadreplies

  validates_presence_of :title, :author, :forum
  validates_presence_of :content
  validates_length_of :content, in: 5..10000

  accepts_nested_attributes_for :threadreplies

  def to_s
    title
  end

  def author
    @author ||= (user_author || User.first)
  end

  def editor
    @editor ||= (self.user_editor || User.first)
  end

  def edited?
    !!user_editor_id
  end

  def replies
    threadreplies
  end

  def can_read?(user)
    forum && forum.can_read?(user)
  end

  def can_write?(user)
    forum.can_write?(user) && (!locked? || user.mod?)
  end
end