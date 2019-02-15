//
//  Country.swift
//  CountryDemo
//
//  Created by Abdul Shamim on 18/01/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import Foundation

public class Country {
    
    public var flag: String
    public var countryName: String
    public var countryCode: String
    
    //Get current country
    public class var current: Country? {
        if let countryCode = Locale.current.regionCode {
            if isodialingCode.keys.contains(Locale.current.regionCode ?? "") {
                let flag = String.emojiFlag(for: countryCode)
                let country = Country(countryCode: countryCode, flag: flag ?? "")
                CountryManager.shared.lastSelectedCountry = CountryManager.shared.lastSelectedCountry == nil ? country : nil
                return country
            }
        }
        return nil
    }
    
    open var dialingCode: String? {
        if let digitCountryCode = isodialingCode[countryCode] {
            return "+" + digitCountryCode
        }
        print("Please check your Constant file it not contain key for \(countryCode) with countryName: \(countryName)")
        return nil
    }
    
    init(countryCode: String, flag: String) {
        self.countryCode = countryCode
        self.flag = flag
        self.countryName = mapCountryName(countryCode)
    }
}

func mapCountryName(_ countryCode: String) -> String {
    let locale = NSLocale(localeIdentifier: NSLocale.preferredLanguages[0])
    let localisedCountryName = locale.displayName(forKey: NSLocale.Key.countryCode, value: countryCode)!
    return localisedCountryName
}


//print("\n-------------------------- ****************************** ----------------------------\n\n")

//let CP = String.emojiFlag(for: "CP")
//let DG = String.emojiFlag(for: "DG")
//let EA = String.emojiFlag(for: "EA")
//let IC = String.emojiFlag(for: "IC")
//let TA = String.emojiFlag(for: "TA")

//print("CP flag: ", CP)
//print("DG flag: ", DG)
//print("EA flag: ", EA)
//print("IC flag: ", IC)
//print("TA flag: ", TA)
//print("\n-------------------------- ****************************** ----------------------------\n\n")
//
