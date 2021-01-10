//
//  ViewController.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import UIKit

class MainScreen: UIViewController {

  var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView = UITableView(frame: view.bounds)
    view.backgroundColor = .red
//    tableView.dataSource = self
//    tableView.delegate = self
    
    let addDirectoryImage = UIImage(named: "addDirectory")
    let createFolderBarButtonItem = UIBarButtonItem(image: addDirectoryImage, style: .plain, target: nil, action: nil)
    let addFileImage = UIImage(named: "addFile")
    let createFileBarButtonItem = UIBarButtonItem(image: addFileImage, style: .plain, target: nil, action: nil)
    navigationItem.rightBarButtonItems = [createFileBarButtonItem, createFolderBarButtonItem]
    let fileService = FileManagerService()
    print(fileService.getURL(for: .Documents))
  }
  



}

