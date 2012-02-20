module Highcharts
  class Chart < Base
    include ActionView::Helpers

    attr_accessor :container, :title, :subtitle, :plot_options, :xAxes, :yAxes, :legend, :series, :tooltip

    def to_s
      check_required_fields

      javascript_tag do
        safe_concat("$(function(){" +
          "new Highcharts.Chart({" +
            render_all +
          "})" +
        "});")
      end
    end

    def render_all
      content = [render_container, render_titles, render_plot_options, render_axes, render_series, render_legend, render_tooltip].flatten.compact.join(",")
      if Rails.env.production?
        content
      else
        content.gsub(/(,|{|\[)/, "\\1\n").gsub(/(}|\])/, "\n\\1")
      end
    end

    def check_required_fields
      %w(container title series).each do |required_argument|
        raise ArgumentError, ":#{required_argument} must be passed" if send(required_argument).blank? || (send(required_argument).is_a?(Array) && send(required_argument).length == 0)
      end
    end

    def render_container
      "chart: {renderTo: '#{container}'}"
    end

    def render_titles
      %w(title subtitle).collect do |t|
        "#{t}: {text: '#{send(t)}'}" if send(t).present?
      end
    end

    def render_plot_options
      return nil unless plot_options.present?
      "plotOptions: {" +
        Array.wrap(plot_options).collect {|po| PlotOptions.new(po)}.join(',') +
      "}"
    end

    def render_axes
      result = %w(x y).collect do |axis|
        return nil unless send("#{axis}Axes").present?
        "#{axis}Axis: [" +
          Array.wrap(send("#{axis}Axes")).collect {|a| Axis.new(a)}.join(',') +
        "]"
      end
      result.compact.join(",")
    end

    def render_legend
      return nil unless legend.present?
      Legend.new(legend)
    end

    def render_series
      "series: [" +
        Array.wrap(series).collect {|s| Series.new(s)}.join(',') +
      "]"
    end

    def render_tooltip
      return nil unless tooltip.present?
      "tooltip: {" +
        "formatter: function(){ return #{tooltip}; }" +
      "}"
    end

  end
end
