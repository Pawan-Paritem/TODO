//
//  SignUpViewController.swift
//  TODOProject
//
//  Created by Pawan  on 09/10/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    //MARK: - Outlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    //MARK: - Variable
    var ref = DatabaseReference.init()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
         setupView()
        
    }
    
    
    //MARK: - Setup
     func setupView () {
        self.ref = Database.database().reference()
    
        emailTextField.layer.shadowOpacity = 3.0
        emailTextField.layer.shadowRadius = 1.5
        emailTextField.layer.shadowOffset = CGSize.zero // Use any CGSize
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.cornerRadius = 6
        emailTextField.layer.borderWidth = 1.0
        
        passwordTextField.layer.shadowOpacity = 3.0
        passwordTextField.layer.shadowRadius = 1.5
        passwordTextField.layer.shadowOffset = CGSize.zero // Use any CGSize
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 6
        passwordTextField.layer.borderWidth = 1.0
        
        signupButton.layer.cornerRadius = 8
     }
    
    
    //MARK: - Methods
    func login() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        if !email.isEmpty && !password.isEmpty {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
                
                if let u = authResult {
                    
                    let controller = TodayTaskViewController()
                    controller.modalPresentationStyle = .overCurrentContext
                    self!.present(controller, animated: true, completion: nil)
                    
                } else {
                    
                    let alert = UIAlertController(title: "Error", message: "Invalid Email or Password", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                        print("Action")
                    }))
                    self!.present(alert, animated: true, completion: nil)
                }
            })
            
        } else {
            // please enter email / password
        }
    }
    
    
    //MARK: - Actions
    @IBAction func signIn(_ sender: UIButton) {
        login()
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        let controller = SignViewController()
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
}
