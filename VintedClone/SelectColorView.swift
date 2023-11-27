//
//  SelectColorView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 24/11/2023.
//

import SwiftUI
import ColorKit

struct colors: Hashable, Identifiable {
    var id = UUID()
    var color: Color
    var name: String
}

struct SelectColorView: View {
    @Binding var selected_colors: [String]
    @Environment(\.dismiss) var dismiss
    
    @State private var Colors = [
        colors(color: .black, name: "Noir"),
        colors(color: Color(red: 88 / 255, green: 41 / 255, blue: 0), name: "Marron"),
        colors(color: .gray, name: "Gris"),
        colors(color: Color(red: 225 / 255, green: 198 / 255, blue: 153 / 255), name: "Beige"),
        colors(color: .pink, name: "Rose"),
        colors(color: .purple, name: "Violet"),
        colors(color: .red, name: "Rouge"),
        colors(color: .yellow, name: "Jaune"),
        colors(color: .blue, name: "Bleu"),
        colors(color: Color(red: 255 / 255, green: 140 / 255, blue: 0), name: "Orange"),
        colors(color: .white, name: "Blanc")
    ]
    @State private var isChoose = [false, false, false, false, false, false, false, false, false, false, false]
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                Text("Toutes les couleurs")
                    .listRowBackground(Color(UIColor.systemGray5))
                ForEach(Array(Colors.enumerated()), id: \.offset) { index, item in
                    Button{
                        isChoose[index].toggle()
                        selected_colors.append(item.name)
                    } label: {
                        HStack {
                            Circle()
                                .fill(item.color)
                                .frame(width:25, height: 25)
                            Text(item.name)
                                .foregroundStyle(.white)
                            Spacer()
                            Image(systemName: isChoose[index] ? "checkmark.square.fill" : "square")
                                .resizable()
                                .frame(width: 25, height:25)
                                .foregroundStyle(.teal)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listRowBackground(Color(UIColor.systemGray5))
                Text("")
                .listRowBackground(Color(UIColor.systemGray5))
            }
            .listStyle(.grouped)
            .background(Color(UIColor.systemGray5))
            .scrollContentBackground(.hidden)
            Button(action: {dismiss()}) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color(UIColor.systemGray5))
                        .frame(height: 90)
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                        .foregroundStyle(.teal)
                    Text("Terminer")
                        .foregroundStyle(.black)
                }
            }
        }
        .navigationBarTitle("Couleurs", displayMode: .inline)
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
