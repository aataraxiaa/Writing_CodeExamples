//
//  ContentView.swift
//  Shared
//
//  Created by Pete Smith on 31/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appSetupState = "App NOT setup ☹️"
    
    // #1
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    var body: some View {
        
        // #2
        mainView.onAppear {
            
            if !needsAppOnboarding {
                // Scenario #3: User has completed app onboarding
                appSetupState = "App setup 😀"
            }
        }
    }
}

extension ContentView {
    
    private var mainView: some View {
        VStack {
            Spacer()
            Button(action: {
                needsAppOnboarding = true
            }) {
                Text("Reset Onboarding")
                .padding(.horizontal, 40)
                .padding(.vertical, 15)
                .font(Font.title2.bold().lowercaseSmallCaps())
            }
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(40)
            
            // #1
            .sheet(isPresented:$needsAppOnboarding) {
                
                // Scenario #1: User has NOT completed app onboarding
                OnboardingView()
            }
            
            // #2
            .onChange(of: needsAppOnboarding) { needsAppOnboarding in
                
                if !needsAppOnboarding {
                    
                    // Scenario #2: User has completed app onboarding during current app launch
                    appSetupState = "App setup 😀"
                }
            }
            Spacer()
            Text(appSetupState)
            Spacer()
        }
    }
}
