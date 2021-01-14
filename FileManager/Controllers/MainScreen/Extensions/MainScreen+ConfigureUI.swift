//
//  MainScreen+ConfigureUI.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 14.01.2021.
//

import UIKit

extension MainScreen {
  
  @objc func setupUI() {
    title = "Documents"
    tableView = UITableView(frame: view.bounds)
    view.backgroundColor = .red
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    let addDirectoryImage = UIPictures.addDirectory.image
    let createFolderBarButtonItem = UIBarButtonItem(image: addDirectoryImage, style: .plain, target: self, action: #selector(addFolder(sender:)))
    let addFileImage = UIPictures.addFile.image
    let createFileBarButtonItem = UIBarButtonItem(image: addFileImage, style: .plain, target: self, action: #selector(addFile(sender:)))
    navigationItem.rightBarButtonItems = [createFileBarButtonItem, createFolderBarButtonItem]
  }
  
}
