//
//  Extensions.swift
//  youtube
//
//  Created by Amy Turnah on 9/9/18.
//  Copyright © 2018 Amy. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for index in views.indices {  // had to be changed for new swift
            let key = "v\(index)"
            let view = views[index]
            view.translatesAutoresizingMaskIntoConstraints = false // this has to be set to false is constraints on a view is set in code
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


