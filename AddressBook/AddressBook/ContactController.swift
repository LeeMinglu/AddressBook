//
//  ContactController.swift
//  AddressBook
//
//  Created by 李明禄 on 2017/4/4.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class ContactController: UITableViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    
    var person: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if person != nil {
            nameText.text = person?.name
            phoneText.text = person?.phone
            addressText.text = person?.address
        }
        
    }

    @IBAction func saveBtn(_ sender: Any) {
        
    }
    
}
