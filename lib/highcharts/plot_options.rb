module Highcharts
  class PlotOptions < Base

    attr_accessor :type, :data_labels, :legend

    def to_s
      "#{type}: {" +
        [render_data_labels, render_legend].flatten.compact.join(',') +
      "}"
    end

    private
      def render_data_labels
        "dataLabels: {" +
          "enabled: #{data_labels == false ? 'false' : 'true'}" +
        "}"
      end

      def render_legend
        "showInLegend: #{legend ? 'true' : 'false'}"
      end

  end
end
