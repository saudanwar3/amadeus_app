//
//  ViewController.swift
//  amadeus_app
//
//  Created by MSA on 14/03/2023.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: Variables
    var cityData:[Data] = [Data]()
    var filteredCityData:[Data] = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.layer.cornerRadius = 12.0
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        self.searchBar.delegate = self
        self.registerTableViewCells()
        self.cityData = self.loadJson(filename: "weather")!
        self.filteredCityData = self.cityData
        self.listTableView.reloadData()
    }

    private func registerTableViewCells() {
        let nib = UINib(nibName: "CountryTableViewCell",
                                  bundle: nil)
        self.listTableView.register(nib,
                                forCellReuseIdentifier: "CountryTableViewCell")
    }
}
// MARK: TableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as? CountryTableViewCell {
            cell.cityNameLbl.text = self.filteredCityData[indexPath.row].city.findname
            cell.flagImgView.image = UIImage(named: self.filteredCityData[indexPath.row].city.country.lowercased())
            let latitude:String = String(self.filteredCityData[indexPath.row].city.coord.lat)
            let longitude:String = String(self.filteredCityData[indexPath.row].city.coord.lon)
            cell.latLongLbl.text = "\(latitude) , \(longitude)"
            cell.tempLbl.text = String(self.filteredCityData[indexPath.row].main.temp)
            cell.countryLbl.text = self.filteredCityData[indexPath.row].city.country
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
// MARK: Searchbar Methods
extension ViewController: UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty == false {
            self.filteredCityData = self.cityData.filter({ $0.city.findname.contains(searchText.uppercased()) })
        }

        self.listTableView.reloadData()
    }
}
// MARK: Utility Methods
extension ViewController
{
    func loadJson(filename fileName: String) -> [Data]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Foundation.Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RootClass.self, from: data)
                return jsonData.data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
