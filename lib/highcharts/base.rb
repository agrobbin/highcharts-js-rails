require 'action_view'

module Highcharts
  class Base < ActionView::Base

    def initialize(*args)
      args.extract_options!.each {|arg, value| self.send("#{arg}=", value)}
    end

    def render_options(args)
      attrs = []
      args.each do |t, a|
        a.split.each do |option|
          attrs << "#{option}: #{t == :objects ? send(option) : "'#{send(option)}'"}" if send(option).present?
        end
      end
      attrs
    end

  end
end
