//
//  HeaderView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("GPT Detector")
                .font(.title)
                .fontWeight(.medium)

            Spacer()
            NavigationLink {
                AboutView()
            } label: {
                Image(systemName: "info.circle")
                    .font(.title2)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
