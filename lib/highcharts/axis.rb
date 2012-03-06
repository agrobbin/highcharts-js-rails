class Highcharts
  class Axis < Base

    def initialize(opts = {})
      @suboptions = (@suboptions || {}).merge({
        :events => 'Axis::Events',
        :labels => 'Labels',
        :plotBands => 'Axis::PlotBands',
        :plotLines => 'Axis::PlotLines',
        :title => 'Title'
      })
      super
    end

  end
end
