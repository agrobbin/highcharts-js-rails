class Highcharts
  class PlotOptions
    class PlotType
      class States < Base

        def initialize(opts = {})
          @suboptions = {
            hover: 'PlotOptions::PlotType::States::Hover'
          }
          super
        end

      end
    end
  end
end
