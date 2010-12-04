require 'spec_helper'
require 'extlib/dictionary'

require 'json'

describe Dictionary do
  before :all do
    @sample_as_array = [:z,0,:a,1,:b,2,:c,3].freeze
    @sample          = Dictionary[ *@sample_as_array ].freeze
  end

  describe '#to_json' do

    it 'should serialize as ordered array' do
      @sample.to_json.gsub(/, /,',').should == @sample_as_array.to_json.gsub(/, /,',')
    end

    it "should not raise exception when passed arguments" do
      lambda { @sample.to_json( :only => [:year] ) }.should_not raise_error
    end

    it "should not raise exception when contained in other object" do
      lambda { [ @sample ].to_json }.should_not raise_error
    end

  end

end
