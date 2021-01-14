//
//  ViewFileScreen.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 13.01.2021.
//

import UIKit

class ViewFileScreen: UIViewController {
  var fileService = FileManagerService()
  lazy var textField: UITextField! = UITextField()
  var currentPath: URL
  
  init(currentPath: URL) {
    self.currentPath = currentPath
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
}
