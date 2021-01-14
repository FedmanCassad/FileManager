//
//  ViewController.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import UIKit

class MainScreen: UIViewController {
  var tableView: UITableView!
  let fileService = FileManagerService()
  var dataSource: [String] {
    guard let path = fileService.documentsDirectoryURL?.path else {
      return Array<String>()}
    if var directory = try? fileService.contentsOfDirectory(atPath: path) {
      directory = {
        var temporaryFolderNamesArray = Array<String>()
        var temporaryFileNamesArray = Array<String>()
        for item in directory {
          let fullItemPath = fileService.documentsDirectoryURL?.appendingPathComponent(item)
          if let isFolder =  try? fullItemPath?.resourceValues(forKeys: [.isDirectoryKey]).isDirectory {
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
}

