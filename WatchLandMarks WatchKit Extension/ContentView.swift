//
//  ContentView.swift
//  WatchLandMarks WatchKit Extension
//
//  Created by Hur Ali on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandMarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
