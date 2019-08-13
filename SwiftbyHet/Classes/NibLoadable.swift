//
//  NibLoadable.swift
//  Pods
//
//  Created by Het Song on 05/08/2019.
//

import UIKit

public protocol NibLoadable {}

public extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: nibName, bundle: bundle)
    }
    
    func loadViewFromNib() {
        guard let rootView = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        rootView.frame = self.bounds
        addSubview(rootView)
    }
}
