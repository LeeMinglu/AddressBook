//
//  ListController.swift
//  AddressBook
//
//  Created by 李明禄 on 2017/4/4.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class ListController: UITableViewController {
    

    var PersonList = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData { (list) in
            self.PersonList += list
            print(self.PersonList)
             //加载数据
            self.tableView.reloadData()
        }
        
    }

    private func loadData (completion: @escaping (_ result:[Person])->()) {
        DispatchQueue.global().async {
           
            print("正在努力加载中")
            
            var personList: [Person] = []
            
            for i in 0..<20 {
                let person = Person()
                person.name = "rock-\(i)"
                
                let phone = "186" + String(format: "\(arc4random_uniform(100000))" )
                person.phone = phone
                person.address = "beijing"
                
                personList.append(person)
            }
            
            DispatchQueue.main.async {
                completion(personList)
            }
            
        }
    }

 // MARK: 代理及数据源方法
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PersonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)

        let person = self.PersonList[indexPath.row]
        
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.phone
        
        return cell
    }
    @IBAction func newPerson(_ sender: Any) {
        performSegue(withIdentifier: "contact", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ContactController
        if let indexPath = sender as? IndexPath {
            vc.person = PersonList[indexPath.row]
            vc.completionCallback = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }

        }else {
            vc.completionCallback = {
                guard let p = vc.person else {
                    return
                }
                self.PersonList.insert(p, at: 0)
                
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "contact", sender: indexPath)
    }
    

}
