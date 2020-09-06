//
//  ContentView.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 29/08/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Pensamentos")
            }
            ConfigView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Configurações")
            }
        }.accentColor(Color("AppOrange"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
