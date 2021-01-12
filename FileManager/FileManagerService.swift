//
//  FileManager.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import UIKit

struct FileManagerService {
  
  var documentsDirectoryURL: URL? {
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
      return nil
    }
    return url
  }
  
  var currentPath: URL?
  
  func createFolder(with name: String, at path: URL? = nil) {
    var url: URL? = path != nil ? path : documentsDirectoryURL
    url?.appendPathComponent(name)
    guard let safeURL = url else { return }
    try? FileManager.default.createDirectory(at: safeURL, withIntermediateDirectories: false, attributes: nil)
  }
  
  func createFile(with name: String, containing data: String, at path: URL? = nil) {
    var url: URL? = path != nil ? path : documentsDirectoryURL
    url?.appendPathComponent(name)
    guard let safeURL = url else { return }
    let isSucced = FileManager.default.createFile(atPath: safeURL.path, contents: data.data(using: .utf8), attributes: nil)
    if  !isSucced {
      print ("Error creating file")
    }
  }
  
  func isDirectory(for fileName: String, higherLevelPath: URL) -> Bool? {
    let pathToCheck = higherLevelPath.appendingPathComponent(fileName)
    guard let pathIsDirectory = try? pathToCheck.resourceValues(forKeys: [.isDirectoryKey]).isDirectory  else { return nil}
    return pathIsDirectory
  }
  
}
