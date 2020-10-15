//
//  AddTaskViewController.swift
//  TODOProject
//
//  Created by Pawan  on 12/10/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class AddTaskViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var dateTimePicker: UITextField!
    @IBOutlet weak var timePicker: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var segmentHigh: UISegmentedControl!
    @IBOutlet weak var chooseTextField: UITextField!
    
    
    //MARK: - Variable
    let pickerView = UIPickerView()
    let picker = UIDatePicker()
    var countryList = ["Pawan", "Umer Khan", "Bilal Bhai", "Sharrukh Bhai" ,"Zia Bhai"]
    var selectedCountry: String?
    var segmentText = ""
    var Date = ""
    var time = ""
    var ref = DatabaseReference.init()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    //MARK: - Setup
     func setupView () {
        self.ref = Database.database().reference()
        
        pickerView.delegate = self
        
        firstView.layer.shadowRadius = 1
        firstView.layer.shadowOffset = .zero
        firstView.layer.shadowOpacity = 0.5
        firstView.layer.cornerRadius  = 4
        
        secondView.layer.shadowRadius = 1
        secondView.layer.shadowOffset = .zero
        secondView.layer.shadowOpacity = 0.5
        secondView.layer.cornerRadius  = 2
        
        thirdView.layer.shadowRadius = 1
        thirdView.layer.shadowOffset = .zero
        thirdView.layer.shadowOpacity = 0.5
        thirdView.layer.cornerRadius  = 4
        
        fourthView.layer.shadowRadius = 1
        fourthView.layer.shadowOffset = .zero
        fourthView.layer.shadowOpacity = 0.5
        fourthView.layer.cornerRadius  = 4
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        createPickerView()
        dismissPickerView()
        CreateToolBarDate()
        CreateToolBarTime()
     }
    
    
    //MARK: - Actions
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch segmentHigh.selectedSegmentIndex {
        
        case 0:
            NSLog("High selected")
            segmentHigh.selectedSegmentTintColor = .red
            segmentHigh.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
            segmentText = "High"
            
        //show popular view
        case 1:
            NSLog("Medium selected")
            segmentHigh.selectedSegmentTintColor = .yellow
            segmentText = "Medium"
        //show history view
        
        case 2:
            NSLog("Low selected")
            segmentHigh.selectedSegmentTintColor = .green
            segmentText = "Low"
        //show history view
        
        default:
            break;
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        var UID = ""
        guard let name = Auth.auth().currentUser?.uid else { return }
        UID = name
        
        let dict = ["Description": descriptionTextField.text!, "Set Priority": segmentText, "Date": Date, "Time": time,"Choose Assignee": chooseTextField.text! ]
        self.ref.child(UID).childByAutoId().setValue(dict)
        
        //            self.ref.child("SignUp").childByAutoId().setValue(dict)
        //
        //        }else{
        //            confirmpwdTextField.layer.borderColor = UIColor.red.cgColor
        //
        //        }
    }
    
    func CreateToolBarDate() {
        
        let toolbar  = UIToolbar()
        toolbar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(self.showDate))
        done.tintColor = UIColor.red
        toolbar.setItems([done], animated: false)
        dateTimePicker.inputAccessoryView = toolbar
        dateTimePicker.inputView = picker
        picker.datePickerMode = .dateAndTime
    }
    
    //MARK: - Objc Methods
    @objc func showDate() {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "E MM-dd-yyyy"
        
        let string = dateformatter.string(from: picker.date)
        dateTimePicker.text = string
        Date = dateTimePicker.text!
        
        self.view.endEditing(true)
    }
    //Time
    func CreateToolBarTime(){
        let toolbar  = UIToolbar()
        toolbar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(self.showTime))
        done.tintColor = UIColor.red
        toolbar.setItems([done], animated: false)
        timePicker.inputAccessoryView = toolbar
        timePicker.inputView = picker
        picker.datePickerMode = .dateAndTime
    }
    
    @objc func showTime() {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm a"
        
        let string = dateformatter.string(from: picker.date)
        timePicker.text = string
        time = timePicker.text!
        
        self.view.endEditing(true)
    }
}


//MARK: - UIPickerViewDelegate
extension AddTaskViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row]
        chooseTextField.text = selectedCountry
    }
    
    func createPickerView() {
        pickerView.delegate = self
        chooseTextField.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        chooseTextField.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate
extension AddTaskViewController: UITextFieldDelegate {
    
}
