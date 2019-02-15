# ALCountryPicker

[![CI Status](https://img.shields.io/travis/abdul.shamimkhan5@gmail.com/ALCountryPicker.svg?style=flat)](https://travis-ci.org/abdul.shamimkhan5@gmail.com/ALCountryPicker)
[![Version](https://img.shields.io/cocoapods/v/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)
[![License](https://img.shields.io/cocoapods/l/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)
[![Platform](https://img.shields.io/cocoapods/p/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## ScreenShots
![img1](https://user-images.githubusercontent.com/13666188/52888485-d08e6780-31a1-11e9-8143-a6d6d9595259.png) ![img2](https://user-images.githubusercontent.com/13666188/52888492-dab06600-31a1-11e9-8edb-d2c7ac8ea631.png)
![img3](https://user-images.githubusercontent.com/13666188/52888550-1814f380-31a2-11e9-8e67-59f6b88cad97.png) ![img4](https://user-images.githubusercontent.com/13666188/52888553-1c411100-31a2-11e9-8221-60f7d9fc4d0f.png) ![img5](https://user-images.githubusercontent.com/13666188/52888554-1d723e00-31a2-11e9-8e41-5aba218cef8a.png)


## Requirements
Minimum iOS version: 10.0

Swift version: 4, 4.1, 4.2

## Installation

ALCountryPicker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ALCountryPicker'
```
## Getting Started
```ruby
import UIKit
import ALCountryPicker

class ViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentCountry = Country.current {
            self.countryLabel.text = currentCountry.flag + " " + currentCountry.countryName +  " (\(String(describing: currentCountry.dialingCode ?? "")))"
        }
        
    }

    @IBAction func openCountry(_ sender: UIButton) {
        CountryPicker.present(on: self) { (country) in
            DispatchQueue.main.async {
                print(country.dialingCode ?? "")
                print(country.flag, "",country.countryName, "", country.countryCode)
                self.countryLabel.text = country.flag + " " + country.countryName +  " (\(String(describing: country.dialingCode ?? "")))"
            }
        }
    }
    
}
```

## Author
Abdul Shamim Khan
abdul.shamimkhan5@gmail.com

## License

ALCountryPicker is available under the MIT license. See the LICENSE file for more info.
