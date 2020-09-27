//
//  HomeView.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 26/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { reader in
            NavigationView {
                VStack(alignment: .leading, spacing: 10) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ItemOption(icon: "folder", title: "Categories", destination: CategoriesView())
                    .padding()
                    ItemOption(icon: "command", title: "Random", destination: Text("okay"))
                    .padding()
                    ItemOption(icon: "folder", title: "Search", destination: Text("okay"))
                    .padding()
                }.frame(width: reader.size.width)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ItemOption<Content: View>: View {
    
    var icon: String
    var title: String
    var destination: Content

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(Color.orange)
                Text(title)
                    .font(.system(.headline, design: .monospaced))
                    .padding(.leading, 16)
            }.foregroundColor(Color("MyBlack"))
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice("iPad (8th generation)")
        }
    }
}
