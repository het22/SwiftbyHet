//
//  NibLoadableView.swift
//  Pods
//
//  Created by Het Song on 13/08/2019.
//

import UIKit

open class NibLoadableView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        commonInit()
    }
    
    open func commonInit() { }
    
    final func loadViewFromNib() {
        let nibName = String(describing: type(of: self))
        guard let rootView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else { fatalError("Error loading \(self) from nib") }
        rootView.frame = self.bounds
        addSubview(rootView)
    }
}
