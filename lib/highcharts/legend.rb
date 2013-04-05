class Highcharts
  class Legend < Base

    def initialize(opts = {})
      @default = :enabled
      @skip_quotation = :labelFormatter
      @suboptions = {
        navigation: 'Base'
      }
      super
    end

  end
end
