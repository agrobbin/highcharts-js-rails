module Highcharts
  class Legend < Base

    attr_accessor :layout, :align, :verticalAlign, :x, :y, :borderWidth

    def to_s
      rendered_options = render_options(:strings => 'layout align verticalAlign', :objects => 'x y borderWidth')
      return nil if rendered_options.length == 0
      "legend: {" +
        rendered_options.join(',') +
      "}"
    end

  end
end
