module Highcharts
  class Series < Base

    attr_accessor :name, :type, :xAxis, :yAxis, :data

    def to_s
      rendered_options = render_options(:strings => 'name type', :objects => 'xAxis yAxis')
      return nil if rendered_options.length == 0
      "{" +
        [rendered_options, render_data].flatten.compact.join(',') +
      "}"
    end

    private
      def render_data
        "data: #{data.first.is_a?(Array) ? data : data.collect(&:to_f)}"
      end

  end
end
