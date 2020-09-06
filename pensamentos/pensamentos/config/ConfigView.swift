//
//  ConfigView.swift
//  pensamentos
//
//  Created by Diego Alves Openheimer on 29/08/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import SwiftUI

struct ConfigView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Mudar automaticamente")
            Toggle("", isOn: $viewModel.changeAutomatic)
                .labelsHidden()
            Spacer().frame(height: 16)
            Divider()
            Text("Mudar após \(Int(viewModel.time)) segundos")
                .padding(.top, 16)
            buildTimeLine()
            Spacer().frame(height: 50)
            viewSchemaColors()
            Spacer()
            Text("Obs: Para mudar de pensamento basta tomar em qualquer lugar na tela de \"Pensamentos\"")
                .multilineTextAlignment(.center)
                .foregroundColor(Color("AppOrange"))
        }.padding()
            .accentColor(Color("AppOrange"))
    }
    
    func viewSchemaColors() -> some View {
        return VStack {
            Text("Esquema de cores")
            Picker("", selection: $viewModel.schemaColor) {
                Text("Claro").tag(SchemaColor.LIGHT)
                Text("Escuro").tag(SchemaColor.DARK)
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
        }
    }
    
    func buildTimeLine() -> some View {
        return HStack {
            Text("3")
            Slider(value: $viewModel.time, in: 3...30, step: 1)
            Text("30")
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView().environmentObject(ViewModel())
    }
}
