//
//  Block.swift
//  mm-pocket
//
//  Created by Olha Pavliuk on 24.04.2022.
//

import Combine
import Foundation
import SwiftUI

struct BlockView: View {
    @State var block: Block
    @State var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            //.background(Color.red) // block.color
            .cornerRadius(3.0)
            .colorMultiply(block.color)
            .onAppear(perform: {
                text = block.text
            })
    }
}
