//
//  ViewController.swift
//  TemplateAppSwift
//
//  Created by bux on 2018/11/2.
//  Copyright © 2018 James. All rights reserved.
//

import UIKit
import Masonry

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var label = UILabel.init(color: UIColor.blue, font: UIFont.systemFont(ofSize: 12))
        label.text = "this is a just label"
        self.view.addSubview(label)
        label.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.left.equalTo()(self.view.mas_centerX)?.offset()(20)
            make?.centerY.equalTo()(self.view)
        }
        
        
    }

    
}

