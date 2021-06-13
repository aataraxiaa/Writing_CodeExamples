//
//  ContentView.swift
//  BugHunt
//
//  Created by Pete Smith on 08/06/2021.
//

import SwiftUI

struct ContentView: View {

    @State var isPresented = false

    var body: some View {
        Text("Welcome to Bug Hunt!")
            .padding()

        Button(action: {
            isPresented = true
        }, label: {
            Text("Show me a bug")
        })
        .accessibility(identifier: "showBugButton")
        .alert(isPresented: $isPresented, content: {
            Alert(title: Text("Show Bug!"),
                  message: Text("This is a bug 🐛"),
                  dismissButton: .default(Text("Ok"))
            )
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
