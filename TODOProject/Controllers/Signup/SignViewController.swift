//
//  SignViewController.swift
//  TODOProject
//
//  Created by Pawan  on 10/10/2020.
//

import UIKit
import Firebase
import FirebaseAuth
#warning("all views setup is in viewDidLoad")

class SignViewController: UIViewController {
    
    
    //MARK: - Oultlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpwdTextField: UITextField!
    
    
    //MARK: - Variable
    var ref = DatabaseReference.init()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    //MARK: - Actions
    @IBAction func signUp(_ sender: UIButton) {
        
        //        let dict = ["Email": emailTextField.text!, "Password": passwordTextField.text!, "Confirm Password": confirmpwdTextField.text! ]
        //        if passwordTextField.text! == confirmpwdTextField.text! {
        //            passwordTextField.layer.borderColor = UIColor.green.cgColor
        //            confirmpwdTextField.layer.borderColor = UIColor.green.cgColor
        //            self.ref.child("SignUp").childByAutoId().setValue(dict)
        //
        //        }else{
        //            confirmpwdTextField.layer.borderColor = UIColor.red.cgColor
        //
        //        }
        let e = emailTextField.text!
        let p = passwordTextField.text!
        
        if !e.isEmpty && !p.isEmpty {
            
            if passwordTextField.text! == confirmpwdTextField.text! {
                
                passwordTextField.layer.borderColor = UIColor.green.cgColor
                confirmpwdTextField.layer.borderColor = UIColor.green.cgColor
                
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                    
                    if error != nil {
                        print(error?.localizedDescription ?? "Exception")
                        //                let controller = SignUpViewController()
                        //                controller.modalPresentationStyle = .overCurrentContext
                        //                self.present(controller, animated: true, completion: nil)
                        
                    } else {
                        print("Login - \(String(describing: authResult?.user.email))")
                    }
                }
                
            } else {
                confirmpwdTextField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        let controller = SignUpViewController()
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
}
