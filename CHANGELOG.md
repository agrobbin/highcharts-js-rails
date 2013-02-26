## v0.2.1 (2013-02-25) ##

* Loosen dependency on railties to allow 4.0.

## v0.2.0 (2013-01-07) ##

* Allow block syntax for Highcharts.new.
* Allow a Hash to be passed to xAxis, yAxis, or series instead of an Array of 1 Hash.
* Update Highcharts to 2.3.5.

## v0.1.11 (2012-12-13) ##

* Add support for series data point hashes. (Thanks tanelj!)
* Update Highcharts to 2.3.3.

## v0.1.10 (2012-09-06) ##

* Update Highcharts to 2.3.2.
* Take new parts of the API into account:
  * PlotOptions for arearange, areasplinerange, columnrange, and gauge.

## v0.1.9 (2012-06-21) ##

* Update Highcharts to 2.2.5.

## v0.1.8 (2012-06-14) ##

* Allow the additional assets to be easily accessible within a highcharts subdirectory.

## v0.1.7 (2012-06-04) ##

* Update Highcharts to 2.2.4.
* Take new parts of the API into account:
  * Legend.navigation suboption
  * Tooltip.positioner function

## v0.1.6 (2012-05-16) ##

* Update Highcharts to 2.2.3.

## v0.1.5 (2012-04-30) ##

* Update Highcharts to 2.2.2.

## v0.1.4 (2012-03-17) ##

* Take into account the fact that sometimes the data passed to a Series may be an array of arrays.
* Remove Highcharts::VERSION constant.

## v0.1.3 (2012-03-17) ##

* require Highcharts::Series.

## v0.1.2 (2012-03-17) ##

* We didn't change the Engine and Version files to make Highcharts a class instead of a module.

## v0.1.1 (2012-03-17) ##

* Update Highcharts to 2.2.1.
* Remove unnecessary .DS_Store files.

## v0.1.0 (2012-03-17) ##

* Near-complete rewrite of the entire gem. Now accepts all major Highcharts options, providing convenient help throughout the way.
* Bump dependency on railties to 3.1.
* Read the updated README to learn how to change your implementation to support the 0.1.x tree.

## v0.0.3 (2012-02-19) ##

* We should not be hiding credit to Highcharts.com on the charts.
* Fix core lib/ file name to load correctly.
* Fix Rails.env sourcing.

## v0.0.2 (2012-02-19) ##

* Whitespace now conforms to Rails conventions.
* require action_view in Highcharts::Base.
* Add line breaks after closing bracket (]) when not running in production environment.
* Privatize methods that are not being used outside of the class.

## v0.0.1 (2012-02-19) ##

* First release.
