//
//  NewsViewController.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import UIKit

let kEstimatedNewsRableRowHeight:CGFloat = 100.0

class NewsViewController: UIViewController {

    @IBOutlet weak var articleTableView:UITableView!

    var dataSource = NewsDataSource()
        
    lazy var viewModel : ArticleViewModel = {
        let viewModel = ArticleViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpIntials()
    }
    
    func setUpIntials() {
        
        //Setup UI
        self.title = kNewsTitleString

        self.articleTableView.rowHeight = UITableViewAutomaticDimension
        self.articleTableView.estimatedRowHeight = kEstimatedNewsRableRowHeight

        //Setup datasource
        self.articleTableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.articleTableView.reloadData()
        }
        
        self.viewModel.fetchArticles()
    }
}

extension NewsViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: kNewDetailSegue, sender: self.dataSource.data.value[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kNewDetailSegue
        {
            let newsDetailVC = segue.destination as? NewsDetailUIViewController
            newsDetailVC?.detailNews = (sender as! Article).captionInfo
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

