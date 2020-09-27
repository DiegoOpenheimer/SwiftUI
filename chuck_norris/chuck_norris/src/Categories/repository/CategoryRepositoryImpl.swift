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
    
    private func handleError<T>(result: Result<T, AFError>) throws -> T {
        switch result {
            case .failure(let error):
                throw error
            case .success(let values):
                return values
        }
    }
    
    func loadCategories() -> AnyPublisher<[String], CategoryError> {
        var publisher: AnyPublisher<Result<[String], AFError>, Never>
        publisher = http.get(path: "jokes/categories")
        return publisher
            .tryMap(handleError)
            .mapError { _ in CategoryError(message: "Fail to retrive data from server") }
            .eraseToAnyPublisher()
    }
    
    func loadCategory(params: Dictionary<String, Any>?) -> AnyPublisher<Category, CategoryError> {
        var publisher: AnyPublisher<Result<Category, AFError>, Never>
        publisher = http.get(path: "jokes/random", parameters: params)
        return publisher
            .tryMap(handleError)
            .mapError { _ in CategoryError(message: "Fail to get category from server") }
            .eraseToAnyPublisher()
        
    }
    
}
