require 'spec_helper'
require 'extlib/time'

require 'json'

describe Time, "#to_json" do

  before do
    @sample   = Time.utc(2008, 3, 28, 22, 54, 20)
    @expected = "\"2008-03-28T22:54:20Z\""
  end

  it "should transform itself into a ISO 8601 compatible string" do
    Time.utc(2008, 3, 28, 22, 54, 20).to_json.should == @expected
    Time.xmlschema("2008-03-28T22:54:20Z").to_json.should == @expected
    Time.xmlschema("2008-03-28T17:54:20-05:00").to_json.should == @expected
  end

  it "should not raise exception when passed arguments" do
    lambda { @sample.to_json( :only => [:year] ) }.should_not raise_error
  end

  it "should not raise exception when contained in other object" do
    lambda { [ @sample ].to_json }.should_not raise_error
  end
end

describe Time, "#to_time" do
  it "should return a copy of its self" do
    time = Time.now
    time.to_time.should == time
  end
end

describe Time, "#to_datetime" do
  it "should return an equivalent DateTime" do
    time = Time.now
    time.to_datetime.should == DateTime.parse(time.to_s)
  end
end
