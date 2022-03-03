//
//  LandMarkCommands.swift
//  LandMarks
//
//  Created by Hur Ali on 3/3/22.
//

import SwiftUI

struct LandMarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark

    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<LandMark>
}

extension FocusedValues {
    var selectedLandmark: Binding<LandMark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
