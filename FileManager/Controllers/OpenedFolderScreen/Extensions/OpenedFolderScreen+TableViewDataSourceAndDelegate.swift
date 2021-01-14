//
//  OpenedFolderScreen+TableViewDataSourceAndDelegate.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 14.01.2021.
//

import UIKit

extension OpenedFolderScreen {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
      }
      return cell
    }()
    let fileName = dataSource[indexPath.row]
    if let fileIsDirectory = fileService.isDirectory(for: fileName, higherLevelPath: currentPath) {
      cell.imageView?.image = fileIsDirectory ? UIImage(named: "directory") : UIImage(named: "file")
    }
    cell.textLabel?.text = dataSource[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let fileName = dataSource[indexPath.row]
    if let fileIsDirectory = fileService.isDirectory(for: fileName, higherLevelPath: currentPath) {
      let vc = fileIsDirectory ? OpenedFolderScreen(currentPath: currentPath.appendingPathComponent(fileName)) : ViewFileScreen(currentPath: currentPath.appendingPathComponent(fileName))
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      fileService.deleteFileOrFolder(at: currentPath.appendingPathComponent(dataSource[indexPath.row]))
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
}
