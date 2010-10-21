require 'spec_helper'

describe Dataset do
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :jobid => 1,
      :note => "value for note",
      :user => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Dataset.create!(@attr)
  end

  describe "validations" do

    it "should require a user id" do
      Dataset.new(@attr).should_not be_valid
    end

    it "should require nonblank id" do
      @user.datasets.build(:id => "  ").should_not be_valid
    end
  end
end
