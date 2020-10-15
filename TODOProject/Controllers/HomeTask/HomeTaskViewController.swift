//
//  HomeTaskViewController.swift
//  TODOProject
//
//  Created by Pawan  on 14/10/2020.
//

import UIKit

class HomeTaskViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var tblView: UITableView!
    
    
    //MARK: - Variable
    var arr = ["Dark Mode", "Remove Watermark", "Push Notification", "App Version","Share Ap","Rating","Tutorial Video"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    //MARK: - Setup
     func setupView () {
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "htcTableViewCell", bundle: nil), forCellReuseIdentifier: "htCell")
     }
}


//MARK: - UITableViewDelegate & DataSource
extension HomeTaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "htCell", for: indexPath) as! htTableViewCell
        cell.taskNameLabel.text = arr[indexPath.row]
        return cell
    }
}
