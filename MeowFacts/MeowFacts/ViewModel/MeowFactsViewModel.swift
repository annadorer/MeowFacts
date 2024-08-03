//
//  MeowFactsViewModel.swift
//  MeowFacts
//
//  Created by Anna on 01.08.2024.
//

import Foundation
import MeowFactsAPI
import Combine

class MeowFactsViewModel: ObservableObject {
    
    @Published var meowFacts: [String] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchFacts(count: Int, lang: PublicAPI.Lang_defaultRoot) {
        isLoading = true
        do {
            MeowFactsService.shared.fetchRandomMeowFacts(count: 5) { [self] result in
                switch result {
                case .success(let facts):
                    meowFacts = facts.flatMap({ Fact in
                        Fact.data ?? []
                    })
                case .failure(_):
                    meowFacts = []
                }
            }
        }
        isLoading = false
    }
}
