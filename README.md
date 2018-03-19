# Measurement Class in Apple Foundation Framework

## Description
This class is extemely useful for converting to/from various units of measure. 

## Uses
- Area, Mass, Power, Speed, Lenght, Volume, Duration, Pressure 
- Format with MeasurementFormater()

## Issues
It seems that some conversions are not precise enough in the base units and provide
a less than perfect answer.  

The one I found was converting Miles to Feet. It thinks 1 mile is 5279.98687664042 ft
I filed a bug at bugreporter.apple.com #38641535

## Resources
- https://developer.apple.com/documentation/foundation/measurementformatter
- https://www.sitepoint.com/using-measurementformatter/
- https://littlebitesofcocoa.com/277-measurementformatter-basics
- https://stackoverflow.com/questions/49373300/swift-measurement-convertto-miles-to-feet-gives-wrong-result