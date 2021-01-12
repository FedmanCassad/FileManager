//
//  ViewFileScreen.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 13.01.2021.
//

import UIKit

class ViewFileScreen: UIViewController {
  var fileService = FileManagerService()
  lazy var textField: UITextField! = {
    return $0
  }(UITextField())
  var currentPath: URL
  
  init(currentPath: URL) {
    self.currentPath = currentPath
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    view.backgroundColor = .white
    if let data = fileService.readFile(at: currentPath) {
      textField.text = String(data: data, encoding: .utf8)
    }
    title = currentPath.lastPathComponent
  }
  override func viewWillLayoutSubviews() {
    textField.frame.origin = CGPoint(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0)
    textField.sizeToFit()
    view.addSubview(textField)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
