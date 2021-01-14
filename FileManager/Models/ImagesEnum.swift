//
//  ImagesEnum.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 14.01.2021.
//

import UIKit

enum UIPictures: String {
  case directory = "directory"
  case file = "file"
  case addDirectory = "addDirectory"
  case addFile = "addFile"
  var image: UIImage? {
    switch self {
      case .addDirectory:
        return UIImage(named: self.rawValue)
      case .directory:
        return UIImage(named: self.rawValue)
      case .file:
        return UIImage(named: self.rawValue)
      case .addFile:
        return UIImage(named: self.rawValue)
    }
  }
  
}
