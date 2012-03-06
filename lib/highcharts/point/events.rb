class Highcharts
  class Point
    class Events < Base

      def initialize(opts = {})
        @skip_quotation = [:click, :mouseOver, :mouseOut, :remove, :select, :unselect, :update]
        super
      end

    end
  end
end
