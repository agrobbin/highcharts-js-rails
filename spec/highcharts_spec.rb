require 'spec_helper'

describe Highcharts do

  its(:base_options) { should include('global', 'labels', 'lang', 'loading', 'navigation', 'pane') }
  its(:default_options) { should include('chart', 'colors', 'credits', 'legend', 'series', 'title', 'tooltip') }
  its('custom_options.keys') { should include('plotOptions', 'subtitle', 'xAxis', 'yAxis') }
  its('custom_options.values') { should include('PlotOptions', 'Title', 'Axis::X', 'Axis::Y') }

  its(:to_s) { should include("$(function(){new Highcharts.Chart({})});") }

  describe ".new" do
    context "when a block is passed" do
      it "should not raise error" do
        expect {
          Highcharts.new do |chart|
            chart.chart 'test_id'
          end
        }.to_not raise_error
      end
    end

    context "when a block is not passed" do
      it "should not raise error" do
        expect { Highcharts.new }.to_not raise_error
      end
    end
  end

  describe "#method_missing" do
    it "should raise an error when an invalid attribute is passed" do
      expect {
        Highcharts.new { |chart| chart.nonexistant_method test: true }
        }.to raise_error(NoMethodError)
    end

    it "should instantiate a new Base class" do
      Highcharts::Base.should_receive(:new).with(useUTC: true)
      Highcharts.new { |chart| chart.global useUTC: true }
    end

    it "should instantiate a new Chart class" do
      Highcharts::Chart.should_receive(:new).with('test_id')
      Highcharts.new { |chart| chart.chart 'test_id' }
    end

    it "should instantiate a new Axix::Y class" do
      Highcharts::Axis::Y.should_receive(:new).with(title: 'test')
      Highcharts.new { |chart| chart.yAxis title: 'test' }
    end

    it "should instantiate 2 new Series classes" do
      Highcharts::Series.should_receive(:new).with(name: 'test').twice
      Highcharts.new { |chart| chart.series [{name: 'test'}, {name: 'test'}] }
    end

    context "reading options" do
      subject { Highcharts.new { |chart| chart.global useUTC: true } }

      its(:global) { should be_an_instance_of(Highcharts::Base) }
      its('global.options') { should == {useUTC: true} }
    end
  end

end
