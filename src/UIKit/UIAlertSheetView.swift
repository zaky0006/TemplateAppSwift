//
//  UIAlertSheetView.swift
//  TemplateAppSwift
//
//  Created by 湛奇 on 2018/11/12.
//  Copyright © 2018 James. All rights reserved.
//

import Foundation
import UIKit

enum UIAlertSheetViewStyle {
    case bottom
    case center
    case top
}

class UIAlertSheetView: UIView {
    
    class func showFrom(parentView:UIView!,subview:UIView!,style:UIAlertSheetViewStyle,completion: @escaping (_ result: [String])->()) ->(){
        let contentView = UIAlertSheetView()
        parentView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":contentView]))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":contentView]))
        
        let shadowBg = UIView()
        shadowBg.backgroundColor = .black
        shadowBg.alpha = 0.3
        contentView.addSubview(shadowBg)
        shadowBg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":shadowBg]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":shadowBg]))
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(btn)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":btn]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":btn]))
        btn.addTarget(contentView, action: #selector(tapAction(btn:)), for: .touchUpInside)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subview)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v1]-0-|", options: [], metrics: nil, views: ["v1":subview]))
        switch style {
        case .top:
            let cs = NSLayoutConstraint.init(item: subview, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
            contentView.addConstraint(cs)
        case .bottom:
            let cs = NSLayoutConstraint.init(item: subview, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
            contentView.addConstraint(cs)
        default:
            //.center
            let cs = NSLayoutConstraint.init(item: subview, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0)
            contentView.addConstraint(cs)
        }
    }
    
    @objc func tapAction(btn:UIButton!){
        self.removeFromSuperview()
    }
    
    
}


/* 调用示例
 loadData { (result) in
 print("获取json信息\(result)")
 }
 */
func loadData(completion: @escaping (_ result: [String])->()) -> () {
    DispatchQueue.global().async {
        print("耗时操作\(Thread.current)")
        Thread.sleep(forTimeInterval: 1.0);
        let json=["12","23","34"]
        DispatchQueue.main.async(execute: {
            print("主线程\(Thread.current)")
            completion(json)
        })
    }
}
