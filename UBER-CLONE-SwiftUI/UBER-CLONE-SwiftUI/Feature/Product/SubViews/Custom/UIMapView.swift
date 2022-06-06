//
//  UIMapView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 4.06.2022.
//

import Foundation
import SwiftUI
import MapKit

struct UIMapView : UIViewRepresentable {


   @Binding var region : MKCoordinateRegion
   @Binding var polyLine : MKPolyline?
   @Binding var annotations : [MKAnnotation]?
   @Binding var selectedAnnotation : MKAnnotation?

   func makeUIView(context: Context) -> MKMapView {
      let mapview = MKMapView()
      mapview.region = self.region
      mapview.userTrackingMode = .follow
      mapview.centerCoordinate = region.center
      
      mapview.delegate = context.coordinator
      return mapview
   }

   func updateUIView(_ uiView: MKMapView, context: Context) {
      //print("DEBUG : \(polyLine)")
      context.coordinator.polyLine = $polyLine.wrappedValue
      print("DEBUG :" + selectedAnnotation.debugDescription)


      if let polyLine = polyLine {
           uiView.removeOverlays(uiView.overlays)
           uiView.addOverlay(polyLine)
      }
      annotations != nil ? uiView.addAnnotations(annotations!) : nil
      updateSelectedAnnotations(uiView: uiView)
   }

   func makeCoordinator() -> Coordinator {
      return Coordinator(polyLine)
   }

   class Coordinator : NSObject , MKMapViewDelegate {
       var polyLine : MKPolyline?


      init(_ incomingPolyline : MKPolyline?) {
         polyLine = incomingPolyline
      }

      func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // print("DEBUG : Coordinator polyLine \(polyLine)")
         if let polyLine = polyLine {
            let lineRenderer = MKPolylineRenderer(polyline:polyLine)
            lineRenderer.strokeColor = .black
            lineRenderer.lineWidth = 3
            return lineRenderer
         }
         return MKOverlayRenderer()
      }

//      func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//         mapView.removeOverlays(mapView.overlays)
//         mapView.removeAnnotations(mapView.annotations)
//      }
   }



   private func updateSelectedAnnotations(uiView : MKMapView) {
         // print("DEBUG : Selected annotation : \(polyLine == nil)")
     // print("DEBUG : Mapview polyline \(polyLine)")
      if let selectedAnnotation = selectedAnnotation {
       //  print("DEBUG : BURAYA GİRDİ")
         uiView.removeAnnotations(uiView.selectedAnnotations)
         uiView.addAnnotation(selectedAnnotation)
         uiView.selectAnnotation(selectedAnnotation, animated: true)
         uiView.showAnnotations([selectedAnnotation, uiView.userLocation], animated: true)
      }

         //updateSelectedAnnotations(uiView: uiView)

   }

   private func updateCameraOnDeselect(uiView: MKMapView) {
      uiView.setCamera(MKMapCamera(lookingAtCenter: region.center,
                                   fromDistance: 20, pitch: 0, heading: 0), animated: true)
   }
}
