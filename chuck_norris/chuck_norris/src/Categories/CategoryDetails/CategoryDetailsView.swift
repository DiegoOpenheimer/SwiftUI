//
//  CategoryDetailsView.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 27/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import SwiftUI
import Combine

struct CategoryDetailsView: View {
    
    let name: String
    @ObservedObject var categoryDetailsViewModel: CategoryDetailsViewModel = CategoryDetailsViewModel(categoryRepository: CategoryRepositoryImpl())
    
    var body: some View {
        return VStack(spacing: 16) {
            if categoryDetailsViewModel.isLoading {
                ProgressView()
            } else if let category = categoryDetailsViewModel.category {
                Image("chuck")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(category.value).font(.title).multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                Text(category.createdAt).font(.subheadline)
            } else {
                Text("No category selected")
            }

        }
        .padding()
        .onAppear { self.categoryDetailsViewModel.load(name: name) }
        .onDisappear { self.categoryDetailsViewModel.dispose() }
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(name: "animal")
    }
}
