//
//  MainScreen+ActionsForCreateFolderAndFile.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 11.01.2021.
//

import UIKit

extension MainScreen {
  
  @objc func addFolder(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Create directory", message: "Enter directory name", preferredStyle: .alert)
    alert.addTextField()
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      self.fileService.createFolder(with: name)
      self.tableView.reloadData()
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
  }
  @objc func addFile(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Create file", message: "Enter file name", preferredStyle: .alert)
    alert.addTextField()
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      self.fileService.createFile(with: "\(name).txt", containing: "Hello world!")
      self.tableView.reloadData()
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
  }
}
