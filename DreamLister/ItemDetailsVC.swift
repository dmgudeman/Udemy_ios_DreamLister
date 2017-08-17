//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by David Gudeman on 8/16/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores = [Store]()
    
  override func viewDidLoad() {
        super.viewDidLoad()

      if let topItem = self.navigationController?.navigationBar.topItem {
        topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
      }
    
      storePicker.delegate = self
      storePicker.dataSource = self
    }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      let store = stores[row]
      return store.name
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return stores.count
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    // update when selected
  }
  
  
  
  

}
