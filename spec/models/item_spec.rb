require 'spec_helper'

describe Item do
  
  it { should have_db_column(:name) }
  it { should have_db_column(:description) }
  it { should have_db_column(:price) }

  it { should have_and_belong_to_many(:orders) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_format_of(:price).with("0.01") }
  it { should validate_format_of(:price).with("1").with_message(/price is invalid/) }

  it "should store in database with valid attributes" do
    lambda{
      @item = FactoryGirl.create(:item)
      @item.save 
    }.should change{ Item.count }.by 1
  end
  
  xit "should retrieve a ranked list of most popular items" do
    valid_popular_list = []
    @item.popular.should == valid_popular_list
  end
end
