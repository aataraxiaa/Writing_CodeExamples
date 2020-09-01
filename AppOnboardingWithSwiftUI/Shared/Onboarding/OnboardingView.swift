//
//  OnboardingView.swift
//  AppOnboardingWithSwiftUI
//
//  Created by Pete Smith on 31/08/2020.
//

import SwiftUI

// This is our main Onboarding view

struct OnboardingView: View {
    
    var body: some View {
        
        // The view consists of a vertical stack of elements
        VStack {
            Spacer(minLength: 150)
            Image(systemName: "wand.and.stars")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Welcome To My App")
                .font(Font.title2.bold().lowercaseSmallCaps())
                .multilineTextAlignment(.center)
            Spacer(minLength: 60)
            Text("Something something this app 🤪")
            Spacer(minLength: 30)
            Text("And another something!")
            Spacer(minLength: 30)
            Text("And finally 🥳...some...thing")
            
            // We use a custom button view to allow the user to complete onboarding
            OnboardingButton()
        }
        .background(Color.gray)
        .foregroundColor(.white)
        .ignoresSafeArea(.all, edges: .all)
    }
}


// This is our custom Onboarding button view, used to allow the user to complete onboarding
struct OnboardingButton: View {
    
    @AppStorage("needsAppOnboarding") var needsAppOnboarding: Bool = true
    
    var body: some View {
        GeometryReader { proxy in
            LazyHStack {
                Button(action: {
                    needsAppOnboarding = false
                }) {
                    Text("Finish Setup")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .font(Font.title2.bold().lowercaseSmallCaps())
                }
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(40)
                .frame(minWidth: 0, maxWidth: proxy.size.width-40)
            }
            .frame(width: proxy.size.width, height: proxy.size.height/1.5)
        }
    }
}
