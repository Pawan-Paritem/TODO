//
//  TodayTaskViewController.swift
//  TODOProject
//
//  Created by Pawan  on 12/10/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class TodayTaskViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var plusButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()


        
        guard let name = Auth.auth().currentUser?.email
        else {
            return
            }
        DispatchQueue.main.async {
            self.nameLabel.text  = name
                    }
       
    }
    @IBAction func plusButton(_ sender: UIButton) {
        let addTaskController  = AddTaskViewController()
        addTaskController.modalPresentationStyle = .overCurrentContext
        present(addTaskController, animated: false, completion: nil)
    }
}
