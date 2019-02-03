//
//  CountryManager.swift
//  CountryDemo
//
//  Created by Abdul Shamim on 18/01/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

class CountryManager {
    
    static let shared = CountryManager()
    
    var lastSelectedCountry: Country?
    var lastSelectedCountryIndex: Int?
    
    var searchActive = false
    var countries = [Country]()
    var filteredCountries = [Country]()
 
    func loadCountries() {
        self.searchActive = false
        self.countries = []
        self.filteredCountries = []
        
        var allFlags = Locale.isoRegionCodes.map({ String.emojiFlag(for: $0) ?? "" })
        
        for (index, countryCode) in Locale.isoRegionCodes.enumerated() {
            if isodialingCode.keys.contains(countryCode) {
                let country = Country(countryCode: countryCode, flag: allFlags[index])
                self.countries.append(country)
            }
            
           // newflags.append(allFlags[index])
        }
        
//        print(Locale.isoRegionCodes.count)
//        print(allFlags.count)
//        print(isodialingCode.count)
        
        self.getSelectedCountryIndex() 
    }
    
    
    func getSelectedCountryIndex() {
        for (index, country) in countries.enumerated()  {
            if country.countryCode == self.lastSelectedCountry?.countryCode {
                self.lastSelectedCountryIndex = index
                break
            }
        }
    }
}


//        var newflags = [String]()
//        for (index, dial) in Locale.isoRegionCodes.enumerated() {
//            if isodialingCode.keys.contains(dial) {
//                newflags.append(allFlags[index])
//            } else {
//                // print("\(Locale.isoRegionCodes[index]) at index \(index)")
//            }
//        }

