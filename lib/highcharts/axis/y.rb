class Highcharts
  class Axis
    class Y < Base

      def initialize(opts = {})
        @default = :title
        @suboptions = {
          :events => 'Axis::Events',
          :labels => 'Labels',
          :plotBands => 'Axis::PlotBands',
          :plotLines => 'Axis::PlotLines',
          :stackLabels => 'Axis::StackLabels',
          :title => 'Title'
        }
        super
      end

    end
  end
end
