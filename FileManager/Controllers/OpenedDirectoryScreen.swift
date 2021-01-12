//
//  OpenedDirectoryScreen.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 13.01.2021.
//

import UIKit

class OpenedFolderScreen: MainScreen {
  
  override var dataSource: [String] {
    if var directory = try? FileManager.default.contentsOfDirectory(atPath: currentPath.path) {
      directory = {
        var temporaryFolderNamesArray = Array<String>()
        var temporaryFileNamesArray = Array<String>()
        for item in directory {
          let fullItemPath = currentPath.appendingPathComponent(item)
          if let isFolder =  try? fullItemPath.resourceValues(forKeys: [.isDirectoryKey]).isDirectory {
            if isFolder {
              temporaryFolderNamesArray.append(item)
            }
            else {
              temporaryFileNamesArray.append(item)
            }
          }
        }
        temporaryFolderNamesArray.sort(by: <)
        temporaryFileNamesArray.sort(by: <)
        directory  = temporaryFolderNamesArray + temporaryFileNamesArray
        return directory
      }()
      return directory
    } else {
      return Array<String>()
    }
  }
  
  var currentPath: URL
  
  init(currentPath: URL) {
    self.currentPath = currentPath
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = currentPath.lastPathComponent
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func addFile(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Create file", message: "Enter file name", preferredStyle: .alert)
    alert.addTextField()
    let action = UIAlertAction(title: "Ok", style: .default) {[weak alert, weak self] _ in
      guard let alert = alert,
            let self = self else { return }
      guard let name = alert.textFields?[0].text else { return }
      self.fileService.createFile(with: "\(name).txt", containing: "Hello world!", at: self.currentPath)
      self.tableView.reloadData()
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
      self.fileService.createFolder(with: name, at: self.currentPath)
      self.tableView.reloadData()
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
      }
      return cell
    }()
    let fileName = dataSource[indexPath.row]
    if let fileIsDirectory = fileService.isDirectory(for: fileName, higherLevelPath: currentPath) {
      cell.imageView?.image = fileIsDirectory ? UIImage(named: "directory") : UIImage(named: "file")
    }
    cell.textLabel?.text = dataSource[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let fileName = dataSource[indexPath.row]
    if let fileIsDirectory = fileService.isDirectory(for: fileName, higherLevelPath: currentPath) {
      let vc = fileIsDirectory ? OpenedFolderScreen(currentPath: currentPath.appendingPathComponent(fileName)) : ViewFileScreen(currentPath: currentPath.appendingPathComponent(fileName))
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
}
