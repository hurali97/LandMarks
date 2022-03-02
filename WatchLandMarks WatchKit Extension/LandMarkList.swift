//
//  LandMarkList.swift
//  WatchLandMarks WatchKit Extension
//
//  Created by Hur Ali on 3/3/22.
//

import SwiftUI

struct LandMarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [LandMark] {
        modelData.landMarks.filter { landmark in
             (!showFavoritesOnly || landmark.isFavorite)
         }
     }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                      Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandMarkDetail(landMark: landmark)
                    } label: {
                        LandMarkRow(landMark: landmark)
                    }
                }
            }
            .navigationTitle("LandMarks")
        }
    }
}

struct LandMarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkList()
            .environmentObject(ModelData())
    }
}

