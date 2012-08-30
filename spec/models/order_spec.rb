require 'spec_helper'

describe Order do
  
  it { should have_db_column(:customer_id) }
  it { should have_db_column(:order_date) }

  it { should have_db_index(:customer_id) }
  it { should have_db_index(:order_date) }

  it { should belong_to(:customer) }
  it { should have_and_belong_to_many(:items) }
  
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:order_date) }
  
  it "should store in database  with valid attributes" do
    lambda{
      @order = FactoryGirl.create(:order)
      @order.save 
    }.should change{ Order.count }.by 1
  end
  
  xit "should have at least one item" do
    oder = Order.new
    #???
  end
  
end
