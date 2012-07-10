require_relative '../lib/main'

describe CreditCard do
  it "should take a Credit Card number as init argument" do
    cc = CreditCard.new(4111111111111111)
    cc.kind_of?(CreditCard).should be_true
  end
end