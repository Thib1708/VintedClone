//
//  SizeGuideView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 27/11/2023.
//

import SwiftUI

struct SizeGuideView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Image("GuideTailles")
            .resizable()
            .frame(width: UIScreen.main.bounds.width - 20)
            .scaledToFit()
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

#Preview {
    SizeGuideView()
}
