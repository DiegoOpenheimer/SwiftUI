//
//  CategoryViewModel.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 26/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class CategoryViewModel: ObservableObject {
    
    @Published var categories: [String]
    @Published var isLoading: Bool
    @Published var messageError: String?
    var disposables: Set<AnyCancellable>
    let repository: CategoryRepository
    
    init(repository: CategoryRepository) {
        self.repository = repository
        disposables = Set()
        categories = []
        isLoading = false
    }
    
    func load() {
        categories = []
        messageError = nil
        isLoading = true
        repository.loadCategories()
            .sink(
                receiveCompletion: { completion in
                    self.isLoading = false
                    switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            self.messageError = error.message
                    }
                },
                receiveValue: { self.categories = $0 }
            ).store(in: &disposables)
    }
    
    func dispose() {
        disposables.forEach { $0.cancel() }
    }
    
}
