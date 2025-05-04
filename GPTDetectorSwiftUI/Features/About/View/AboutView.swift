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
        .background(Color(R.color.backgroundColor.name))
        .scrollContentBackground(.hidden)
        .listStyle(.grouped)
        .navigationTitle(R.string.localizable.abouT())
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct AppSection: View {
    var body: some View {
        Section(header: Text(R.string.localizable.app_NAME)) {
            HStack {
                VStack {
                    Image(R.image.launchScreen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: .imageSize.xLarge, height: .imageSize.xLarge)
                    Text(R.string.localizable.app_VERSION(BundleUtils.appVersion))
                        .font(.footnote)
                }
                Text(R.string.localizable.about_DESCRIPTION)
            }
        }
    }
}

private struct LinksSection: View {
    var body: some View {
        Section(header: Text(R.string.localizable.about_USEFUL_LINKS())) {
            Link(destination: URLConstants.privacyPolicyUrl) {
                HStack {
                    Image(systemName: "hand.raised")
                    Text(R.string.localizable.about_PRIVACY_POLICY())
                }
            }
            Button {
                ReviewAppUtils.reviewApp()
            } label: {
                HStack {
                    Image(systemName: "star")
                    Text(R.string.localizable.about_REVIEW_APP())
                }
            }
            ShareLink(item: URLConstants.appStoreUrl) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text(R.string.localizable.about_SHARE_APP())
                }
            }
            Link(destination: URLConstants.contributionUrl) {
                HStack {
                    Image(systemName: "character.bubble")
                    Text(R.string.localizable.about_CONTRIBUTE())
                }
            }
        }
    }
}

private struct FAQSection: View {
    var body: some View {
        Section(header: Text(R.string.localizable.about_FAQ())) {
            VStack(alignment: .leading, spacing: 0) {
                Text(R.string.localizable.about_FAQ_Q1())
                    .fontWeight(.semibold)
                    .padding(.bottom, .padding.medium)
                Text(R.string.localizable.about_FAQ_Q1_A1())
                    .padding(.bottom, .padding.high)
                Text(R.string.localizable.about_FAQ_Q2())
                    .fontWeight(.semibold)
                    .padding(.bottom, .padding.medium)
                Text(R.string.localizable.about_FAQ_Q2_A1())
                    .padding(.bottom, .padding.medium)
                Text(R.string.localizable.about_FAQ_Q2_A2())
                    .padding(.bottom, .padding.medium)
                Text(R.string.localizable.about_FAQ_Q2_A3())
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
