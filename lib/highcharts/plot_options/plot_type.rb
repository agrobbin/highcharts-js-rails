class Highcharts
  class PlotOptions
    class PlotType < Base

      def initialize(opts = {})
        @suboptions = {
          dataLabels: 'Labels',
          dial: 'Base',
          events: 'PlotOptions::PlotType::Events',
          marker: 'PlotOptions::PlotType::Marker',
          pivot: 'Base',
          point: 'Point',
          states: 'PlotOptions::PlotType::States'
        }
        super
      end

    end
  end
end
