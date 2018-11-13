//
//  CoreManager.swift
//  TemplateAppSwift
//
//  Created by bux on 2018/11/5.
//  Copyright © 2018 James. All rights reserved.
//

import Foundation

class CoreManager: NSObject {
    static let sharedInstance = CoreManager()
    private override init() {
        super.init()
    }
    
    var userName:String?
    var passWord:String?
    
    
}


