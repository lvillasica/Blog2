require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new
  end
  it "should not be saved if email is empty." do
    @comment.email = nil    
    @comment.body = "hahaha"
    @comment.should_not be_valid
  end
  it "should not be saved if body is empty." do
    @comment.email = "fx_great@yahoo.com"
    @comment.body = nil
    @comment.should_not be_valid
  end
  it "should accept valid email format" do
    @comment.email = "fx_great@yahoo.com"
    @comment.body = "haha"
    @comment.should be_valid
  end
end
