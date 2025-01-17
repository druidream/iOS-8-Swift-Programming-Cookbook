//
//  ViewController.swift
//  Presenting Temporary Information on the Screen with Popovers
//
//  Created by Vandad Nahavandipoor on 6/27/14.
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

class ViewController: UIViewController {
  
  var selectedItem: String?
  
  lazy var popoverContentController: UINavigationController = {
    let controller = PopoverTableViewController(style: .plain)
    controller.selectionHandler = self.selectionHandler
    let navigationController = UINavigationController(
      rootViewController: controller)
    return navigationController
    }()
  
  lazy var popoverController: UIPopoverController = {
    return UIPopoverController(contentViewController:
      self.popoverContentController)
    }()
  
  func selectionHandler(selectedItem: String){
    self.selectedItem = selectedItem
    
    /* Do something with the selected item */
    
  }
  
  @IBAction func displayPopover(sender: UIBarButtonItem){
    popoverController.present(from: sender,
                              permittedArrowDirections: .any,
      animated: true)
  }
  
}

