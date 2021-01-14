//
//  ViewFileScreen+SetupUI.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 14.01.2021.
//

import UIKit

extension ViewFileScreen {
  
  func setupUI() {
    view.backgroundColor = .white
    if let data = fileService.readFile(at: currentPath) {
      textField.text = String(data: data, encoding: .utf8)
    }
    title = currentPath.lastPathComponent
    textField.frame.origin = CGPoint(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0)
    textField.sizeToFit()
    view.addSubview(textField)
  }
  
}
