//
//  ContentView.swift
//  MacLandMarks
//
//  Created by Hur Ali on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandMarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
