//
//  FileManager.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import UIKit

struct FileManagerService {
  let filesystemService = FileManager.default
  var documentsDirectoryURL: URL? {
    guard let url = filesystemService.urls(for: .documentDirectory, in: .userDomainMask).first else {
      return nil
    }
    return url
  }
  var currentPath: URL?
  
  func createFolder(with name: String, at path: URL? = nil) -> String? {
    var url: URL? = path != nil ? path : documentsDirectoryURL
    url?.appendPathComponent(name)
    guard let safeURL = url else { return nil }
    do {
      try filesystemService.createDirectory(at: safeURL, withIntermediateDirectories: false, attributes: nil)
    } catch let error {
      assertionFailure("Error creating directory: \(error.localizedDescription)")
      return nil
    }
    return name
  }
  
  func createFile(with name: String, containing data: String, at path: URL? = nil) -> String? {
    var url: URL? = path != nil ? path : documentsDirectoryURL
    url?.appendPathComponent(name)
    guard let safeURL = url else { return nil }
    let isSucced = filesystemService.createFile(atPath: safeURL.path, contents: data.data(using: .utf8), attributes: nil)
    if isSucced {
      return name
    }
    else {
      return nil
    }
  }
  
  func readFile(at url: URL) -> Data? {
    return filesystemService.contents(atPath: url.path)
  }
  
  func deleteFileOrFolder(at path: URL) {
    try? filesystemService.removeItem(at: path)
  }
  
  func isDirectory(for fileName: String, higherLevelPath: URL) -> Bool? {
    let pathToCheck = higherLevelPath.appendingPathComponent(fileName)
    guard let pathIsDirectory = try? pathToCheck.resourceValues(forKeys: [.isDirectoryKey]).isDirectory  else { return nil}
    return pathIsDirectory
  }
  
  func contentsOfDirectory(atPath path: String) throws -> [String] {
    try filesystemService.contentsOfDirectory(atPath: path)
  }
  
}
