//
//  ContentView.swift
//  SwiftUITip-UpdatingWrappedUIKitView
//
//  Created by Pete Smith on 09/06/2020.
//  Copyright © 2020 Pete Smith. All rights reserved.
//

import SwiftUI
import MapKit

// Original Implementation

// Main view. Vertical stack of two map views
struct ContentView: View {
    
    // Provides an annotation immedidately (synchronously)
    var synchronousAnnotationMaker = SynchronousAnnotationMaker()
    
    var body: some View {
        MapView(annotation: synchronousAnnotationMaker.annotation).edgesIgnoringSafeArea(.all)
    }
}

// Map view. Displays a map and a single map annotation.
struct MapView: UIViewRepresentable {
    
    var annotation: MKAnnotation?
    
    private let map = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        return map
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        refreshAnnotation()
    }
    
    private func refreshAnnotation() {
        map.removeAnnotations(map.annotations)
        if let annotation = annotation {
            map.addAnnotation(annotation)
        }
    }
}

// Provides a map annotation immediately
class SynchronousAnnotationMaker {
    var annotation: MKAnnotation? = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.345589, longitude: -6.286951), addressDictionary: ["City":"Dublin", "Country":"Ireland"])
}

//// Main view. Vertical stack of two map views
//struct ContentView: View {
//
//    // Provides an annotation immedidately (synchronously)
//    var synchronousAnnotationMaker = SynchronousAnnotationMaker()
//    // Provides an annotation after some delay (asynchronously)
//    @ObservedObject var asynchronousAnnotationMaker = AsynchronousAnnotationMaker()
//
//    var body: some View {
//        VStack {
//            MapView(annotation: synchronousAnnotationMaker.annotation).edgesIgnoringSafeArea(.all)
//            MapView(annotation: asynchronousAnnotationMaker.annotation).edgesIgnoringSafeArea(.all)
//                .onAppear {
//                    self.asynchronousAnnotationMaker.makeAnnotation()
//            }
//        }
//    }
//}
//
//// Map view. Displays a map and a single map annotation.
//struct MapView: UIViewRepresentable {
//
//    var annotation: MKAnnotation?
//
//    private let map = MKMapView()
//
//    func makeUIView(context: Context) -> MKMapView {
//        return map
//    }
//
//    func updateUIView(_ mapView: MKMapView, context: Context) {
//        // Orignal method call
//        //refreshAnnotation()
//
//        // Correct method call
//        refreshAnnotation(forMapView: mapView)
//    }
//
//    // The Simple Mistake...
//    // Initial implementation, works when annotation is immediately available
//    // However, note that this method is updating the private map property, NOT the mapView passed in the `updateUIView` call
//    private func refreshAnnotation() {
//        map.removeAnnotations(map.annotations)
//        if let annotation = annotation {
//            map.addAnnotation(annotation)
//        }
//    }
//
//
//    // Correct implementation, works when annotation is immediately available, or fetches asynchronously
//    // However, note that this method is correctly updating the mapView passed in the `updateUIView` call
//    private func refreshAnnotation(forMapView mapView: MKMapView) {
//        mapView.removeAnnotations(map.annotations)
//        if let annotation = annotation {
//            mapView.addAnnotation(annotation)
//        }
//    }
//}
//
//
//// Provides a map annotation immediately
//class SynchronousAnnotationMaker {
//    var annotation: MKAnnotation? = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.345589, longitude: -6.286951), addressDictionary: ["City":"Dublin", "Country":"Ireland"])
//}
//
//// Provides a map annotation afte some delay. A timer is used to simulate a delay which may occur due to a network request
//class AsynchronousAnnotationMaker: ObservableObject {
//
//    @Published var annotation: MKAnnotation?
//
//    func makeAnnotation() {
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
//            //self.annotation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.345589, longitude: -6.286951))
//            self.annotation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.345589, longitude: -6.286951), addressDictionary: ["City":"Dublin", "Country":"Ireland"])
//        }
//    }
//}
