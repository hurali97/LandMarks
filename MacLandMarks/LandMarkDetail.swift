//
//  LandMarkDetail.swift
//  MacLandMarks
//
//  Created by Hur Ali on 3/3/22.
//

import SwiftUI
import MapKit

struct LandMarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landMark: LandMark
    
    var landmarkIndex: Int {
        modelData.landMarks.firstIndex(where: { $0.id == landMark.id })!
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landMark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landMark.locationCoordinate))
                    destination.name = landMark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landMark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landMark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading)  {
                            Text(landMark.park)
                            Text(landMark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                
                Text("About \(landMark.name)")
                    .font(.title2)
                Text(landMark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landMark.name)
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandMarkDetail(landMark: modelData.landMarks[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
    }
}
