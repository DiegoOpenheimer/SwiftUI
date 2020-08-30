//
//  HomeView.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 29/08/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var animated = false
    @EnvironmentObject var viewModel: ViewModel;
    
    var body: some View {
        ZStack {
            Image(viewModel.currentQuote.image)
            .resizable()
            .blur(radius: 10)
                .aspectRatio(contentMode: .fill)
            Color(red: 1, green: 1, blue: 1, opacity: 0.7)
            GeometryReader { geo in
                VStack {
                    Image(self.viewModel.currentQuote.image)
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: geo.size.width * 0.5)
                        .opacity(self.animated == false ? 0 : 1)
                        .animation(.easeIn(duration: 0.5))
                    Text(self.viewModel.currentQuote.quote)
                        .font(Font.custom("Savoye LET", size: 30))
                        .padding(7)
                        .lineLimit(nil)
                    Spacer()
                }
            }
        }.onAppear {
            withAnimation {
                self.animated.toggle()
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView().environmentObject(ViewModel())
        }
    }
}
#endif
