//
//  CategoryDetailsViewModel.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 27/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine

class MessageViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var category: Message?
    @Published var messageError: String?
    
    var disposables: Set<AnyCancellable> = Set()
    
    let categoryRepository: CategoryRepository
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    
    func load(name: String?, isRandom: Bool = false) {
        disposables = Set()
        messageError = nil
        isLoading.toggle()
        var params: Dictionary<String, String>? = nil
        if !isRandom && name != nil {
            params = ["category" : name!]
        }
        categoryRepository.loadCategory(params: params)
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
