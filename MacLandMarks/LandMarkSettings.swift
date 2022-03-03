//
//  LandMarkSettings.swift
//  LandMarks
//
//  Created by Hur Ali on 3/3/22.
//

import SwiftUI

struct LandMarkSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct LandMarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkSettings()
    }
}
