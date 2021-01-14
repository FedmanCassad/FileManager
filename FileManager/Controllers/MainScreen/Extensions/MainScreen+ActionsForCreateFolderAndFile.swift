//
//  MainScreen+ActionsForCreateFolderAndFile.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 11.01.2021.
//

import UIKit

extension MainScreen {
  
  @objc func addFolder(sender: UIBarButtonItem) {
    let alert = createActionController(title: "CreatedDirectory", message: "Enter directory name")
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      guard let createdFolderName = self.fileService.createFolder(with: name) else { return }
      for (index, item) in self.dataSource.enumerated() where item == createdFolderName {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .middle)
        self.tableView.endUpdates()
      }
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @objc func addFile(sender: UIBarButtonItem) {
    let alert = createActionController(title: "CreatedDirectory", message: "Enter directory name")
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      guard let createdFileName =  self.fileService.createFile(with: "\(name).txt", containing: "Hello world!") else { return }
      for (index, item) in self.dataSource.enumerated() where item == createdFileName {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .middle)
        self.tableView.endUpdates()
      }
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func createActionController(title: String, message: String) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField()
    return alert
  }
  
}
