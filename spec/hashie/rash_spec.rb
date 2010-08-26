require 'spec_helper'

describe Hashie::Rash do  
  before do 
    @original_hash = {
      "varOne" => 1, 
      "two" => 2, 
      :three => 3, 
      :varFour => 4, 
      "fiveHumpHumps" => 5, 
      :nested => {
        "NestedOne" => "One", 
        :two => "two",
        "nested_three" => "three"
      },
      "nestedTwo" => {
        "nested_two" => 22,
        :nestedThree => 23
      }
    }
    @rash = Hashie::Rash.new(@original_hash)
  end
  
  it "should inherit from mash" do
    @rash.is_a?(Hashie::Mash).should be_true
  end
  
  it "should create a new rash where all the keys are underscored instead of camelcased" do
    @rash.var_one.should == 1
    @rash.two.should == 2
    @rash.three.should == 3
    @rash.var_four.should == 4
    @rash.five_hump_humps.should == 5
    @rash.nested.nested_one.should == "One"
    @rash.nested.two.should == "two"
    @rash.nested.nested_three.should == "three"
    @rash.nested_two.nested_two.should == 22
    @rash.nested_two.nested_three.should == 23
  end
  
end
