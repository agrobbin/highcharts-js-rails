class Highcharts
  class Series < Base

    def to_json
      @options[:data] = options[:data].collect(&:to_f)
      super
    end

  end
end
