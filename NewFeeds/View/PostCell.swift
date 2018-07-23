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
    
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
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
