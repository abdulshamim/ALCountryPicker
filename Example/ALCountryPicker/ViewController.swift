//
//  ViewController.swift
//  ALCountryPicker
//
//  Created by abdul.shamimkhan5@gmail.com on 01/25/2019.
//  Copyright (c) 2019 abdul.shamimkhan5@gmail.com. All rights reserved.
//

import UIKit
import ALCountryPicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openCountryPicker(_ sender: UIButton) {
//        let viewConfig = CountryPickerVisualConfig(.black, .red, .orange)
//        CountryPicker.present(on: self, viewConfig) { (country) in
//            print(country.dialingCode ?? "")
//            print(country.flag, "",country.countryName, "", country.countryCode)
//        }
        CountryPicker.present(on: self) { (country) in
            print(country.dialingCode ?? "")
            print(country.flag, "",country.countryName, "", country.countryCode)
        }
    }
}

