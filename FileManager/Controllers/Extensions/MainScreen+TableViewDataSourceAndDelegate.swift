//
//  MainScreen+TableViewDataSourceAndDelegate.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 11.01.2021.
//

import UIKit

extension MainScreen: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
      }
      return cell
    }()
    let fileName = dataSource[indexPath.row]
    if let url = fileService.documentsDirectoryURL,
       let fileIsDirectory = fileService.isDirectory(for: fileName, higherLevelPath: url) {
      cell.imageView?.image = fileIsDirectory ? UIImage(named: "directory") : UIImage(named: "file")
    }
    cell.textLabel?.text = dataSource[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if var path = fileService.documentsDirectoryURL {
      path.appendPathComponent(dataSource[indexPath.row])
      let vc = OpenedFolderScreen(currentPath: path)
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
}
