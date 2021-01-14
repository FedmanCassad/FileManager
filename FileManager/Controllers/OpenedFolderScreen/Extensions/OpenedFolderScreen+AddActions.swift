//
//  File.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 14.01.2021.
//

import UIKit

extension OpenedFolderScreen {
  
  override func addFile(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Create file", message: "Enter file name", preferredStyle: .alert)
    alert.addTextField()
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      guard let createdFileName =  self.fileService.createFile(with: "\(name).txt", containing: "Hello world!", at: self.currentPath) else { return }
      for (index, item) in self.dataSource.enumerated() where item == createdFileName {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .middle)
        self.tableView.endUpdates()
      }
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  override func addFolder(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Create directory", message: "Enter directory name", preferredStyle: .alert)
    alert.addTextField()
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      guard let createdFolderName = self.fileService.createFolder(with: name, at: self.currentPath) else { return }
      for (index, item) in self.dataSource.enumerated() where item == createdFolderName {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .middle)
        self.tableView.endUpdates()
      }
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
}
