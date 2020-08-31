//
//  ContentView.swift
//  Shared
//
//  Created by Pete Smith on 31/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("needsOnboarding") var needsOnboarding: Bool = true
    
    var body: some View {
        mainView.onAppear {
            if !needsOnboarding {
                // Set up app here!
            }
        }
    }
}

extension ContentView {
    
    private var mainView: some View {
        Text("Hello, world!")
            .padding()
            .sheet(isPresented:$needsOnboarding) {
                OnboardingView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
