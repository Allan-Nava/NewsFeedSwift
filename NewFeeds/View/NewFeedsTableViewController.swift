//
//  NewFeedTableViewController.swift
//  NewFeeds
//
//  Created by Allan Nava on 23/07/18.
//  Copyright © 2018 Allan Nava. All rights reserved.
//

import UIKit

class NewFeedsTableViewController: UITableViewController
{
    var posts: [Post]?;
    
    override func viewDidLoad() {
        self.fetchPosts();
        
        tableView.separatorColor        = .none
        
        //dynamic table view cell height
        tableView.estimatedRowHeight    = tableView.rowHeight
        tableView.rowHeight             = UITableViewAutomaticDimension
    }
    
    func fetchPosts()
    {
        self.posts = Post.fetchPosts()
        tableView.reloadData();
    }

}

extension NewFeedsTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        }else {
            return 0;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.post = self.posts?[indexPath.row]
        
        return cell
    }
}
