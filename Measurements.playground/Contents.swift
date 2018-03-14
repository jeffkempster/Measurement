//: Measurements
/*
 
 This playground shows how to use the built in Measurement class to assign
 and convert to/from different types of measurments.  Don't do these conversions
 yourself, use Apple's implementation
 
*/

// Measure is a Foundation class so import it.
import Foundation

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




