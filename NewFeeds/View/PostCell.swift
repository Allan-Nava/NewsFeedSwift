//
//  PostCell.swift
//  NewFeeds
//
//  Created by Allan Nava on 23/07/18.
//  Copyright © 2018 Allan Nava. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell
{
    
    var post: Post!
    {
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI()
    {
    
    }
    
}
