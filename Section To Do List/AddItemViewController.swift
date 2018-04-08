//
//  AddItemViewController.swift
//  Section To Do List
//
//  Created by Ian Yang on 3/26/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    weak var delegate: AddItemViewControllerDelegate?
    
    var t: String?
    var desc: String?
    var date: Date?
    var buttonText: String?
    var indexPath: IndexPath?
    
  
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
                delegate?.cancelButtonPressed(by: self)
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        delegate?.addListItem(title: titleTextField.text!, desc: descTextView.text!, date: datePicker.date, at: indexPath)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.descTextView.layer.borderWidth = 1.0
        self.titleTextField.text = t
        if let wrappedinput = date as? Date{
            self.datePicker.date = wrappedinput
        }
        self.descTextView.text = desc


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

protocol AddItemViewControllerDelegate: class {
    func addListItem(title: String, desc: String, date: Date, at indexPath: IndexPath?)
    func cancelButtonPressed(by controller: AddItemViewController)
    
}
