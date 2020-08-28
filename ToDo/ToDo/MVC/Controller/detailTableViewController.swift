//
//  AddDetailTableViewController.swift
//  ToDo
//
//  Created by happy on 2020-06-24.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit
import CoreData

class detailTableViewController: UITableViewController {
    
    var nameToDo = DetailTableViewCell(placeholder: "Add task")
    var delegate: AddDetailTableViewControllerDelegate?
    var managedTask: Managed?
    var myTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add task"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        update()
    }
    
    func update() {
        guard let taskTitle = myTitle else { return }
        nameToDo.textField.text = taskTitle
    }
    
    @objc func cancel(_: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @objc func save(_: UIBarButtonItem) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        if let entity =  NSEntityDescription.entity(forEntityName: "Managed", in: managedContext) {
            managedTask = Managed(entity: entity, insertInto: managedContext)
            managedTask?.title = nameToDo.textField.text ?? ""
            managedTask?.isCompleted = false
            if let mTask = managedTask {
               delegate?.addTask(task: mTask)
           }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nameToDo
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

protocol AddDetailTableViewControllerDelegate {
    func addTask(task: Managed)
}
