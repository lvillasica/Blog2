class Author < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  has_many :articles, :dependent => :delete_all

  def full_name
    "#{last_name}, #{first_name}"
  end
end
