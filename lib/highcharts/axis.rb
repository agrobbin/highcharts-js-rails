module Highcharts
  class Axis < Base

    attr_accessor :title, :categories, :tickInterval, :min, :max, :labels, :opposite

    def to_s
      "{" +
        [render_title, render_categories, render_tickInterval, render_options(:objects => 'min max opposite'), render_labels].flatten.compact.join(',') +
      "}"
    end

    private
      def render_title
        title.present? ? "title: {text: '#{title}'}" : nil
      end

      def render_categories
        return nil unless categories.present?
        "categories: [#{categories.collect {|c| "'#{format_category(c)}'"}.join(', ')}]" # need to encapsulate each category in quotes and format it before joining them with a comma
      end

      def render_tickInterval
        return tickInterval if tickInterval.present?
        return nil unless categories.present?
        "tickInterval: #{(Math.sqrt(categories.length) < 5 ? 1 : Math.sqrt(categories.length)).floor}"
      end

      def format_category(category)
        case category
        when Date
          category.strftime("%b. %d")
        when Time
          category.strftime("%H:%M")
        when DateTime
          category.strftime("%b. %d, %H:%M")
        else
          category.to_s
        end
      end

      def render_labels
        return nil unless labels.present?
        "labels: {" +
          "formatter: function(){ return '#{labels[:prepend]}' + this.value + '#{labels[:append]}'; }" +
        "}"
      end

  end
end
