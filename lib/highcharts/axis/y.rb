class Highcharts
  class Axis
    class Y < Base

      def initialize(opts = {})
        @default = :title
        @suboptions = {
          :stackLabels => 'Axis::StackLabels'
        }
        super
      end

    end
  end
end
