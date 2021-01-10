//
//  FileManager.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import Foundation

struct FileManagerService {
  

  
   func getURLForDocumentsDirectory() -> URL? {
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
              return nil
          }
         return url
  }
}
