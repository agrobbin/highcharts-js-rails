class Highcharts
  class Chart < Base

    def initialize(opts = {})
      @default = :renderTo
      super
    end

  end
end
