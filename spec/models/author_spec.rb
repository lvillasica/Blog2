require 'spec_helper'

describe Author do
  before(:each) do
    @author = Author.new
  end
  it "should not be saved if last name is empty." do
    @author.last_name = nil    
    @author.first_name = "Leo"
    @author.should_not be_valid
  end
  it "should not be saved if first name is empty." do
    @author.last_name = "Villasica"
    @author.first_name = nil
    @author.should_not be_valid
  end
end
