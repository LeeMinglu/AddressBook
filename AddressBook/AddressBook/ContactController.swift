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
    
    var completionCallback:(()->())?
    
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
        
        if person == nil {
            person = Person()

        }
        self.person?.name = nameText.text
        self.person?.phone = phoneText.text
        self.person?.address = addressText.text
        
        //返回上一级界面
        navigationController?.popViewController(animated: true)
        
        //刷新数据
        completionCallback?()
        
        
    }
    
}
