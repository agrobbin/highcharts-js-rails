class Highcharts
  class Series < Base

    def to_json
      @options[:data] = options[:data].first.is_a?(Array) ? options[:data].collect {|d| [d.first, d.last.to_f]} : options[:data].collect(&:to_f)
      super
    end

  end
end
