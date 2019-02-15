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
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    
    var searchController = UISearchController(searchResultsController: nil)
    public var completion: ((_ selectedCountry: Country) -> Void)?
    
    public var viewConfig: CountryPickerVisualConfig?
   
    class var bundle: Bundle? {
        let podBundle = Bundle(for: CountryPicker.self)
        print(podBundle)
        guard let bundleURL = podBundle.url(forResource: "ALCountryPicker", withExtension: "bundle"), let fetchBundle = Bundle(url: bundleURL) else {
            return podBundle
        }
        print(fetchBundle)
        return fetchBundle
    }

    public func setUp(picker visualConfig: CountryPickerVisualConfig) {
        self.viewConfig = visualConfig
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        CountryManager.shared.loadCountries()
        self.setUpBackBarButton()
        self.setUpSearchbarController()
        self.setUpTableView()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    //Setup back button
    private func setUpBackBarButton() {
        backBarButton.tintColor = .blue
        backBarButton.title = "← Back"
        
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
        self.searchController.definesPresentationContext = true
        self.searchController.searchBar.placeholder = "Search country here.."
        
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    public class func present(on viewController: UIViewController, completion: @escaping (_ selectedCountry: Country) -> Void) {
        let storyBoard = UIStoryboard(name: "Main", bundle: bundle)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "CountryPicker") as? CountryPicker {
            vc.completion = completion
            let navVC = UINavigationController(rootViewController: vc)
            //navVC.setNavigationBarHidden(false, animated: false)
            viewController.navigationController?.present(navVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        print("Working")
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK: Table View DataSource
extension CountryPicker: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryManager.shared.filteredCountries.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            return UITableViewCell()
        }
        cell.setCountryData(country:  CountryManager.shared.filteredCountries[indexPath.row], lastSelectedCountry: CountryManager.shared.lastSelectedCountry)
        
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
        let countries = CountryManager.shared.filteredCountries
        DispatchQueue.global().async {
            let country = countries[indexPath.row]
            CountryManager.shared.lastSelectedCountry = country
            self.completion?(country)
        }
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Search Bar Delegate
extension CountryPicker: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        CountryManager.shared.setFilteredCountries(searchedCountry: searchBar.text)
        self.tableView.reloadData()
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}
