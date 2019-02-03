//
//  CountryPickerVisualConfig.swift
//  CountryDemo
//
//  Created by Abdul Shamim on 21/01/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

public class CountryPickerVisualConfig {
    
    public var countryNameColor = UIColor.black
    public var dialingCodeColor = UIColor.black
    public var selectedCheckColor = UIColor.red
   
    public init() {
    }
    
    
    public init(_ countryNameColor: UIColor, _ dialingCodeColor: UIColor, _ selectedCheckColor: UIColor) {
        self.countryNameColor = countryNameColor
        self.dialingCodeColor = dialingCodeColor
        self.selectedCheckColor = selectedCheckColor
    }
}
