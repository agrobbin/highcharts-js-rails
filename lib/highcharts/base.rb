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
    end

    def inspect
      "#<#{self.class}:0x#{object_id} #{options.inspect}>"
    end

    def method_missing(method, *args)
      # If there are arguments passed to this method, we want to set the option.
      if args.length > 0
        # If this method is an option that is available as a suboption to the current class,
        # let's set the option to an instance of that subclass.
        @options[method] = if suboptions.keys.include?(method)
          "Highcharts::#{suboptions[method]}".constantize.new(*args)
        # Otherwise, just extract the options passed to the method and set the option to that hash.
        else
          args.extract_options!
        end
      # Otherwise, just return the option's value.
      else
        options[method]
      end
    end

    # This method is used in the parent class, Highcharts, in order to render the options in a JavaScript-friendly (JSON) format.
    def to_json
      json = Rails.env.production? ? options.to_json : JSON.pretty_generate(options)

      if skip_quotation.present?
        Array.wrap(skip_quotation).each do |opt|
          # The first part of this regex matches the option's key, for example, if opt is formatter, it will match "formatter":
          # The second part will match anything within double quotes until it runs into either ",", "}", or a line break (the end of the json value)
          # It then replaces that key/value pair with an unquoted version.
          # Ex:
          # "formatter": "function(){ return 'test'; }"
          # becomes...
          # "formatter": function(){ return 'test'; }
          json = json.gsub(/"(#{opt})"\: ?"(.*?)"([,}\s])/i, '"\\1":\\2\\3')
        end
      end
      json
    end

  end
end
