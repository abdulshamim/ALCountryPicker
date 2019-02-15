# ALCountryPicker

[![CI Status](https://img.shields.io/travis/abdul.shamimkhan5@gmail.com/ALCountryPicker.svg?style=flat)](https://travis-ci.org/abdul.shamimkhan5@gmail.com/ALCountryPicker)
[![Version](https://img.shields.io/cocoapods/v/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)
[![License](https://img.shields.io/cocoapods/l/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)
[![Platform](https://img.shields.io/cocoapods/p/ALCountryPicker.svg?style=flat)](https://cocoapods.org/pods/ALCountryPicker)

## Country Picker
List of all countries with flag and dialling code. You serach country by name, region code and dialling code. 
 You can get you current country without opening country picker. For flag  [Emoji Unicode.Scalar](https://stackoverflow.com/questions/30402435/swift-turn-a-country-code-into-a-emoji-flag-via-unicode) is used.  


## Requirements
- iOS 10.0+
- Xcode 9+
- Swift 4+

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.



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
## ScreenShots
![img1](https://user-images.githubusercontent.com/13666188/52888485-d08e6780-31a1-11e9-8143-a6d6d9595259.png) ![img2](https://user-images.githubusercontent.com/13666188/52888492-dab06600-31a1-11e9-8edb-d2c7ac8ea631.png)

###### You can search country by Dialling Code, Region Code and Country Name.

![img4](https://user-images.githubusercontent.com/13666188/52889191-e0f41180-31a4-11e9-8098-7bc1ef6c7f32.png) ![img5](https://user-images.githubusercontent.com/13666188/52889196-e2bdd500-31a4-11e9-9018-1ed6b9879e46.png) ![img3](https://user-images.githubusercontent.com/13666188/52889199-e3ef0200-31a4-11e9-80e9-0cb06aabf2b6.png)


## Author
`Abdul Shamim Khan`
abdul.shamimkhan5@gmail.com

## License

ALCountryPicker is available under the MIT license. See the LICENSE file for more info.
