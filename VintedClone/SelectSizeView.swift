//
//  SelectSizeView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 27/11/2023.
//

import SwiftUI

struct SelectSizeView: View {
    @Binding var selected_size: String
    @Environment(\.dismiss) var dismiss
    
    @State private var sizes = ["XS", "S", "M", "L", "XL", "XXL", "XXXL", "4XL", "5XL", "6XL", "7XL", "8XL", "Universel"]
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Selectionne une taille")
                Text("Choisis la taille qui correspond à l'étiquette de l'article.")
                    .font(.footnote)
                    .foregroundStyle(.white)
                NavigationLink {
                    SizeGuideView()
                } label: {
                    Text("Voir le guide des tailles")
                }
                .foregroundStyle(.teal)
                .underline()
                .padding(.vertical, 10)
                Text("Toutes les tailles")
            }
            .listRowBackground(Color(UIColor.systemGray5))
            ForEach(sizes, id: \.self) { item in
                Button {
                    selected_size = item
                    dismiss()
                } label: {
                    HStack {
                        Text(item)
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: item == selected_size ? "largecircle.fill.circle" : "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(item == selected_size ? .teal : .gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listRowBackground(Color(UIColor.systemGray5))
        }
        .background(Color(UIColor.systemGray5))
        .scrollContentBackground(.hidden)
        .navigationBarTitle("Tailles", displayMode: .inline)
        .listStyle(.grouped)
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
