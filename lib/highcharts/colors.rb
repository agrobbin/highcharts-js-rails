class Highcharts
  class Colors < Base

    attr_reader :colors

    def initialize(options)
      @colors = Array.wrap(options)
    end

    def to_json
      colors.to_json
    end

  end
end
