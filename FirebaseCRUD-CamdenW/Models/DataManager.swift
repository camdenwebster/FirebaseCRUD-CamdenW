//
//  DataManager.swift
//  FirebaseCRUD-CamdenW
//
//  Created by Camden Webster on 4/12/24.
//

import SwiftUI
import Firebase

class DataManager: Identifiable, ObservableObject {
    @Published var inventoryItems: [InventoryItem] = []
    
    init() {
        fetchInventoryItems()
    }
    
    // Create & Update
    func addInventoryItem(_ item: InventoryItem) {
        let db = Firestore.firestore()
        let ref = db.collection("inventoryItems").document(item.id)
        ref.setData(["id":item.id, "title":item.title, "location":item.location]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // Read
    func fetchInventoryItems() {
        inventoryItems.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("inventoryItems")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
                }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    
                    let inventoryItem = InventoryItem(id: id, title: title, location: location)
                    self.inventoryItems.append(inventoryItem)
                }
            }
        }
        
    }
        
    // Delete
    func deleteInventoryItem(_ item: InventoryItem) {
        let db = Firestore.firestore()
        let ref = db.collection("inventoryItems").document(item.id)
        ref.delete() { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

