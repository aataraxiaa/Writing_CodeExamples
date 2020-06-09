//
//  ContentView.swift
//  SwiftUITip-UpdatingWrappedUIKitView
//
//  Created by Pete Smith on 09/06/2020.
//  Copyright © 2020 Pete Smith. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @ObservedObject var annotationMaker = AnnotationMaker()
    
    var body: some View {
        MapView(annotation: annotationMaker.annotation)
            .edgesIgnoringSafeArea(.all).onAppear {
                self.annotationMaker.makeAnnotation(withDelay: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MapView: UIViewRepresentable {
    
    var annotation: MKAnnotation?
    
    private let map = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        guard let annotation = annotation else { return }
        uiView.addAnnotation(annotation)
    }
    
}

class AnnotationMaker: ObservableObject {
    
    @Published var annotation: MKAnnotation?
    
    func makeAnnotation(withDelay delay: Double) {
        Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { timer in
            self.annotation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.345589, longitude: -6.286951))
        }
    }
}
