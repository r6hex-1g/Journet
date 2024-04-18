import SwiftUI
import MapKit
import CoreLocation

// MARK: - Map View
struct MapView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
    @State var isShowMap: Bool = false
    
    var body: some View {
        if isShowMap {
            Map(coordinateRegion: $region, showsUserLocation: true)
        }
        
        Button("현재 위치의 지도 보기") {
            let manager = CLLocationManager()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            
            let latitude = manager.location?.coordinate.latitude
            let longitude = manager.location?.coordinate.longitude
            
            region = MKCoordinateRegion(
                
            )
        }
    }
}


#Preview {
    MapView()
}
