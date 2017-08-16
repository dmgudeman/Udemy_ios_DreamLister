//
//  MainVC.swift
//  DreamLister
//
//  Created by David Gudeman on 8/15/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var segment: UISegmentedControl!
  
  var controller: NSFetchedResultsController<Item>!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    generateTestData()
    attemptFetch()
    
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    if let sections = controller.sections {
      return sections.count
    }
    return 0
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let sections = controller.sections {
      let sectionInfo = sections[section]
      return sectionInfo.numberOfObjects
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
    configureCell(cell: cell, indexPath: indexPath)
    return cell
  }
  
  func configureCell(cell: ItemCell, indexPath: IndexPath){
    let item = controller.object(at: indexPath)
    cell.configureCell(item: item)
  }
  
  func attemptFetch() {
    let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
    let dateSort = NSSortDescriptor(key: "created", ascending: false)
    fetchRequest.sortDescriptors = [dateSort]
    
    let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:  context, sectionNameKeyPath: nil, cacheName: nil)
      self.controller = controller
    do {
      try controller.performFetch()
    } catch {
      let error = error as NSError
      print("\(error)")
    }
  }
  
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
  }
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.endUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch(type) {
    case.insert:
      if let indexPath = newIndexPath {
        tableView.insertRows(at: [indexPath], with: .fade)
      }
      break
    case.delete:
      if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
      break
    case.update:
      if let indexPath = indexPath {
        let cell = tableView.cellForRow(at: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath)
      }
      break
    case.move:
      if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
      if let indexPath = newIndexPath {
        tableView.insertRows(at: [indexPath], with: .fade)
      }
      break
      
    }
      }
  
  func generateTestData() {
    let item = Item(context: context)
    item.title = "Macbook Pro"
    item.price = 1800
    item.details = "I can't until the September event, I hope they release new MBPs"
    
    let item2 = Item(context: context)
    item2.title = "Bose Headphones"
    item2.price = 300
    item2.details = "But man, its so nice to be able to block out everyone with the noise conceling tech"
    
    let item3 = Item(context: context)
    item3.title = "Tesla Model S"
    item3.price = 110000
    item3.details = "It is a beautiful car. I need all the extras"
    
    ad.saveContext()
  }

  
  
  
  
  
  
  

}

