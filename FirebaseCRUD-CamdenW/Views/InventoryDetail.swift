//
//  InventoryDetail.swift
//  FirebaseCRUD-CamdenW
//
//  Created by Camden Webster on 4/9/24.
//

import SwiftUI

struct InventoryDetail: View {
    
    var locations: [String] = ["None", "Kitchen", "Office", "Bedroom", "Bathroom", "Hallway Closet", "Basement", "Attic"]
    var categories: [String] = ["Musical instruments", "Kitchen appliances", "Decor", "Cooking Utensils"]
    
    @EnvironmentObject var inventoryData: DataManager

    @ObservedObject var inventoryItemToDisplay: InventoryItem
    @FocusState private var inputIsFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Enter item title", text: $inventoryItemToDisplay.title)
                       .focused($inputIsFocused)
                }
                //                    TextField("Model", text: $inventoryItemToDisplay.model)
                //                        .focused($inputIsFocused)
                //                    TextField("Manufacturer", text: $inventoryItemToDisplay.manufacturer)
                //                        .focused($inputIsFocused)
                //                    TextField("Price", value: $inventoryItemToDisplay.price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                //                    .keyboardType(.decimalPad)
                //                    .focused($inputIsFocused)
                Section("Details") {
                    Picker("Location:", selection: $inventoryItemToDisplay.location) {
                        ForEach(locations, id: \.self) {
                            Text($0)
                        }
                    }
//                    Picker("Category:", selection: inventoryItemToDisplay.$category) {
//                        ForEach(categories, id: \.self) {
//                            Text($0)
//                        }
                    }
                }
//                Section("Notes") {
//                    TextField("Enter item notes", text: inventoryItemToDisplay.$notes, axis: .vertical)
//                        .padding()
//                        .focused($inputIsFocused)
//                }
//            }
        }
        .navigationTitle(inventoryItemToDisplay.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: {
                inventoryData.addInventoryItem(inventoryItemToDisplay)
                print("Set item id \(inventoryItemToDisplay.id) title to \(inventoryItemToDisplay.title) and location to \(inventoryItemToDisplay.location)")
            }) {
                Text("Save").bold()
            }
        }
    }
}

#Preview {
    let inventoryItem = InventoryItem(id: "2d9aa668-fe7b-438a-bc79-09bf88f55308", title: "Coffee maker", location: "Kitchen")
    return InventoryDetail(inventoryItemToDisplay: inventoryItem)
}
