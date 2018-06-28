//
//  NewsDetailUIViewController.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 27/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import UIKit
import SDWebImage

class NewsDetailUIViewController: UIViewController {

    @IBOutlet weak var detailLabel:UILabel!
    @IBOutlet weak var articleDetailIcon:UIImageView!

    var detailNews:String?
    var detailNewsImageUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailLabel.text = detailNews
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticleImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        articleDetailIcon.image = nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadArticleImage() {
        if let urlStr = detailNewsImageUrl {
            let url = URL(string: urlStr)
            //Image Cache using SDWebImage
            articleDetailIcon.sd_setShowActivityIndicatorView(true)
            articleDetailIcon.sd_setIndicatorStyle(.gray)
            articleDetailIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
        }
    }

}
