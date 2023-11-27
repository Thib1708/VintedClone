//
//  CategoriesView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 24/11/2023.
//

import SwiftUI

enum Categories: String, CaseIterable, Identifiable {
    case femmes
    case hommes
    case enfants
    case maison
    case divertissement
    case animaux
    var info: (image: String, name: String, types: [String]) {
        switch self {
        case .femmes :
            return ("person", "Femmes", ["T-Shirt", "Robe", "Jupe"])
        case .hommes :
            return ("person", "Hommes", ["T-Shirt", "Sweat", "Pantalon"])
        case .enfants :
            return ("person", "Enfants", ["Body", "Bonnet", "Chaussure"])
        case .maison :
            return ("house", "Maison", ["Tapis", "Lustre", "Vaisselle"])
        case .divertissement :
            return ("star", "Divertissement", ["Jeux de societe", "Console"])
        case .animaux :
            return ("pawprint", "Animaux", ["Colier", "Laisse", "Jeux"])
        }
    }
    var id: Self { self }
}

struct SelectCategorieView: View {
    @Binding var selected_type: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(Categories.allCases) { categorie in
                NavigationLink {
                    List {
                        ForEach(categorie.info.types, id: \.self) { type in
                            Button {
                                selected_type = categorie.info.name + "/" + type
                                dismiss()
                            } label: {
                                HStack {
                                    Text(type)
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image(systemName: selected_type == categorie.info.name + "/" + type ? "largecircle.fill.circle" : "circle")
                                        .foregroundStyle(.teal)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                    .listStyle(.grouped)
                } label: {
                    HStack {
                        Image(systemName: categorie.info.image)
                            .foregroundStyle(.teal)
                        Text(categorie.info.name)
                    }
                }
            }
            .listRowBackground(Color(UIColor.systemGray5))
        }
        .background(Color(UIColor.systemGray5))
        .scrollContentBackground(.hidden)
        .listStyle(.grouped)
        .navigationBarTitle("Catégorie", displayMode: .inline)
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
