//
//  OnboardingView.swift
//  AppOnboardingWithSwiftUI
//
//  Created by Pete Smith on 31/08/2020.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack {
            Spacer(minLength: 150)
            Image(systemName: "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Welcome To Bikey")
                .font(Font.title2.bold().lowercaseSmallCaps())
                .multilineTextAlignment(.center)
            Spacer(minLength: 60)
            Text("Supports Over 400 Cities Worldwide")
            Spacer(minLength: 30)
            Text("Safe & Secure")
            Spacer(minLength: 30)
            Text("Built With Love ❤️")
        }
        .background(Color.blue)
        .foregroundColor(.red)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
