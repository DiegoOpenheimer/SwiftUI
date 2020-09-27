//
//  CategoriesView.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 26/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var categoryViewModel = CategoryViewModel(repository: CategoryRepositoryImpl())
    
    var body: some View {
        ZStack {
            if categoryViewModel.isLoading {
                ProgressView()
            } else if let message = categoryViewModel.messageError {
                Text(message)
            } else {
                List(categoryViewModel.categories, id: \.self) { name in
                    NavigationLink(destination: CategoryDetailsView(name: name)
                                    .navigationBarTitle(Text(name), displayMode: .inline)) {
                        Text(name)
                    }
                }

            }
        }
        .navigationBarTitle(Text("Categories"))
        .onAppear { self.categoryViewModel.load() }
        .onDisappear { self.categoryViewModel.dispose() }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesView()
        }
    }
}
