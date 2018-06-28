//
//  ArticleViewModel.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation
struct ArticleViewModel {
    
    weak var dataSource : GenericDataSource<ArticleCellViewModel>?
    weak var service: ServiceHelperProtocol?
    
    init(service: ServiceHelperProtocol = ServiceHelper.shared, dataSource : GenericDataSource<ArticleCellViewModel>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchArticles(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }
        
        service.fetchArticles() { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let metaData) :
                    // reload data
                    var articles = metaData.articles ?? []
                    
                    // Sort Articles on the bases of date.
                    articles = articles.sorted(by: { $0.publishedDate > $1.publishedDate })
                    self.dataSource?.data.value = self.getArticleCellViewModelsWith(articles: articles)
                    completion?(Result.success(true))
                    
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    completion?(Result.failure(error))
                    
                    break
                }
            }
        }
    }
    
    func  getArticleCellViewModelsWith(articles:[Article]) -> [ArticleCellViewModel]
    {
        var articalCellVMList:[ArticleCellViewModel] = []
        for article in articles {
            let articleCellViewModel = ArticleCellViewModel(article: article)
            articalCellVMList.append(articleCellViewModel)
        }
        
        return articalCellVMList
    }
}
