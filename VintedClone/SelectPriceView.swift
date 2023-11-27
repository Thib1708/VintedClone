//
//  SelectPriceView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 27/11/2023.
//

import SwiftUI

struct SelectPriceView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var price: Double?
    
    var body: some View {
        Group {
            TextField("0,00€", value: $price, format: .number)
                .padding()
                .keyboardType(.decimalPad)
            Divider()
            Spacer()
            Button(action: {dismiss()}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                        .foregroundStyle(.teal)
                    Text("Terminer")
                        .foregroundStyle(.black)
                }
            }
        }
        .background(Color(UIColor.systemGray5))
        .scrollContentBackground(.hidden)
        .navigationTitle("Prix")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.backward")
                .foregroundStyle(.white)
        }
    }
}
