//
//  CountryCell.swift
//  CountryDemo
//
//  Created by Abdul Shamim on 18/01/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var dialingCodeLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var selectedCheckColor = UIColor.red
    var countryNameColor = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(visualConfig: CountryPickerVisualConfig?){
        
        self.countryNameLabel.textColor = visualConfig?.countryNameColor
        self.dialingCodeLabel.textColor = visualConfig?.dialingCodeColor
        
        self.countryNameColor = visualConfig?.countryNameColor ?? UIColor.black
        self.selectedCheckColor = visualConfig?.selectedCheckColor ?? UIColor.red
    }
    
    func setCountryData(country: Country, lastSelectedCountry: Country?) {
        self.flagLabel.text = country.flag
        self.dialingCodeLabel.text = country.dialingCode
        
        if lastSelectedCountry != nil {
            if lastSelectedCountry?.countryName == country.countryName {
                self.countryNameLabel.attributedText = self.getAttributed(countryName: country.countryName)
            } else{
                self.countryNameLabel.text = country.countryName
            }
        } else {
            self.countryNameLabel.text = country.countryName
        }
    }
    
    func getAttributed(countryName: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let firstString = NSAttributedString(string: countryName, attributes: [NSAttributedString.Key.foregroundColor: countryNameColor])
        let secondString = NSAttributedString(string: "  ✓", attributes: [NSAttributedString.Key.foregroundColor: selectedCheckColor, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
    
        attributedString.append(firstString)
        attributedString.append(secondString)
        
        return attributedString
    }

}
