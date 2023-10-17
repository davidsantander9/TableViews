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
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.backgroundColor = .lightGray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 18)
                cell?.accessoryType = .disclosureIndicator
            }
            cell?.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell?.mySecondLabel.text = myCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell!.mySecondLabel.text = "asdasda sadf asd asf asf asf asfds qwqwe qw uquh qwue qiuwe iuhqwiuqiuoiuh qwuiheqiuhweiquh "
        }
            
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}

