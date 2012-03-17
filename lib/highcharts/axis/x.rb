class Highcharts
  class Axis
    class X < Base

      attr_reader :skip_category_formatting

      def initialize(opts = {})
        @default = :categories
        @suboptions = {
          :events => 'Axis::Events',
          :labels => 'Labels',
          :plotBands => 'Axis::PlotBands',
          :plotLines => 'Axis::PlotLines',
          :title => 'Title'
        }
        # Check to see if we want to skip automatic formatting of categories.
        @skip_category_formatting = true if opts.delete(:skip_category_formatting)
        super
      end

      def to_json
        @options[:categories] = options[:categories].collect {|c| format_category(c)} if options[:categories].present? && !skip_category_formatting
        automate_tick_interval if options[:tickInterval] == :auto || options[:tickInterval].blank?
        super
      end

      private
        # The tickInterval option for an Axis can be automatically calculated by highcharts-js-rails.
        # Either pass :auto to the :tickInterval option, or do not include the option.
        # This will only be calculated if the :categories option is passed to the Axis.
        def automate_tick_interval
          @options[:tickInterval] = (Math.sqrt(options[:categories].length) < 5 ? 1 : Math.sqrt(options[:categories].length)).floor if options[:categories].present?
        end

        # Used in the #to_json method to cleanly format the categories for this axis. Depending on the class
        # of the category, we will return a differently formatted string. Currently supports:
        #
        #   Date
        #   Time
        #   DateTime
        #
        # If the class of the category is none of the above, #to_s is returned.
        # You can prevent this by passing :skip_category_formatting => true to the Axis options.
        def format_category(category)
          case category
          when Date
            category.strftime("%b. %d")
          when Time || DateTime
          #   category.strftime("%H:%M")
          # when DateTime
            category.strftime("%b. %d, %H:%M")
          else
            category.to_s
          end
        end

    end
  end
end
