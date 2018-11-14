//
//  ViewController.swift
//  TemplateAppSwift
//
//  Created by bux on 2018/11/2.
//  Copyright © 2018 James. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var label = UILabel.init(color: UIColor.blue, font: UIFont.systemFont(ofSize: 12))
        label.text = "this is a just label"
        self.view.addSubview(label)
        
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        let cs = NSLayoutConstraint.init(item: view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1.0, constant: 100)
        view.addConstraint(cs)
        UIAlertSheetView.showFrom(parentView: self.view, subview: view, style: .center){ (str) in
            
        }
    }

    
}



