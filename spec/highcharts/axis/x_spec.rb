require 'spec_helper'

describe Highcharts::Axis::X do

  subject { Highcharts::Axis::X.new(options) }

  describe "#automate_tick_interval" do
    let(:options) { {categories: (1..50).to_a} }

    its(:to_json) { should include("\"tickInterval\":7") }

    context "when tickInterval is explicitly passed" do
      let(:options) { {tickInterval: 5} }

      its(:to_json) { should eq("\"tickInterval\":5") }
    end

    context "when tickInterval is :auto" do
      let(:options) { {categories: [1], tickInterval: :auto} }

      its(:to_json) { should include("\"tickInterval\":1") }
    end
  end

  describe "#format_category" do
    context "when :skip_category is passed" do
      let(:options) { {categories: [Date.new(2013, 1, 1)], skip_category_formatting: true} }

      its(:to_json) { should include("\"categories\":[\"2013-01-01\"]") }
    end

    context "dates" do
      let(:options) { {categories: [Date.new(2013, 1, 1), Date.new(2013, 2, 1)]} }

      its(:to_json) { should include("\"categories\":[\"Jan. 01\",\"Feb. 01\"]") }
    end

    context "full dates and times" do
      let(:options) { {categories: [Time.new(2013, 1, 1, 1, 1), Time.new(2013, 2, 1, 1, 1)]} }

      its(:to_json) { should include("\"categories\":[\"Jan. 01, 01:01\",\"Feb. 01, 01:01\"]") }
    end

    context "other types of categories" do
      let(:options) { {categories: [1, 2, 3, 4, 5]} }

      its(:to_json) { should include("\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\"]") }
    end
  end

end
