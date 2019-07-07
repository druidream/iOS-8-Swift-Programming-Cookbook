//
//  PopoverTableViewController.swift
//  Presenting Temporary Information on the Screen with Popovers
//
//  Created by Vandad Nahavandipoor on 8/1/14.
//  Copyright (c) 2014 Pixolity Ltd. All rights reserved.
//
//  These example codes are written for O'Reilly's iOS 8 Swift Programming Cookbook
//  If you use these solutions in your apps, you can give attribution to
//  Vandad Nahavandipoor for his work. Feel free to visit my blog
//  at http://vandadnp.wordpress.com for daily tips and tricks in Swift
//  and Objective-C and various other programming languages.
//  
//  You can purchase "iOS 8 Swift Programming Cookbook" from
//  the following URL:
//  http://shop.oreilly.com/product/0636920034254.do
//
//  If you have any questions, you can contact me directly
//  at vandad.np@gmail.com
//  Similarly, if you find an error in these sample codes, simply
//  report them to O'Reilly at the following URL:
//  http://www.oreilly.com/catalog/errata.csp?isbn=0636920034254

import UIKit

extension Array{
  subscript(path: IndexPath) -> Any{
    return self[path.row]
  }
}

extension NSIndexPath{
  class func firstIndexPath() -> NSIndexPath{
    return NSIndexPath(row: 0, section: 0)
  }
}

class PopoverTableViewController: UITableViewController {
  
  struct TableViewValues{
    static let identifier = "Cell"
  }
  
  /* This variable is defined as lazy so that its memory is allocated
  only when it is accessed for the first time. If we don't use this variable,
  no computation is done and no memory is allocated for this variable */
  lazy var items: [String] = {
    var returnValue = [String]()
    for counter in 1...100{
      returnValue.append("Item \(counter)")
    }
    return returnValue
  }()
  
  var cancelBarButtonItem: UIBarButtonItem!
    var selectionHandler: ((_ selectedItem: String) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UITableViewCell.classForCoder(),
      forCellReuseIdentifier: TableViewValues.identifier)
    
    cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain,
                                          target: self, action: Selector(("performCancel")))
    navigationItem.leftBarButtonItem = cancelBarButtonItem
    
  }
  
  func performCancel(){
    dismiss(animated: true, completion: nil)
  }
  
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    preferredContentSize = CGSize(width: 300, height: 200)
  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath]
        selectionHandler?(selectedItem as! String)
        dismiss(animated: true, completion: nil)

    }
  
    override func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewValues.identifier, for: indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel!.text = items[indexPath] as! String
        
        return cell
    }
  
}
