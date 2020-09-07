//
//  ViewModel.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 29/08/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine

enum SchemaColor: String {
    case DARK
    case LIGHT
}

typealias AfterTime = () -> Void

class ViewModel : ObservableObject {
    
    private let userRepository: UserRepository
    private var quoteManager: QuoteManager
    private var timer: Timer?
    private var subscription: AnyCancellable?
    @Published var currentQuote: Quote
    @Published var time: Double
    @Published var changeAutomatic: Bool
    @Published var schemaColor: SchemaColor
    
    init() {
        userRepository = UserRepository.shared
        time = userRepository.time
        changeAutomatic = userRepository.changeAutomatic
        schemaColor = userRepository.schemaColor
        quoteManager = QuoteManager()
        currentQuote = quoteManager.getRandomQuote()
        startListener()
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
    
    func onStopTimer() {
        timer?.invalidate()
    }
    
    private func startListener() {
        subscription = Publishers.CombineLatest3($schemaColor, $time, $changeAutomatic)
            .sink {
                self.userRepository.schemaColor = $0.0
                self.userRepository.time = $0.1
                self.userRepository.changeAutomatic = $0.2
            }
    }
    
    func onDestroy() {
        subscription?.cancel()
    }
}
