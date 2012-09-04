require 'spec_helper'

describe Customer do
  
  it { should have_db_column(:name) }

  it { should have_many(:orders) }
  it { should have_many(:items).through(:orders) }

  it { should validate_presence_of(:name) }

  it "should be user it the database with valid attributes" do
    lambda{
      @customer = FactoryGirl.create(:customer)
      @customer.save 
    }.should change{ Customer.count }.by 1
  end
  
  it "should find all the items they bought" do
    @customer = FactoryGirl.create(:customer)
    @order1 =  @customer.orders.create(:order_date => Time.zone.now)
      2.times do
        @order1.items << FactoryGirl.create(:item)
      end
      @order1.save
    @order2 =  @customer.orders.create(:order_date => Time.zone.now)
      3.times do
        @order2.items << FactoryGirl.create(:item)
      end
      @order2.save
    @customer.items.count.should == 5
  end

  it "should return a list of customers who ordered 2 or more items in the last 90 days" do
    @customer = FactoryGirl.create(:customer)
    @order =  @customer.orders.create(:order_date => Time.zone.now)
      2.times do
        @order.items << FactoryGirl.create(:item)
      end
      @order.save
    Customer.loyalty_program.should == [@customer]
  end
  
end

