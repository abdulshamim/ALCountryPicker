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
    
    var countries = [Country]()
    var filteredCountries = [Country]()
 
    
     //Load all countries
    func loadCountries() {
        self.countries = []
        self.filteredCountries = []
        
        var allFlags = Locale.isoRegionCodes.map({ String.emojiFlag(for: $0) ?? "" })
        
        for (index, countryCode) in Locale.isoRegionCodes.enumerated() {
            if isodialingCode.keys.contains(countryCode) {
                let country = Country(countryCode: countryCode, flag: allFlags[index])
                self.countries.append(country)
                self.filteredCountries.append(country)
            }
        }
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
    
    //Filter countrywith search string
    func setFilteredCountries(searchedCountry: String?) {
        if searchedCountry != "" {
            let searchString = searchedCountry?.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ".", with: "").lowercased()
            self.filteredCountries = self.countries.filter {
                $0.countryName.lowercased().contains(searchString!) ||
                    $0.countryCode.lowercased().contains(searchString!) ||
                    $0.dialingCode?.replacingOccurrences(of: "-", with: "").contains(searchString!) ?? false
            }
        } else{
             self.filteredCountries = self.countries
        }
    }
}

