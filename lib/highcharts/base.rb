require 'rails'

class Highcharts
  class Base

    attr_reader :options, :default, :skip_quotation, :suboptions

    def initialize(opts = {})
      @options = opts
      @suboptions ||= {}

      # We want to make sure that options in the end is actually a Hash of options, or an Array of hashes of options.
      # When default is defined in a subclass and the passed options are not a Hash or Array, we want to replace options
      # with a Hash where the only key/value pair is the default key and the options value.
      if !options.is_a?(Hash) || (options.is_a?(Array) && !options.first.is_a?(Hash))
        if default.present?
          @options = {default => options}
        else
          raise ArgumentError, "You must pass a Hash to #{self.class}. You passed #{options.inspect}"
        end
      end
      # If there is an option that is available as a suboption to the current class,
      # let's set the option to an instance of that subclass.
      options.each do |k, v|
        @options[k] = "Highcharts::#{suboptions[k]}".constantize.new(v) if suboptions.keys.include?(k)
      end
    end

    def inspect
      "#<#{self.class}:0x#{object_id} #{options.inspect}>"
    end

    # This method is used in the parent class, Highcharts, in order to render the options in a JavaScript-friendly (JSON) format.
    def to_json
      json = options.collect do |k, v|
        "\"#{k}\":" +
        (suboptions.keys.include?(k) && !v.is_a?(Array) ? '{' : '') +
        (v.is_a?(Array) && suboptions.keys.include?(k) ? "[{#{v.collect(&:to_json).join('},{')}}]" : check_quotation(k, v.to_json)) +
        (suboptions.keys.include?(k) && !v.is_a?(Array) ? '}' : '')
      end
      json.join(',')
    end

    # This method is used in #to_json to remove the first and last characters from an option's value.
    # In the end this removes the encapsulating quotation marks (") from a specific option, provided
    # it is included in the current class's skip_quotation array.
    def check_quotation(key, json)
      skip_quotation.present? && Array.wrap(skip_quotation).include?(key) ? json[1..-2] : json
    end

  end
end
