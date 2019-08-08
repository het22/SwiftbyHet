//
//  UITableView+Extension.swift
//  Pods
//
//  Created by Het Song on 05/08/2019.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell> (_: T.Type) where T: NibLoadable, T: Reusable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

