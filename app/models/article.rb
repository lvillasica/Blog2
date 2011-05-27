class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_inclusion_of :status, :in => %w( Draft Posted )

  belongs_to :author, :foreign_key => "author_id"
  has_many :comments, :dependent => :delete_all
  
  before_save :fill_date

  def fill_date
    self.date_posted = Time.now.strftime("%Y-%m-%d %I:%M") if self.status.downcase.eql?("posted")
  end
end
