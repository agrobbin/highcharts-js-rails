class Highcharts
  class PlotOptions
    class PlotType
      class Events < Base

        def initialize(opts = {})
          @skip_quotation = [:click, :checkboxClick, :hide, :legendItemClick, :mouseOver, :mouseOut, :show]
          super
        end

      end
    end
  end
end
