//
//  CategoryRepository.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 27/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine

struct CategoryError: Error {
    let message: String
}

protocol CategoryRepository {
    func loadCategories() -> AnyPublisher<[String], CategoryError>
    
    func loadCategory(params: Dictionary<String, Any>?) -> AnyPublisher<Category, CategoryError>
}
