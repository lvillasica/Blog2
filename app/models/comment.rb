class Comment < ActiveRecord::Base
  validates_presence_of :email, :body
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  belongs_to :article, :foreign_key => "article_id"
  before_create :date_comment

  def date_comment
    self.comment_date = Time.now.strftime("%Y-%m-%d %I:%M")
  end
end
