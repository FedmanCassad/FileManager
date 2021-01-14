//
//  OpenedFolderScreen+SetupUI.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 14.01.2021.
//

import UIKit

extension OpenedFolderScreen {
  
  override func setupUI() {
    super.setupUI()
    title = currentPath.lastPathComponent
  }
  
}
