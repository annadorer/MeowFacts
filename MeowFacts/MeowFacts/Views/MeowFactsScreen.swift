//
//  ContentView.swift
//  MeowFacts
//
//  Created by Anna on 30.07.2024.
//

import SwiftUI
import MeowFactsAPI

struct MeowFactsScreen: View {
    
    @StateObject private var viewModel = MeowFactsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.meowFacts, id: \.self) { fact in
                        Text(fact)
                    }
                }
                Button(action: {
                    viewModel.fetchFacts(count: 4, lang: PublicAPI.Lang_defaultRoot.rus)
                }) {
                    Text("Добавить новые факты")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(20)
                }
            }
            .navigationTitle("Факты о кошках")
            .onAppear {
                viewModel.fetchFacts(count: 4, lang: PublicAPI.Lang_defaultRoot.rus)
            }
        }
    }
}

struct MeowFactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MeowFactsScreen()
    }
}
