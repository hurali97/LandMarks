//
//  LandMarkDetail.swift
//  WatchLandMarks WatchKit Extension
//
//  Created by Hur Ali on 2/27/22.
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
            VStack {
                CircleImage(image: landMark.image.resizable())
                    .scaledToFit()

                Text(landMark.name)
                    .font(.headline)
                    .lineLimit(0)

                Toggle(isOn: $modelData.landMarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }

                Divider()

                Text(landMark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)

                Text(landMark.state)
                    .font(.caption)

                Divider()

                MapView(coordinate: landMark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandMarkDetail(landMark: modelData.landMarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")

            LandMarkDetail(landMark: modelData.landMarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
