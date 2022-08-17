//
//  landmarklist.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//
 
import SwiftUI


struct LandmarkList: View {
    @State private var showFavirutesOnly = false
    @EnvironmentObject var modelData:ModelData
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark : LankMark?
    enum FilterCategory:String,CaseIterable,Identifiable {
    case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id : FilterCategory{self}
    }
    
    var filteredLandmarks:[LankMark]  {
        modelData.landmarks.filter { landmark in
            (!showFavirutesOnly || landmark.isFavorite) &&
            ( filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title : String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavirutesOnly ? "Favorite \(title)" : title
    }
    var index : Int? {
        modelData.landmarks.firstIndex {
            $0.id == selectedLandmark?.id
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavirutesOnly) {
                    Text("favorite only")
                }
            ForEach(filteredLandmarks,id:\.id) { landmark in
                NavigationLink {
                    LandmarkDetial(landmark: landmark)
                } label: {
                    VStack(alignment:.leading) {
                        Spacer()
                        LandmarkRow(landmark:landmark)
                            .frame(maxHeight:60)
                    }
                }

            }
            }
            .navigationTitle(title)
            .frame(minWidth:300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavirutesOnly) {
                            Label("Favorites", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                    
                } 
            }
            Text("Select a landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generatioin)","iPhone XS Max"], id:\.self, content: { deviceName in
            LandmarkList().environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue:deviceName))
                .previewDisplayName(deviceName)
        }
        )
    }
}
