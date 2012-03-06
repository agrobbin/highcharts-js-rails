class Highcharts
  class PlotOptions
    class PlotType
      class Marker < Base

        def initialize(opts = {})
          @default = :enabled
          @suboptions = {
            :states => 'PlotOptions::PlotType::Marker::States'
          }
          super
        end

      end
    end
  end
end
