require 'rails'

%w(base axis chart legend plot_options rails series version).each {|f| require "highcharts/#{f}"}
