require_relative '../lib/main'

describe CreditCard do
  it "should take a Credit Card number as initial argument" do
    cc = CreditCard.new(4111111111111111)
    cc.kind_of?(CreditCard).should be_true
  end
  
  it "should set type to AMEX when the number begins with 34 or 37 and is 15 digits long" do
    cc = CreditCard.new(378282246310005)
    cc.type.should eql 'AMEX'
  end
  
  it "should set type to Discover when the number begins with 6011 and is 16 digits long" do
    cc = CreditCard.new(6011111111111117)
    cc.type.should eql 'Discover'
  end

  it "should set type to MasterCard when the number begins with 51 or 55 and is 16 digits long" do
    cc = CreditCard.new(5105105105105100)
    cc.type.should eql 'MasterCard'
  end

  it "should set type to Visa when the number begins with 4 and is 13 or 16 digits long" do
    cc = CreditCard.new(4111111111111111)
    cc.type.should eql 'Visa'
  end  
end