//
//  AddView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 23/11/2023.
//

import SwiftUI
import PhotosUI
import ColorKit

struct AddView: View {
    @StateObject var vm = PhotoSelectorViewModel()

    @State private var title = ""
    @State private var description = ""
    @State private var price: Double?
    @State private var selected_type = ""
    @State private var selected_size = ""
    @State private var selected_brand = ""
    @State private var selected_condition = ""
    @State private var selected_colors: [String] = [""]
    
    @State private var showSelectPrice = false
    
    let dominanteColors: [Color] = [.red]
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        HStack(alignment: .center) {
                            Text("Jusqu'a 20 photos.")
                                .foregroundStyle(.white)
                            Text("Voir astuces")
                                .underline()
                        }
                        .font(.footnote)
                        PhotoSelectorView()
                    }
                    .foregroundStyle(.teal)
                    Spacer()
                }
            }
            .listRowBackground(Color(UIColor.systemGray5))
            Section {
                VStack(alignment: .leading) {
                    Text("Titre")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("ex: Chemise Sezane verte", text: $title)
                    Divider()
                    Text("Decris ton article")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("ex: porté quelques fois, taille correctement", text: $description)
                        .padding(.bottom, 90.0)
                    Divider()
                }
            }
            .listRowBackground(Color(UIColor.systemGray5))
            Section {
                NavigationLink {
                    SelectCategorieView(selected_type: $selected_type)
                } label: {
                    HStack {
                        Text("Catégorie")
                        Spacer()
                        Text(selected_type)
                            .foregroundStyle(.gray)
                    }
                }
                NavigationLink {
                    SelectBrandView(selected_brand: $selected_brand)
                } label: {
                    HStack {
                        Text("Marque")
                        Spacer()
                        Text(selected_brand)
                            .foregroundStyle(.gray)
                    }
                }
                NavigationLink {
                    SelectSizeView(selected_size: $selected_size)
                } label: {
                    HStack {
                        Text("Taille")
                        Spacer()
                        Text(selected_size)
                            .foregroundStyle(.gray)
                    }

                }
                NavigationLink {
                    SelectConditionView(selected_condition: $selected_condition)
                } label: {
                    HStack {
                        Text("Etat")
                        Spacer()
                        Text(selected_condition)
                            .foregroundStyle(.gray)
                    }
                }
                NavigationLink {
                    SelectColorView(selected_colors: $selected_colors)
                } label: {
                    HStack {
                        Text("Couleurs")
                        Spacer()
                        ForEach(0..<selected_colors.count, id: \.self) { index in
                            if index == 3 {
                                Text("...")
                                    .foregroundStyle(.gray)
                            }
                            if index < 3 {
                                Text(selected_colors[index])
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                } 
            }
            .listRowBackground(Color(UIColor.systemGray5))
            Section {
                NavigationLink {
                    SelectPriceView(price: $price)
                } label: {
                    HStack {
                        Text("Prix sans frais de port")
                        Spacer()
                        if let price = price {
                            Text("\(price, format: .number)€")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .isDetailLink(false)
            }
            .listRowBackground(Color(UIColor.systemGray5))
        }
        .background(Color(UIColor.systemGray6))
        .scrollContentBackground(.hidden)
        .navigationBarTitle("Vends un article", displayMode: .inline)
        .toolbarBackground(Color(UIColor.systemGray5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .listStyle(.grouped)
    }
    
}

#Preview {
    NavigationStack {
        AddView()
    }
}
