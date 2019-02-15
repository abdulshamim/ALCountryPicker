# ALCountryPicker

[![CI Status](https://img.shields.io/travis/abdul.shamimkhan5@gmail.com/ALCountryPicker.svg?style=flat)](https://travis-ci.org/abdul.shamimkhan5@gmail.com/ALCountryPicker)
[![Version](https://img.shields.io/cocoapods/v/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)
[![License](https://img.shields.io/cocoapods/l/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)
[![Platform](https://img.shields.io/cocoapods/p/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

CountryPicker.present(on: self) { (country) in
            DispatchQueue.main.async {
                print(country.dialingCode ?? "")
                print(country.flag, "",country.countryName, "", country.countryCode)
                self.countryLabel.text = country.flag + " " + country.countryName +  " (\(String(describing: country.dialingCode ?? "")))"
            }
        }

## Requirements

## Installation

ALCountryPicker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ALCountryPicker'
```

## Author

abdul.shamimkhan5@gmail.com, abdul.shamim@jungleworks.co

## License

ALCountryPicker is available under the MIT license. See the LICENSE file for more info.
