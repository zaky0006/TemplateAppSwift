//
//  TANetwork.swift
//  TemplateAppSwift
//
//  Created by 湛奇 on 2018/11/9.
//  Copyright © 2018 James. All rights reserved.
//

import UIKit

struct getObject:Codable {
    var url :String?
    var origin :String?
    //        var args :Array<String>?
    var headers : HeaderDic?
    //
}
struct HeaderDic:Codable {
    var Accept :String?
    var Connection:String?
    var AcceptEncoding :String?
    enum CodingKeys: String, CodingKey {
        case AcceptEncoding = "Accept-Encoding"
        case Accept
        case Connection
    }
}


class TANetwork: NSObject {
    static let sharedInstance = TANetwork()
    private override init() {
        super.init()
    }
    var session = URLSession.init(configuration: .default)
    
    let size = CGSize(width: 100, height: 100)

    func getReq(urlSuffix:String?,
                headers:Dictionary<String, Any>?,parameters:Dictionary<String, Any>?) -> URLSessionDataTask?{
        // 设置URL
        var url = "http://httpbin.org/get"
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert(charactersIn: "#")
        charSet.insert(charactersIn: ":")
        charSet.insert(charactersIn: "/")
        charSet.insert(charactersIn: "?")
        let encodingURL = url.addingPercentEncoding(withAllowedCharacters: charSet)!

        print(encodingURL)
        let nsurl = URL.init(string: encodingURL)
        var UrlRequest = URLRequest(url: nsurl!)
        UrlRequest.httpMethod = "GET"
        // 创建一个网络任务
        let task = session.dataTask(with: UrlRequest) {(data, response, error) in
            do {
                
                let jsonDecoder = JSONDecoder()
                let modelObject = try? jsonDecoder.decode(getObject.self, from: data!)
                print(modelObject)
                
                
//                 返回的是一个json，将返回的json转成字典r
              let r = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                print("------------")
                print(r)
            } catch {
                // 如果连接失败就...
                print("无法连接到服务器")
            }
 
        }
        
        return task
        // 运行此任务
//        task.resume()
        
    }
}


