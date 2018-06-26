//
//  ArticleViewModel.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation
struct ArticleViewModel {
    
    weak var dataSource : GenericDataSource<Article>?
    weak var service: ServiceHelperProtocol?
    
    init(service: ServiceHelperProtocol = ServiceHelper.shared, dataSource : GenericDataSource<Article>?) {
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
                    let articles = metaData.articles ?? []
                    // Sort Articles on the bases of date.
                    self.dataSource?.data.value = articles.sorted(by: { $0.publishedDate > $1.publishedDate })

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
}
