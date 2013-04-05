class Highcharts
  class Point < Base

    def initialize(opts = {})
      @suboptions = {
        events: 'Point::Events',
        marker: 'Base'
      }
      super
    end

  end
end
