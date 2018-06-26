//
//  ArticleTableViewCell.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var dateIcon:UIImageView!
    @IBOutlet weak var articleIcon:UIImageView!

    var article : Article? {
        didSet {
            
            guard let article = article else {
                return
            }
            
            titleLabel?.text = article.name
            byLineLabel?.text = article.byLineString
            if let date = article.publishedDate {
                dateLabel?.text = Utils.getStringFromDate(date: date)
           }
            
            if let urlStr = article.imageUrl {
                let url = URL(string: urlStr)
                //Image Cache using SDWebImage
                articleIcon.sd_setShowActivityIndicatorView(true)
                articleIcon.sd_setIndicatorStyle(.gray)
                articleIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellUI()
    {
        self.dateIcon?.image = #imageLiteral(resourceName: "date_icon")
        self.titleLabel?.textColor = kPrimaryTextColor
        self.byLineLabel?.textColor = kSecondryTextColor
        self.dateLabel?.textColor = kSecondryTextColor
    }
}
