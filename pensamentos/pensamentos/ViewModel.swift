//
//  ViewModel.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 29/08/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine

class ViewModel : ObservableObject {
    
    private var quoteManager: QuoteManager
    @Published var currentQuote: Quote;
    
    init() {
        quoteManager = QuoteManager()
        currentQuote = quoteManager.getRandomQuote()
    }
    
    
    func changeQuote() {
        currentQuote = quoteManager.getRandomQuote()
    }
    
}

