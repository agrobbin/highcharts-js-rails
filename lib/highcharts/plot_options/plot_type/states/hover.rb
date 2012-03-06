class Highcharts
  class PlotOptions
    class PlotType
      class States
        class Hover < Base

          def initialize(opts = {})
            @suboptions = {
              :marker => 'Base'
            }
            super
          end

        end
      end
    end
  end
end
