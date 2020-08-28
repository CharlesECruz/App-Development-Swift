//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by happy on 2020-06-24.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: FetchedResultsTableViewController, AddDetailTableViewControllerDelegate {
    
    lazy var fetchResultController: NSFetchedResultsController<Managed> = {
        let request: NSFetchRequest<Managed> = Managed.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
        let frc = NSFetchedResultsController<Managed>(
        fetchRequest: request,
        managedObjectContext: container!.viewContext,
        sectionNameKeyPath: "priority",
        cacheName: nil
        )
        frc.delegate = self
        return frc
    }()
    
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = editButtonItem
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    tableView.allowsMultipleSelectionDuringEditing = true
  }
    
    private func updateUI() {
      try? fetchResultController.performFetch()
      tableView.reloadData()
    }
  
  
  @IBAction func multipleDeletion(_ sender: Any) {
    if let selectedRows = tableView.indexPathsForSelectedRows {
        for path in selectedRows {
            let commit = fetchResultController.object(at: path)
            container!.viewContext.delete(commit)
            CoreDataManager.shared.saveContext()
        }
    }
  }
  
  @IBAction func addNewTask(_ sender: Any) {
    let newTask = detailTableViewController(style: .grouped)
    let embedNewTask = UINavigationController(rootViewController: newTask)
    newTask.delegate = self
    present(embedNewTask, animated: true, completion: nil)
  }
  
  func addTask(task: Managed) {
    self.fetchResultController.indexPath(forObject: task)
    CoreDataManager.shared.saveContext()
    dismiss(animated: true) {
        self.updateUI()
    }
}
    
    override func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
  
  
override func numberOfSections(in tableView: UITableView) -> Int {
  return fetchResultController.sections?.count ?? 1
}
    
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let sections = fetchResultController.sections, sections[section].numberOfObjects > 0 {
      return sections[section].numberOfObjects
    } else {
      return 0
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
    let todo = fetchResultController.object(at: indexPath)

    cell.taskLabel?.text = todo.title
    return cell
  }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
      if isEditing {
          return
      }
      let title = fetchResultController.object(at: indexPath).title
      let detailView = detailTableViewController(style: .grouped)
      let embedDetaiView = UINavigationController(rootViewController: detailView)

      detailView.title = title
      present(embedDetaiView, animated: true, completion: nil)
    }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if !isEditing {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
      tableView.cellForRow(at: indexPath)?.accessoryType = .detailDisclosureButton
    } else {
      tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
  }
}

