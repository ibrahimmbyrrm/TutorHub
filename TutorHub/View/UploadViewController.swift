//
//  UploadViewController.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var costInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextView!
    @IBOutlet weak var addressInput: UITextView!
    @IBOutlet weak var locationInput: UITextField!
    @IBOutlet weak var educationTypePicker: UIPickerView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var titleInput: UITextField!
    var viewModel = UploadViewModel()
    var selectedType : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapToBlank = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapToBlank)
        educationTypePicker.delegate = self
        educationTypePicker.dataSource = self
        
    }
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func publishButtonClicked(_ sender: Any) {
        
        if titleInput.text != "" && nameInput.text != "" && selectedType != "" && locationInput.text != "" && addressInput.text != "" && phoneInput.text != "" && descriptionInput.text != "" && costInput.text != "" {
            FirebaseDataManager().saveData(title: titleInput.text!, name: nameInput.text!, location: locationInput.text!, type: selectedType!, address: addressInput.text!, description: descriptionInput.text!, phone: phoneInput.text!, cost: costInput.text!)
                clearTextFields()
                tabBarController?.selectedIndex = 0
        }else {
            self.present(Alerts().alertBox(title: "Error", message: "Please enter all informations"), animated: true)
        }
    }
    func clearTextFields() {
        titleInput.text = ""
        phoneInput.text = ""
        costInput.text = ""
        nameInput.text = ""
        selectedType = ""
        descriptionInput.text = ""
        addressInput.text = ""
        locationInput.text = ""
    }
    
}

extension UploadViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.pickerRowNumber()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.pickerTitles(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedType = viewModel.pickerTitles(index: row)
        print(selectedType!)
    }
}
