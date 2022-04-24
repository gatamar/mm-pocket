//
//  ContentView.swift
//  mm-pocket
//
//  Created by Olha Pavliuk on 24.04.2022.
//

import SwiftUI

func modelBlocks() -> [Block] {
    return [
        Block(id: UUID(), center: .zero, color: .blue),
        Block(id: UUID(), center: .zero, color: .red),
        Block(id: UUID(), center: .zero, color: .yellow),
        Block(id: UUID(), center: .zero, color: .yellow)
    ]
}

struct ContentView: View {
    @State var blocks: [Block] = modelBlocks()
    
    // To show dynamic...
    @State var columns: Int = 2
    
    // Smooth Hero Effect...
    @Namespace var animation
    
    var body: some View {
        StaggeredGrid(columns: columns,
                      list: blocks,
                      content: { block in
            
            // Post Card View...
            BlockView(block: block)
                .matchedGeometryEffect(id: block.id, in: animation)
        })
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
