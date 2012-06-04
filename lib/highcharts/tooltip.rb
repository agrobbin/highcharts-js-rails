class Highcharts
  class Tooltip < Base

    def initialize(opts = {})
      @default = :enabled
      @skip_quotation = [:formatter, :positioner]
      super
    end

  end
end