//
//  SelectBrandView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 26/11/2023.
//

import SwiftUI

struct SelectBrandView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var brands = ["Nike", "Louis Vuitton", "Chanel", "Adidas", "Hermes", "Dior", "Cartier", "Zara", "Rolex", "H&M", "UNIQLO", "Tiffany & Co", "Coach", "Burberry", "Prada", "Puma", "Ralph Lauren", "Yves Saint Laurent", "Ray-Ban", "Armani", "Victoria's Secret", "Anta", "Under Armour", "The North Face", "The Kooples", "Moncler", "Levi's", "Givenchy", "Skechers", "Old Navy", "Fila", "Celine", "Tommy Hilfiger", "Calvin Klein", "Carhartt", "New Balance"]
    @Binding var selected_brand: String
    @State private var searchText = ""
    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { brand in
                Button {
                    if selected_brand == brand {
                        selected_brand = ""
                    } else {
                        selected_brand = brand
                    }
                    dismiss()
                } label: {
                    HStack {
                        Text(brand)
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: selected_brand == brand ? "largecircle.fill.circle" : "circle")
                            .foregroundStyle(selected_brand == brand ? .teal : .gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listRowBackground(Color(UIColor.systemGray5))
        }
        .background(Color(UIColor.systemGray5))
        .scrollContentBackground(.hidden)
        .listStyle(.grouped)
        .searchable(text: $searchText)
        .navigationBarTitle("Marques", displayMode: .inline)
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
    
    var searchResults: [String] {
            if searchText.isEmpty {
                return brands.sorted()
            } else {
                return brands.sorted().filter { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
}
