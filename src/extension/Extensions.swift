//
//  Extensions.swift
//  TmplateAppSwfit
//
//  Created by bux on 2018/11/2.
//  Copyright © 2018 James. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
}


extension UIView{
    var x:CGFloat{
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var y:CGFloat{
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var width:CGFloat{
        set {
            self.frame.size.width = newValue
        }
        get {
            return self.frame.size.width
        }
    }
    
    var height:CGFloat{
        set {
            self.frame.size.height = newValue
        }
        get {
            return self.frame.size.height
        }
    }
}

extension UILabel{
    convenience init(color:UIColor,font:UIFont){
        self.init()
        self.textColor = color
        self.font = font;
    }
}

