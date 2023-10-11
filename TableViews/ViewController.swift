//
//  ViewController.swift
//  TableViews
//
//  Created by David C Santander on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let myCountries = ["Spain", "Mexico", "Peru", "Colombia", "Argentina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
            cell?.backgroundColor = .lightGray
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 18)
        }
        cell?.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
    
    
}

