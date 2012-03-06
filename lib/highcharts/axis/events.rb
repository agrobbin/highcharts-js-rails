class Highcharts
  class Axis
    class Events < Base

      def initialize(opts = {})
        @default = :setExtremes
        @skip_quotation = :setExtremes
        super
      end

    end
  end
end
