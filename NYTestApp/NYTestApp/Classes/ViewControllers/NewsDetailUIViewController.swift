//
//  NewsDetailUIViewController.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 27/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import UIKit

class NewsDetailUIViewController: UIViewController {

    
    @IBOutlet weak var detailLabel:UILabel!

    var detailNews:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailLabel.text = detailNews
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
