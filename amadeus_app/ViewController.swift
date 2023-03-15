//
//  ViewController.swift
//  amadeus_app
//
//  Created by MSA on 14/03/2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        self.registerTableViewCells()
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as? CountryTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}
