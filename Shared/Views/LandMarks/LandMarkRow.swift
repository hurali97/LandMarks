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
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(landMark.name)
                    .bold()
                #if !os(watchOS)
                Text(landMark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }

            Spacer()
            
            if landMark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var landMarks = ModelData().landMarks

    static var previews: some View {
        Group {
            LandMarkRow(landMark: landMarks[0])
            LandMarkRow(landMark: landMarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
