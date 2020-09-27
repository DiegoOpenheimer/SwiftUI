//
//  Http.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 26/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class Http {
    
    let url: String
    
    init() {
        if let url = ProcessInfo.processInfo.environment["URL"] {
            self.url = url
        } else {
            print("Without url configured")
            url = ""
        }
    }
    
    func get<T: Decodable>(path: String) -> AnyPublisher<Result<T, AFError>, Never> {
        return AF.request("\(url)\(path)", method: .get)
            .publishDecodable(type: T.self)
            .result()
    }
    
}
