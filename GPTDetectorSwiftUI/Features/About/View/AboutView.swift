//
//  AboutView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 30.08.2023.
//

import StoreKit
import SwiftUI

struct AboutView: View {
    var body: some View {
        List {
            AppSection()
            LinksSection()
            FAQSection()
        }
        .background(Color.theme.backgroundColor)
        .scrollContentBackground(.hidden)
        .listStyle(.grouped)
        .navigationTitle("ABOUT")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct AppSection: View {
    var body: some View {
        Section(header: Text("APP_NAME")) {
            HStack {
                VStack {
                    Image("LaunchScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .imageSize.xLarge, height: .imageSize.xLarge)
                        .clipShape(RoundedRectangle(cornerRadius: .borderRadius.regular))
                    Text("APP_VERSION \(BundleUtils.appVersion)")
                        .font(.footnote)
                }
                Text("ABOUT_DESCRIPTION")
            }
        }
    }
}

private struct LinksSection: View {
    var body: some View {
        Section(header: Text("ABOUT_USEFUL_LINKS")) {
            Link(destination: URLConstants.privacyPolicyUrl) {
                HStack {
                    Image(systemName: "hand.raised")
                    Text("ABOUT_PRIVACY_POLICY")
                }
            }
            Button {
                ReviewAppUtils.reviewApp()
            } label: {
                HStack {
                    Image(systemName: "star")
                    Text("ABOUT_REVIEW_APP")
                }
            }
            ShareLink(item: URLConstants.appStoreUrl) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("ABOUT_SHARE_APP")
                }
            }
        }
    }
}

private struct FAQSection: View {
    var body: some View {
        Section(header: Text("ABOUT_FAQ")) {
            VStack(alignment: .leading, spacing: 0) {
                Text("ABOUT_FAQ_Q1")
                    .fontWeight(.semibold)
                    .padding(.bottom, .padding.medium)
                Text("ABOUT_FAQ_Q1_A1")
                    .padding(.bottom, .padding.high)
                Text("ABOUT_FAQ_Q2")
                    .fontWeight(.semibold)
                    .padding(.bottom, .padding.medium)
                Text("ABOUT_FAQ_Q2_A1")
                    .padding(.bottom, .padding.medium)
                Text("ABOUT_FAQ_Q2_A2")
                    .padding(.bottom, .padding.medium)
                Text("ABOUT_FAQ_Q2_A3")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AboutView()
        }
    }
}
