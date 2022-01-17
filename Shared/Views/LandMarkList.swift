//
//  LandMarkList.swift
//  LandMarks
//
//  Created by Hur Ali on 1/18/22.
//

import SwiftUI

struct LandMarkList: View {
    var body: some View {
        NavigationView {
            List(landMarks) { landmark in
                NavigationLink {
                    LandMarkDetail(landMark: landmark)
                } label: {
                    LandMarkRow(landMark: landmark)
                }
            }
            .navigationTitle("LandMarks")
        }
    }
}

struct LandMarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone 11 Pro with Watch"], id: \.self) { deviceName in
                LandMarkList()
                       .previewDevice(PreviewDevice(rawValue: deviceName))
                       .previewDisplayName(deviceName)
            }
    }
}
