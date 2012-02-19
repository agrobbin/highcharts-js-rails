Highcharts JS Rails
===================

Easily configure a Highcharts JS chart for use in a Rails application.

Currently you are able to do the following:

* Configure multiple axes and series on a single chart
* Set a specific graph type for each individual series of data (available options include area, areaspline, bar, column, line, pie, scatter or spline) - default is line
* Customize the tooltip for the graph
* Configure the location and design of the legend
* Set the tick interval for a specific axis

Options
-------

To instantiate a new chart:

`chart = Highcharts::Chart.new`

The Highcharts::Chart class can receive a hash of the following options:

* container: string (required)
* title: string (required)
* subtitle: string
* xAxes: hash or array of hashes (required)
* yAxes: hash or array of hashes (required)
* legend: hash
* series: hash or array of hashes (required)
* tooltip: string

Both the `xAxes` and `yAxes` options can be either a single hash (meaning there is only one axis) or an array of hashes (for multiple-axis charts). Each hash can include the following options:

* title: string
* categories: array
* tickInterval: integer
* min: integer
* max: integer
* labels: hash
* opposite: boolean

The `categories` option's array of values will be automatically formatted based on its class.
The `tickInterval` option is only necessary if you want to override automatic tickInterval creation. If the option is not passed, the tickInterval will be calculated based on the amount of data passed to the attached `series`.
The `labels` option can receive a set of options that includes `prepend` and `append`.

The `legend` option for the Highcharts::Chart class can receive a hash of the following options:

* layout: string (possible values can be horizontal or vertical - default is horizontal)
* align: string
* verticalAlign: string
* x: integer
* y: integer
* borderWidth: integer

The `series` option for the Highcharts::Chart class can receive a hash of the following options:

* name: string
* type: string (possible values can be area, areaspline, bar, column, line, pie, scatter or spline - default is line)
* xAxis: integer (the index of the xAxis this series should be attached to)
* yAxis: integer (the index of the yAxis this series should be attached to)
* data: array

The `data` option's array of values will be automatically formatted as a float, if necessary. 

Example
--------

Ruby:

```
chart = Highcharts::Chart.new(
  :container => 'graph',
  :title => "Highcharts Example",
  :xAxes => {:categories => ['October 12', 'October 13', 'October 14']},
  :yAxes => [{:title => 'Impressions', :min => 0}],
  :series => [{:name => 'Impressions', :yAxis => 0, :type => 'line', :data => [100000, 122000, 127000]}],
  :legend => {:layout => 'vertical', :align => 'right', :verticalAlign => 'top', :x => -10, :y => 100, :borderWidth => 0},
  :tooltip => "'<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y"
)
<%= chart %>
```

HTML/ERB:

`<div id="graph" style="width: 400px; height: 200px;"></div>`