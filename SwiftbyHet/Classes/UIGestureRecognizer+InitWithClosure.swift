//
//  UIGestureRecognizer+InitWithClosure.swift
//  Pods
//
//  Created by Het Song on 08/08/2019.
//

import UIKit

fileprivate var actionAssociationKey: UInt8 = 0

extension UIGestureRecognizer {
    
    public typealias Action = ()->Void
    
    private var action: Action? {
        get { return objc_getAssociatedObject(self, &actionAssociationKey) as? Action }
        set { objc_setAssociatedObject(self,
                                       &actionAssociationKey,
                                       newValue,
                                       .OBJC_ASSOCIATION_ASSIGN) }
    }
    
    @objc func execute() {
        if let action = self.action { action() }
    }
    
    public convenience init(action: @escaping Action) {
        self.init(target: nil, action: nil)
        self.action = action
        self.addTarget(self, action: #selector(execute))
    }
}
