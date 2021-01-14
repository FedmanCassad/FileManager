//
//  OpenedDirectoryScreen.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 13.01.2021.
//

import UIKit

final class OpenedFolderScreen: MainScreen {
  
  var currentPath: URL
  
  override var dataSource: [String] {
    if var directory = try? fileService.contentsOfDirectory(atPath: currentPath.path) {
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
  
  init(currentPath: URL) {
    self.currentPath = currentPath
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
