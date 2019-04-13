//
//  AddItemViewController.swift
//  HW_checklists
//
//  Created by sgcs on 2019. 4. 12..
//  Copyright © 2019년 KwangHee Lim. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEditing item: ChecklistItem)
}
class AddItemViewController: UITableViewController,UITextFieldDelegate {
    
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemToEdit = itemToEdit {
            title = "Edit Item"
            textField.text = itemToEdit.text
            doneBarButton.isEnabled = true
        }
    }
    
    /* Initial Keyboard */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    // MARK:- Actions
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")
        
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: itemToEdit)
            
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            
            delegate?.addItemViewController(self, didFinishAdding: item)
            
            //navigationController?.popViewController(animated: true
        }
        
    }
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        return true
    }
    
    /* clear Button*/
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
