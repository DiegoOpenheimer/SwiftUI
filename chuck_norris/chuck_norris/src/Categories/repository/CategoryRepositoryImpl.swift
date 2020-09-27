//
//  CategoryRepository.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 27/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class CategoryRepositoryImpl : CategoryRepository {
    
    let http: Http
    
    init() {
        http = Http()
    }
    
    func loadCategories() -> AnyPublisher<[String], CategoryError> {
        var publisher: AnyPublisher<Result<[String], AFError>, Never>
        publisher = http.get(path: "jokes/categories")
        return publisher
            .tryMap { response in
                switch (response) {
                    case .failure(let error):
                        throw error
                    case .success(let values):
                        return values
                }
            }
            .mapError { _ in CategoryError(message: "Fail to retrive data from server") }
            .eraseToAnyPublisher()
    }
    
}
