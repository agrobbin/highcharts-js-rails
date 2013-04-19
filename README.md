# Highcharts JS Rails

[![Build Status](https://secure.travis-ci.org/agrobbin/highcharts-js-rails.png?branch=master)](https://travis-ci.org/agrobbin/highcharts-js-rails) [![Dependency Status](https://gemnasium.com/agrobbin/highcharts-js-rails.png)](https://gemnasium.com/agrobbin/highcharts-js-rails)

Easily configure a Highcharts JS chart for use in a Rails application.

All major options in Highcharts are available to be used with Highcharts JS Rails. However, the exporting and navigation options are not yet built in. You will need to do those manually.

The Highcharts class's methods match up to the corresponding Highcharts options. Take a look at http://www.highcharts.com/ref/ for the full reference.

Many have a default option assigned to them. Those that have one are listed below:

* chart: renderTo (String)
* credits: enabled (Boolean)
* legend: enabled (Boolean)
* plotOptions.marker: enabled (Boolean)
* subtitle: text (String)
* title: text (String)
* xAxis: categories (Array)
* xAxis.events: setExtremes (function)
* xAxis.labels: enabled (Boolean)
* xAxis.title: text (String)
* yAxis: title (String)
* yAxis.events: setExtremes (function)
* yAxis.stackLabels: enabled (Boolean)
* yAxis.labels: enabled (Boolean)
* yAxis.title: text (String)

## xAxis Notes

* The `categories` option's array of values will be automatically formatted based on its class unless you pass :skip_category_formatting => true.
* The `tickInterval` option is only necessary if you want to override automatic tickInterval creation. If the option is not passed or :auto is passed, the tickInterval will be calculated based on the number of categories passed.

For the xAxis, yAxis, and series options, you must pass an array of hashes. Each of those hashes will be converted into the appropriate set of options.

## Example

Ruby:

```ruby
chart = Highcharts.new do |chart|
  chart.chart(renderTo: 'graph')
  chart.title('Highcharts Example')
  chart.xAxis(categories: ['October 12', 'October 13', 'October 14'])
  chart.yAxis(title: 'Impressions', min: 0)
  chart.series(name: 'Impressions', yAxis: 0, type: 'line', data: [100000, 122000, 127000])
  chart.legend(layout: 'vertical', align: 'right', verticalAlign: 'top', x: -10, y: 100, borderWidth: 0)
  chart.tooltip(formatter: "function(){ return '<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y; }")
end
```

HTML/ERB:

```html+erb
<%= chart %>
<div id="graph" style="width: 400px; height: 200px;"></div>
```
