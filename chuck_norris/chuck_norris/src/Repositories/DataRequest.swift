//
//  DataRequest.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 26/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import Combine
import Alamofire

protocol DataRequest {
    func get<T: Decodable>(path: String) -> AnyPublisher<Result<T, AFError>, Never>
}
