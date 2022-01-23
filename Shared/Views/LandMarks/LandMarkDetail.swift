//
//  LandMarkDetail.swift
//  LandMarks
//
//  Created by Hur Ali on 1/18/22.
//

import SwiftUI

struct LandMarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landMark: LandMark
    
    var landmarkIndex: Int {
        modelData.landMarks.firstIndex(where: { $0.id == landMark.id })!
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: landMark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landMark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landMark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landMark.park)
                    Spacer()
                    Text(landMark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()

                Text("About \(landMark.name)")
                    .font(.title2)
                Text(landMark.description)
            }
            .padding()
        }
        .navigationTitle(landMark.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkDetail(landMark: ModelData().landMarks[0])
    }
}
