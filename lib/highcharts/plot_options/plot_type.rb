class Highcharts
  class PlotOptions
    class PlotType < Base

      def initialize(opts = {})
        @suboptions = {
          :dataLabels => 'Labels',
          :events => 'PlotOptions::PlotType::Events',
          :marker => 'PlotOptions::PlotType::Marker',
          :point => 'Point',
          :states => 'PlotOptions::PlotType::States'
        }
        super
      end

    end
  end
end
