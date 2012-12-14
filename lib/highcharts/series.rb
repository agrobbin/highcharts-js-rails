class Highcharts
  class Series < Base

    def to_json
      @options[:data] = if options[:data].first.is_a?(Array) || options[:data].first.is_a?(Hash)
        options[:data].collect do |d|
          if d.is_a?(Array)
            [d.first, d.last.to_f]
          else
            d[:y] = d[:y].to_f
            d
          end
        end
      else
        options[:data].collect(&:to_f)
      end

      super
    end

  end
end
