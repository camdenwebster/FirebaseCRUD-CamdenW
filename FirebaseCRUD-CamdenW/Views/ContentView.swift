//
//  ContentView.swift
//  FirebaseCRUD-CamdenW
//
//  Created by Camden Webster on 4/8/24.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var inventoryData: DataManager
//    var inventoryItem: InventoryItem = inve
    var body: some View {
        InventoryList()
    }
}

#Preview {
    ContentView()
        .environmentObject(DataManager())
}
