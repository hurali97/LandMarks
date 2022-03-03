//
//  LandMarkList.swift
//  LandMarks
//
//  Created by Hur Ali on 1/18/22.
//

import SwiftUI

struct LandMarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: LandMark?

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [LandMark] {
        modelData.landMarks.filter { landmark in
             (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
         }
     }
    
    var title: String {
        let title = filter == .all ? "LandMarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landMarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandMarkDetail(landMark: landmark)
                    } label: {
                        LandMarkRow(landMark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                               Label("Favorites only", systemImage: "star.fill")
                           }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Landmark")
        }
        .modifierif(index != nil) { _view in
            _view.focusedValue(\.selectedLandmark, $modelData.landMarks[index ?? 0])
        }
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `modifierif`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct LandMarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkList()
            .environmentObject(ModelData())
//        ForEach(["iPhone 8", "iPhone 11 Pro with Watch"], id: \.self) { deviceName in
//                LandMarkList()
//                       .previewDevice(PreviewDevice(rawValue: deviceName))
//                       .previewDisplayName(deviceName)
//            }
    }
}
