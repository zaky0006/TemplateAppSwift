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
        
        
//        TANetwork.sharedInstance.getReq(urlSuffix: nil, headers: nil, parameters: nil)?.resume()
        
        doit()
    }

    func doit() {
        let jsonString = """
{
    "type":"fruit",
    "size":{
               "width":150,
               "height":150
           },
    "title":"Apple",
    "url":"https:\\/\\/www.fruits.com\\/apple",
    "isSample":true,
    "metaData":{
                  "color":"green"
               }
}
"""
        if let jsonData = jsonString.data(using: .utf8)
        {
            let photoObject = try? JSONDecoder().decode(Photo.self, from: jsonData)
            
        }
    }
}

struct Photo: Codable
{
    //String, URL, Bool and Date conform to Codable.
    var title: String
    var url: URL
    var isSample: Bool
    
    //The Dictionary is of type [String:String] and String already conforms to Codable.
    var metaData: [String:String]
    
    //PhotoType and Size are also Codable types
    var type: PhotoType
    var size: Size
}

struct Size: Codable
{
    var height: Double
    var width: Double
}

enum PhotoType: String, Codable
{
    case flower
    case animal
    case fruit
    case vegetable
}

//Encoding Example
/*
let photoObject = Photo(title: "Hibiscus", url: URL(string: "https://www.flowers.com/hibiscus")!, isSample: false, metaData: ["color" : "red"], type: .flower, size: Size(width: 200, height: 200))
let encodedData = try? JSONEncoder().encode(photoObject)
*/

//Decoding Example
/*
let jsonString = """
{
"type":"fruit",
"size":{
"width":150,
"height":150
},
"title":"Apple",
"url":"https:\\/\\/www.fruits.com\\/apple",
"isSample":true,
"metaData":{
"color":"green"
}
}
"""
if let jsonData = jsonString.data(using: .utf8)
{
    let photoObject = try? JSONDecoder().decode(Photo.self, from: jsonData)
}
*/
