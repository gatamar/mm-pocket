//
//  Block.swift
//  mm-persistence-choice
//
//  Created by Olha Pavliuk on 20.04.2022.
//

import Foundation
import Combine
import CoreGraphics
import SwiftUI

typealias BlockID = UUID

struct Block: Hashable, Identifiable {
    let id: BlockID
    let center: CGPoint
    let color: Color
    let text: String
    static let radius: Double = 20
    
    init(id: BlockID = UUID(), center: CGPoint, text: String, color: Color = .blue) {
        self.id = id
        self.center = center
        self.text = text
        self.color = color
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
