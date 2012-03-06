class Highcharts
  class Axis
    class PlotBands < Base

      def initialize(opts = {})
        @suboptions = {
          :label => 'Base'
        }
        super
      end

    end
  end
end
