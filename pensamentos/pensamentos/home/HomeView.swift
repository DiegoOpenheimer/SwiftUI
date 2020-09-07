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
    
    fileprivate func buildInformation(_ geo: GeometryProxy) -> some View {
        
        let textColor: Color = viewModel.schemaColor == SchemaColor.LIGHT ? .black : .white
        
         return VStack {
            Image(self.viewModel.currentQuote.image)
                .resizable()
                .aspectRatio(755/666, contentMode: .fit)
                .opacity(self.animated == false ? 0 : 1)
                .layoutPriority(1)
            Text(self.viewModel.currentQuote.quote)
                .font(Font.custom("Savoye LET", size: 35))
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.1)
                .offset(x: 0, y: !self.animated ? 100 : 0)
                .padding(7)
                .foregroundColor(textColor)
            Text(self.viewModel.currentQuote.author)
                .font(Font.custom("Savoye LET", size: 40))
                .offset(x: 0, y: !self.animated ? 100 : 0)
                .foregroundColor(textColor)
            Spacer()
        }.frame(width: geo.size.width)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(self.viewModel.currentQuote.image)
                .resizable()
                .blur(radius: 10)
                    .aspectRatio(contentMode: .fill)
                
                if self.viewModel.schemaColor == SchemaColor.DARK {
                    Color("AppOrange").opacity(0.7)
                } else {
                    Color(red: 1, green: 1, blue: 1, opacity: 0.7)
                }
                
                self.buildInformation(geo)
            }.frame(width: geo.size.width)
        }.onAppear(perform: onStart)
            .onDisappear(perform: viewModel.onStopTimer)
            .onTapGesture {
                self.animated = false
                self.viewModel.changeQuote()
                self.onStart()
        }
    }
    
    func onStart() {
        updateAnimation()
        viewModel.onStart {
            self.animated = false
            self.updateAnimation()
        }
    }
    
    func updateAnimation() {
        if !animated {
            withAnimation (.easeInOut(duration: 0.5)) {
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
