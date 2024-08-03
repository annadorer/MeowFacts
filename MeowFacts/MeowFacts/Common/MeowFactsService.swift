//
//  MeowFactsService.swift
//  MeowFacts
//
//  Created by Anna on 02.08.2024.
//

import Foundation
import MeowFactsAPI

class MeowFactsService {
    
    static let shared = MeowFactsService()
    
    private init() {}
    
    func fetchRandomMeowFacts(count: Int, completion: @escaping (Result<[Fact], Error>) -> Void) {
        PublicAPI.defaultRoot(count: count, lang: PublicAPI.Lang_defaultRoot.rus) { data, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
    }
}
