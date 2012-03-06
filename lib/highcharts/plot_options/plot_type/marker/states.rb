class Highcharts
  class PlotOptions
    class PlotType
      class Marker
        class States < Base

          def initialize(opts = {})
            @suboptions = {
              :hover => 'Base',
              :select => 'Base'
            }
            super
          end

        end
      end
    end
  end
end
