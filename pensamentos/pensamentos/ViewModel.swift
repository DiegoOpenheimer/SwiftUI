//
//  ViewModel.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 29/08/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine

enum SchemaColor {
    case DARK
    case LIGHT
}

typealias AfterTime = () -> Void

class ViewModel : ObservableObject {
    
    private var quoteManager: QuoteManager
    private var timer: Timer?
    @Published var currentQuote: Quote
    @Published var time: Double
    @Published var changeAutomatic: Bool
    @Published var schemaColor: SchemaColor
    
    init() {
        time = 3
        changeAutomatic = true
        schemaColor = SchemaColor.LIGHT
        quoteManager = QuoteManager()
        currentQuote = quoteManager.getRandomQuote()
    }
    
    
    func changeQuote() {
        currentQuote = quoteManager.getRandomQuote()
    }
    
    func onStart(afterTime callback: AfterTime?) {
        timer?.invalidate()
        if changeAutomatic {
            timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { _ in
                self.changeQuote()
                callback?()
            }
        }
    }
    
    func onDestroy() {
        timer?.invalidate()
    }
    
}

