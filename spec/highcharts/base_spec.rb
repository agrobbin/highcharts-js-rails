require 'spec_helper'

describe Highcharts::Base do

  it "should raise an error when something besides a Hash or Array of Hashes is passed" do
    expect {
      Highcharts.new { |chart| chart.global 'test' }
    }.to raise_error(ArgumentError, "You must pass a Hash to Highcharts::Base. You passed \"test\"")
  end

  context "options" do
    subject {
      Highcharts.new do |chart|
        chart.chart 'test_id'
        chart.legend navigation: {test: true}
      end
    }

    its('chart.options') { should eq({renderTo: 'test_id'}) }
    specify { expect(subject.legend.options[:navigation]).to be_an_instance_of(Highcharts::Base) }
  end

  describe "default value" do
    subject { Highcharts::Base.new(true) }

    before { Highcharts::Base.any_instance.stub(:default).and_return(:test_1) }

    its(:to_json) { should eq("\"test_1\":true") }
  end

  describe "#to_json" do
    context "when it's a simple set of options" do
      subject { Highcharts::Base.new(test_1: true, test_2: false) }

      its(:to_json) { should eq("\"test_1\":true,\"test_2\":false") }
    end

    context "when there are suboptions" do
      subject { Highcharts::Base.new(test_1: true, test_2: {test_3: false}) }

      before { Highcharts::Base.any_instance.stub(:suboptions).and_return({test_2: 'Base'}) }

      its(:to_json) { should eq("\"test_1\":true,\"test_2\":{\"test_3\":false}") }
    end

    context "when an option is an array" do
      subject { Highcharts::Base.new(test_1: true, test_2: [{test_3: false}]) }

      its(:to_json) { should eq("\"test_1\":true,\"test_2\":[{\"test_3\":false}]") }
    end

    context "when a key should not be quoted" do
      subject { Highcharts::Base.new(test_1: "function(){ alert('test'); })") }

      before { Highcharts::Base.any_instance.stub(:skip_quotation).and_return([:test_1]) }

      its(:to_json) { should eq("\"test_1\":function(){ alert('test'); })") }
    end
  end

end
