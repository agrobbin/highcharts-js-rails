require 'action_view'

class Highcharts < ActionView::Base
  include ActionView::Helpers

  attr_reader :options, :base_options, :default_options, :custom_options

  def initialize
    @options = {}

    @base_options = %w(labels lang loading)
    @default_options = %w(chart colors credits legend point series symbols title tooltip)
    @custom_options = {
      'plotOptions' => 'PlotOptions',
      'subtitle' => 'Title',
      'xAxis' => 'Axis::X',
      'yAxis' => 'Axis::Y'
    }

    yield self
  end

  def inspect
    "#<#{self.class}:0x#{object_id} #{options.inspect}>"
  end

  def method_missing(method, *args)
    # We only want to allow the base + custom options to be constantized and instantiated
    if (base_options + default_options + custom_options.keys).include?(method.to_s)
      # If there are arguments passed to this method, we want to set the option.
      if args.length > 0
        # For xAxis, yAxis, and series, we need to take the array that is passed as the option
        # and for each value, instantiate a new class.
        @options[method] = if %w(xAxis yAxis series).include?(method.to_s)
          Array.wrap(args.first).collect {|v| determine_method_class(method).constantize.new(v)}
        # For all others, just instantiate the class with the original arguments.
        else
          determine_method_class(method).constantize.new(*args)
        end
      # Otherwise, just return the option's value.
      else
        options[method]
      end
    else
      raise NoMethodError
    end
  end

  # Called by default when you output the final chart. Spits out jQuery-encapsulated Highcharts JavaScript.
  # <% chart = Highcharts.new -%>
  # <%= chart %>
  def to_s
    javascript_tag "$(function(){" +
      "new Highcharts.Chart({" +
        to_json +
      "})" +
    "});"
  end

  private
    # Only to be used in the #to_s method of a Highcharts instance. Because the standard #to_json method
    # will not work the correct way (introspecting on the class and failing to simply call #to_json on each
    # subsequent class), we have to do it ourselves.
    def to_json
      options.collect {|k, v| "\"#{k}\":#{v.is_a?(Array) ? "[{#{v.collect(&:to_json).join('},{')}}]" : "{#{v.to_json}}"}"}.join(',')
    end

    # Figure out which class a specific method should map too. Ones within the base_options array will be Highcharts::Base.
    # Ones within the default_options array will be, if the method is title, Highcharts::Title.
    # When the method is within the custom_options array, it will be the corresponding value. For plotOptions, it will be Highcharts::PlotOptions.
    def determine_method_class(method)
      method = method.to_s
      "Highcharts::#{base_options.include?(method) ? 'Base' : default_options.include?(method) ? method.capitalize : custom_options[method]}"
    end

end
