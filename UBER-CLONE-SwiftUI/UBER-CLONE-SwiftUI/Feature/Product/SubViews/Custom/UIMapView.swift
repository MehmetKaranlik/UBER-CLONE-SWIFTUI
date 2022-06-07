//
//  UIMapView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 4.06.2022.
//

import Foundation
import MapKit
import SwiftUI

struct UIMapView: UIViewRepresentable {
   // MARK:  properties
   @Binding var region: MKCoordinateRegion
   @Binding var polyLine: MKPolyline?
   @Binding var annotations: [MKAnnotation]?
   @Binding var selectedAnnotation: MKAnnotation?

   func makeUIView(context: Context) -> MKMapView {
      let mapview = MKMapView()
      configureUIView(mapview, context)
      return mapview
   }

   func updateUIView(_ uiView: MKMapView, context: Context) {
      context.coordinator.polyLine = $polyLine.wrappedValue
      // update polyline
      updatePolyLine(uiView)
      // add driver annotations
      annotations != nil ? uiView.addAnnotations(annotations!) : nil
      // update destination annotation
      updateSelectedAnnotations(uiView: uiView)
   }

   func makeCoordinator() -> Coordinator {
      return Coordinator(polyLine)
   }

   // MARK:  coordinator
   class Coordinator: NSObject, MKMapViewDelegate {
      var polyLine: MKPolyline?

      init(_ incomingPolyline: MKPolyline?) {
         polyLine = incomingPolyline
      }

      func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         // build polyLineRenderer
         if let polyLine = polyLine {
            return buildLineRenderer(polyLine)
         }
         return MKOverlayRenderer()
      }

      func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
         mapView.removeAnnotation(view.annotation!)
      }

      // helpers
      fileprivate func buildLineRenderer(_ polyLine: MKPolyline) -> MKOverlayRenderer {
         let lineRenderer = MKPolylineRenderer(polyline: polyLine)
         lineRenderer.strokeColor = .black
         lineRenderer.lineWidth = 3
         return lineRenderer
      }
   }
}


// MARK:  functions
extension UIMapView {
   // insert || remove polyline based on binding
   fileprivate func updatePolyLine(_ uiView: MKMapView) {
      if let polyLine = polyLine {
         uiView.removeOverlays(uiView.overlays)
         uiView.addOverlay(polyLine)
      }

      if polyLine == nil, !uiView.overlays.isEmpty {
         uiView.removeOverlays(uiView.overlays)
         updateCameraOnDeselect(uiView: uiView)
         uiView.removeAnnotations(uiView.selectedAnnotations)
      }
   }

   // configure mapView options
   fileprivate func configureUIView(_ mapview: MKMapView, _ context: UIMapView.Context) {
      mapview.region = region
      mapview.userTrackingMode = .follow
      mapview.centerCoordinate = region.center
      mapview.delegate = context.coordinator
   }

   // update annotations on route select
   private func updateSelectedAnnotations(uiView: MKMapView) {
      if let selectedAnnotation = selectedAnnotation {
         uiView.removeAnnotations(uiView.selectedAnnotations)
         uiView.addAnnotation(selectedAnnotation)
         uiView.selectAnnotation(selectedAnnotation, animated: true)
         uiView.showAnnotations([selectedAnnotation, uiView.userLocation], animated: true)
      }
   }

   // deselect function on selected annotation
   private func updateCameraOnDeselect(uiView: MKMapView) {
      uiView.setCamera(MKMapCamera(lookingAtCenter: uiView.userLocation.coordinate,
                                   fromDistance: 2000, pitch: 0, heading: 0), animated: true)
   }
}
