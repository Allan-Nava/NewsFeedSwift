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
                
                //print(xml["rss"].all)
                
                let all_items = xml["rss"].children[0]["item"]
                
                for item in all_items.all {
                    let single_post = Post(pubDate: item["pubDate"].element?.text, title: item["title"].element?.text, link: item["link"].element?.text, description: item["description"].element?.text)
                    //print(single_post)
                    posts.append(single_post)
                    print(posts)
                }
                
                print(posts)
                //return posts
            }
        
        }
        return posts
    }
    
    static func enumerateXML(indexer: XMLIndexer) {
        for child in indexer.children {
            print(child.element!.name)
            print(child.all)
            enumerateXML(indexer: child)
        }
    }
}
