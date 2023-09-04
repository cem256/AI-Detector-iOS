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
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct AppSection: View {
    var body: some View {
        Section(header: Text("GPT Detector")) {
            HStack {
                VStack {
                    Image("LaunchScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .imageSize.xLarge, height: .imageSize.xLarge)
                        .clipShape(RoundedRectangle(cornerRadius: .borderRadius.regular))
                    Text("Version \(BundleUtils.appVersion)")
                        .font(.footnote)
                }
                Text("Predicts whether a text was generated by a large language model such as ChatGPT or not.")
            }
        }
    }
}

private struct LinksSection: View {
    var body: some View {
        Section(header: Text("Useful Links")) {
            Link(destination: URLConstants.privacyPolicyUrl) {
                HStack {
                    Image(systemName: "hand.raised")
                    Text("Privacy Policy")
                }
            }
            Button {
                ReviewAppUtils.reviewApp()
            } label: {
                HStack {
                    Image(systemName: "star")
                    Text("Review the App")
                }
            }
            ShareLink(item: URLConstants.appStoreUrl) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share the App")
                }
            }
        }
    }
}

private struct FAQSection: View {
    var body: some View {
        Section(header: Text("Frequently Asked Questions")) {
            VStack(alignment: .leading, spacing: 0) {
                Text("How results are calculated?")
                    .fontWeight(.semibold)
                    .padding(.bottom, .padding.medium)
                Text("- Large language models like ChatGPT typically generate text that is less complex and random compared to human-created content. The level of randomness and complexity can be analyzed to differentiate between AI-generated and human-created content.")
                    .padding(.bottom, .padding.high)
                Text("What are the limitations of the GPT Detector?")
                    .fontWeight(.semibold)
                    .padding(.bottom, .padding.medium)
                Text("- Current version of the GPT Detector is optimized for texts written in English. So, using text in other languages may result in inaccurate results.")
                    .padding(.bottom, .padding.medium)
                Text("- Texts written by children or non-native English speakers may be misclassified because they often produce text that is less random and complex.")
                    .padding(.bottom, .padding.medium)
                Text("- As AI models advance, they become better at generating text that looks like human writing which affects the reliability of the GPT Detector. Therefore, it's not advised to solely rely on the detector's results for decision-making.")
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
