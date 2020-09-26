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
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Image("logo")
                ItemOption(icon: "folder", title: "Categories")
                .padding()
                ItemOption(icon: "command", title: "Random")
                .padding()
                ItemOption(icon: "folder", title: "Search")
                .padding()
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ItemOption: View {
    
    var icon: String
    var title: String

    var body: some View {
        NavigationLink(destination: Text("nice")) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(Color.orange)
                Text(title)
                    .font(.system(.headline, design: .monospaced))
                    .padding(.leading, 16)
            }.foregroundColor(.black)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
