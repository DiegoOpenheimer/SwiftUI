//
//  CategoryDetailsViewModel.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 27/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var category: Category?
    @Published var messageError: String?
    
    var disposables: Set<AnyCancellable> = Set()
    
    let categoryRepository: CategoryRepository
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    
    func load(name: String) {
        disposables = Set()
        messageError = nil
        isLoading.toggle()
        categoryRepository.loadCategory(params: ["category" : name])
            .sink(
                receiveCompletion: {
                    self.isLoading = false
                    switch $0 {
                    case .failure(let categoryError):
                        self.messageError = categoryError.message
                        break
                    case .finished:
                        break
                    }
                },
                receiveValue: { self.category = $0 }
            ).store(in: &disposables)
    }
    
    func dispose() {
        disposables.forEach { $0.cancel() }
    }
    
}
