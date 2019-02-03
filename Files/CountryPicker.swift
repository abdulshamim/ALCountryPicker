//
//  CountryPicker.swift
//  CountryDemo
//
//  Created by Abdul Shamim on 18/01/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

public class CountryPicker: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var searchController = UISearchController(searchResultsController: nil)
    public var completion: ((_ selectedCountry: Country) -> Void)?
    
    public var viewConfig: CountryPickerVisualConfig?
   

    public func setUp(picker visualConfig: CountryPickerVisualConfig) {
        self.viewConfig = visualConfig
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        CountryManager.shared.loadCountries()
        self.setUpSearchbarController()
        self.setUpTableView()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    private func setUpTableView() {
        self.tableView.separatorStyle = .none
        if let lastSelectedCountryIndex = CountryManager.shared.lastSelectedCountryIndex {
            self.tableView.scrollToRow(at: IndexPath(row: lastSelectedCountryIndex, section: 0), at: .middle, animated: true)
        }
    }

    private func setUpSearchbarController() {
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.barStyle = .default
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.placeholder = "Search country name here.."
        
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    public class func present(on viewController: UIViewController, completion: @escaping (_ selectedCountry: Country) -> Void) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle(for: CountryPicker.self))
        if let vc = storyBoard.instantiateViewController(withIdentifier: "CountryPicker") as? CountryPicker {
            vc.completion = completion
           // vc.viewConfig = viewConfig ?? nil
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


//MARK: Table View DataSource
extension CountryPicker: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryManager.shared.searchActive ? CountryManager.shared.filteredCountries.count : CountryManager.shared.countries.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        let countries = CountryManager.shared.searchActive ? CountryManager.shared.filteredCountries : CountryManager.shared.countries
        cell.setCountryData(country: countries[indexPath.row], lastSelectedCountry: CountryManager.shared.lastSelectedCountry)
        
        cell.setUp(visualConfig: self.viewConfig)
        
        if indexPath.row % 2 == 0 {
            cell.containerView.backgroundColor = UIColor.white
        } else {
            cell.containerView.backgroundColor = UIColor(red: 226/255, green: 229/255, blue: 232/255, alpha: 0.7)
        }
        return cell
    }
}

//MARK: Table View Delegates
extension CountryPicker: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countries = CountryManager.shared.searchActive ? CountryManager.shared.filteredCountries : CountryManager.shared.countries
        CountryManager.shared.lastSelectedCountry = countries[indexPath.row]
        self.tableView.reloadData()
        self.navigationController?.popViewController(animated: true)
        self.completion?(countries[indexPath.row])
    }
}

//MARK: Search Bar Delegate
extension CountryPicker: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if searchBar.text != "" {
            CountryManager.shared.searchActive = true
            let searchString = searchBar.text?.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ".", with: "").lowercased()
            CountryManager.shared.filteredCountries = CountryManager.shared.countries.filter {
                $0.countryName.lowercased().contains(searchString!) ||
                $0.countryCode.lowercased().contains(searchString!) ||
                $0.dialingCode?.replacingOccurrences(of: "-", with: "").contains(searchString!) ?? false
            }
            
        } else {
           CountryManager.shared.filteredCountries = []
           CountryManager.shared.searchActive = false
        }
        self.tableView.reloadData()
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        CountryManager.shared.searchActive = false
        tableView.reloadData()
    }
}
