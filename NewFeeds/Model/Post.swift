//
//  Post.swift
//  NewFeeds
//
//  Created by Allan Nava on 23/07/18.
//  Copyright © 2018 Allan Nava. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

struct Post
{
    var pubDate: String?;
    var title: String?;
    var link: String?;
    var description: String?;
    
    static func fetchPosts() -> [Post]
    {
        var posts = [Post]()
        
        Alamofire.request("https://news.google.com/news?q=apple&output=rss", parameters: nil).response{ response in
            //print("Request: \(String(describing: response.request))")
            //print("Response: \(String(describing: response.response))")
            //print("Error: \(String(describing: response.error))")
                
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                //print("Data: \(utf8Text)")
                let xml = SWXMLHash.parse(utf8Text)
                for child in xml.children {
                    print(child.element!.name)
                }
                
                
            }
        
        }
    
        return posts
    
    }
}
