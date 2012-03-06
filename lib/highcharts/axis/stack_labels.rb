class Highcharts
  class Axis
    class StackLabels < Base

      def initialize(opts = {})
        @default = :enabled
        @skip_quotation = :formatter
        super
      end

    end
  end
end
