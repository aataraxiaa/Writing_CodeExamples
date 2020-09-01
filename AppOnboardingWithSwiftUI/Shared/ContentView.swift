//
//  ContentView.swift
//  Shared
//
//  Created by Pete Smith on 31/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("needsAppOnboarding") var needsAppOnboarding: Bool = true
    
    var body: some View {
        mainView.onAppear {
            
            /*
             Flow #1:
             
             When a user has already onboarded to the app, i.e not the first launch, we perform
             any necessary app setup when our main view appears.
             
             We will know the user has already onboarded as the needsAppOnboarding flag will be false.
            */
            
            if !needsAppOnboarding {
                // Set up app here!
            }
        }
    }
}

extension ContentView {
    
    private var mainView: some View {
        Text("Hello, world!")
        .padding()
        .sheet(isPresented:$needsAppOnboarding) {
            OnboardingView()
        }
        .onChange(of: needsAppOnboarding) { needsAppOnboarding in
            
            /*
             Flow #2:
             
             When the user has just onboarded as part of this app launch, the needsAppOnboarding flag will change.
             Using the .onChange view modifier, we can react to this change, and perform any necessary app setup.
             
             Again, we will know the user has already onboarded as the needsAppOnboarding flag will now be false.
            */
            
            if !needsAppOnboarding {
                // Set up app here!
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
