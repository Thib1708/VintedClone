//
//  SelectConditionView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 27/11/2023.
//

import SwiftUI

struct condition: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var descrpition: String
}

struct SelectConditionView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selected_condition: String
    @State private var conditions = [
        condition(name: "Neuf avec étiquette", descrpition: "Article neuf, jamais porté/utilisé avec étiquettes ou dans son emballage d'origine."),
        condition(name: "Neuf sans étiquette", descrpition: "Qrticle neuf, jamais porté/utilisé sans étiquettes ni son emballage d'origine."),
        condition(name: "Très bon état", descrpition: "Article très peu porté/utilisé qui peut avoir de légères imperfection, mais qui reste en très bon état. Précise avec des photos et une description détaillée, lrd défault de ton article."),
        condition(name: "Bon état", descrpition: "Article porté/utilisé quelques fois, montre des imperfection et des signes d'usure. Précise avec des photos et une description détaillée, lrd défault de ton article."),
        condition(name: "Satisfaisant", descrpition: "Article porté/utilisé plusieurs fois, montre des imperfection et des signes d'usure. Précise avec des photos et une description détaillée, lrd défault de ton article.")
    ]
    var body: some View {
        List {
            ForEach(conditions, id: \.self) { item in
                Button {
                    selected_condition = item.name
                    dismiss()
                } label : {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .foregroundStyle(.white)
                            Text(item.descrpition)
                                .foregroundStyle(.gray)
                                .font(.footnote)
                        }
                        Spacer()
                        Image(systemName: selected_condition == item.name ? "largecircle.fill.circle" : "circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.teal)
                    }
                }
            }
            .listRowBackground(Color(UIColor.systemGray5))
        }
        .background(Color(UIColor.systemGray5))
        .scrollContentBackground(.hidden)
        .listStyle(.grouped)
        .navigationBarTitle("Etat", displayMode: .inline)
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
