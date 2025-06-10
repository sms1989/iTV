//
//  Item.swift
//  iTv
//
//  Created by Mohammad Shobeiri on 3/20/1404 AP.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
