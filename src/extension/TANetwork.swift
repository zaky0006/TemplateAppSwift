//
//  TANetwork.swift
//  TemplateAppSwift
//
//  Created by bux on 2018/11/6.
//  Copyright © 2018 James. All rights reserved.
//

import Foundation

class TANetwork: NSObject {
    static let sharedInstance = TANetwork()
    private override init() {
        super.init()
    }

    func Get(path: String,success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            
            if let data = data {
                
                if let result = String(data:data,encoding:.utf8){
                    
                    success(result)
                }
            }else {
                
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    
    // MARK:- post请求
    func Post(path: String,paras: String,success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        
        request.httpBody = paras.data(using: .utf8)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            
            if let data = data {
                
                if let result = String(data:data,encoding:.utf8){
                    success(result)
                }
                
            }else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
}


