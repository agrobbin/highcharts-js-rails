require 'spec_helper'

describe Highcharts::Series do

  subject { Highcharts::Series.new(data: data) }

  context "when :data is an Array of Arrays" do
    let(:data) { [[1, 10], [2, 1000]] }

    its(:to_json) { should eq("\"data\":[[1,10.0],[2,1000.0]]") }
  end

  context "when :data is an Array of Hashes" do
    let(:data) { [{name: 'Test Value', y: 10}, {name: 'Test Value 2', y: 100}] }

    its(:to_json) { should eq("\"data\":[{\"name\":\"Test Value\",\"y\":10.0},{\"name\":\"Test Value 2\",\"y\":100.0}]") }
  end

  context "when :data is an Array of values" do
    let(:data) { [1, 2, 3, 4, 5] }

    its(:to_json) { should eq("\"data\":[1.0,2.0,3.0,4.0,5.0]") }
  end

end
