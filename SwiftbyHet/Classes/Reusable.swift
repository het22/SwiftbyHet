//
//  Reusable.swift
//  Pods
//
//  Created by Het Song on 05/08/2019.
//

import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
