require 'spec_helper'

describe Article do
  before(:each) do
    @article = Article.new
  end
  it "should not be saved if title is empty." do
    @article.title = nil    
    @article.body = "Hey"
    @article.should_not be_valid
  end
  it "should not be saved if body is empty." do
    @article.title = "Hey"
    @article.body = nil
    @article.should_not be_valid
  end
  it "should not have invalid values for status." do
    @article.title = "Hey"
    @article.body = "yo"
    @article.status = "asds"
    @article.should_not be_valid
  end
  it "should have Draft or Posted as valid values for status." do
    @article.title = "Hey"
    @article.body = "yo"
    @article.status = "Posted"
    @article.should be_valid
  end
  it "should automatically fill date_posted if status is Posted." do
    @article.title = "Hey"
    @article.body = "yo"
    @article.status = "Posted"
    @article.save
    @article.date_posted.should_not be_nil
  end
  it "should have nil value for date_posted if status is Draft." do
    @article.title = "Hey"
    @article.body = "yo"
    @article.status = "Draft"
    @article.save
    @article.date_posted.should be_nil
  end
end
