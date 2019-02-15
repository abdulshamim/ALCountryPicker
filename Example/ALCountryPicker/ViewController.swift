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

     @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentCountry = Country.current {
            self.countryLabel.text = currentCountry.flag + " " + currentCountry.countryName +  " (\(String(describing: currentCountry.dialingCode ?? "")))"
        }
        
        print()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openCountryPicker(_ sender: UIButton) {

        CountryPicker.present(on: self) { (country) in
            DispatchQueue.main.async {
                print(country.dialingCode ?? "")
                print(country.flag, "",country.countryName, "", country.countryCode)
                self.countryLabel.text = country.flag + " " + country.countryName +  " (\(String(describing: country.dialingCode ?? "")))"
            }
        }
    }
}

