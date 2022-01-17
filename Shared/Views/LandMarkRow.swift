//
//  LandMarkRow.swift
//  LandMarks
//
//  Created by Hur Ali on 1/18/22.
//

import SwiftUI

struct LandMarkRow: View {
    var landMark: LandMark
    
    var body: some View {
        HStack {
            landMark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landMark.name)
            Spacer()
        }
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandMarkRow(landMark: landMarks[0])
            LandMarkRow(landMark: landMarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
