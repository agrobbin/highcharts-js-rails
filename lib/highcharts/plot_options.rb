class Highcharts
  class PlotOptions < Base

    def initialize(opts = {})
      @suboptions = {
        :area => 'PlotOptions::PlotType',
        :areaspline => 'PlotOptions::PlotType',
        :bar => 'PlotOptions::PlotType',
        :column => 'PlotOptions::PlotType',
        :line => 'PlotOptions::PlotType',
        :pie => 'PlotOptions::PlotType',
        :series => 'PlotOptions::PlotType',
        :scatter => 'PlotOptions::PlotType',
        :spline => 'PlotOptions::PlotType'
      }
      super
    end

  end
end
