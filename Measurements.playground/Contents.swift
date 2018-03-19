//: Measurements
/*
 
 This playground shows how to use the built in Measurement class to assign
 and convert to/from different types of measurments.  Don't do these conversions
 yourself, use Apple's implementation
 
*/

// Measure is a Foundation class so import it.
import Foundation
import PlaygroundSupport

// American Football Field
let footballFieldLength = Measurement(value: 100, unit: UnitLength.yards)

// This output puts the Units at the end
// in this case is puts the value, a space and they 'yd'
// It would be nice is you could adjust this to say 'yard(s)' in the class
print("Football Field Length: \(footballFieldLength)")

footballFieldLength.value
footballFieldLength.unit
footballFieldLength.debugDescription
footballFieldLength.description
footballFieldLength.hashValue // ???

// Convert to other units
footballFieldLength.converted(to: UnitLength.furlongs) // horses
footballFieldLength.converted(to: UnitLength.astronomicalUnits) // space
footballFieldLength.converted(to: UnitLength.inches) // America
footballFieldLength.converted(to: UnitLength.fathoms) // Boats
footballFieldLength.converted(to: UnitLength.meters) // everyone else

// Some formatting please
let kilometer = Measurement(value: 1, unit: UnitLength.kilometers)
let inches = kilometer.converted(to: UnitLength.inches)

let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal // this will use the thousands separator
numberFormatter.maximumFractionDigits = 4 // number of decimal points

if let string = numberFormatter.string(from: NSNumber(value: inches.value)) {
    print("One kilometer is \(string) inches")
}

// But wait theres more
// MeasurementFormatter()
// This will add the units behind the conveted number
// You can format the units

let measurementFormatter = MeasurementFormatter()
measurementFormatter.unitStyle = .long // .short .medium .long

// By default, our device locale being en_US is causing the distance to formatted with "miles" instead of "kilometers" (or our input value). We can change this with unitOptions:
measurementFormatter.unitOptions = [.providedUnit]

// Can also provide a numberFormatter to format just the number part
measurementFormatter.numberFormatter = numberFormatter


let miles = Measurement(value: 1, unit: UnitLength.miles)
// In my playground this equals 5279.98687664042 ft and I can't figure out why
// It should be 5280 ft  ¯\_(ツ)_/¯
// Ok now I know why thanks to this stackoverflow question...
// https://stackoverflow.com/questions/49373300/swift-measurement-convertto-miles-to-feet-gives-wrong-result

let milesToFeet = miles.converted(to: .feet)
measurementFormatter.string(from: milesToFeet)


let numberFormatter2 = NumberFormatter()
numberFormatter2.numberStyle = .decimal // this will use the thousands separator
numberFormatter2.maximumFractionDigits = 0 // number of decimal points

let measurementFormatter2 = MeasurementFormatter()
measurementFormatter2.numberFormatter = numberFormatter2
measurementFormatter2.unitOptions = [.providedUnit]
measurementFormatter2.unitStyle = .short
measurementFormatter2.string(from: milesToFeet)







