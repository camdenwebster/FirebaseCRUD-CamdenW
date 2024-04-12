//
//  InventoryItem.swift
//  FirebaseCRUD-CamdenW
//
//  Created by Camden Webster on 4/9/24.
//

import Foundation
import SwiftUI

class InventoryItem: Identifiable, ObservableObject {
    
    var id: String
    @Published var title: String
    @Published var quantity: Int?
    @Published var model: String?
    @Published var manufacturer: String?
    @Published var location: String
    @Published var category: String?
    @Published var price: Float?
    @Published var notes: String?
    
    init(id: String, title: String, quantity: Int? = nil, model: String? = nil, manufacturer: String? = nil, location: String, category: String? = nil, price: Float? = nil, notes: String? = nil) {
        self.id = id
        self.title = title
        self.quantity = quantity
        self.model = model
        self.manufacturer = manufacturer
        self.location = location
        self.category = category
        self.price = price
        self.notes = notes
    }
}
