//
//  ContentView.swift
//  mm-pocket
//
//  Created by Olha Pavliuk on 24.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var blocks: [Block] = modelBlocks()
    
    // To show dynamic...
    @State var columns: Int = 2
    
    // Smooth Hero Effect...
    @Namespace var animation
    
    func makeBlockGreen(block: Block) {
        if let idx = blocks.firstIndex(where: { $0.id == block.id
        }) {
            withAnimation {
                blocks.remove(at: idx)
            }
            //blocks.remove(at: idx)
            //blocks[idx] = Block(id: block.id, center: block.center, text: "block.text", color: .green)
        }
    }
    var body: some View {
        VStack {
            StaggeredGrid(columns: columns,
                          showsIndicators: true,
                          list: blocks,
                          content: { block in
                
                // Post Card View...
                BlockView(block: block)
                    .matchedGeometryEffect(id: block.id, in: animation)
                    .onTapGesture {  }
                    .onLongPressGesture {
                        makeBlockGreen(block: block)
                    }
//                    .onLongPressGesture {
//                        makeBlockGreen(block: block)
//                    }
                    
            })
            .frame(height: 700, alignment: .top)
            .padding(.horizontal)
            .background(Color.gray)
            
            Rectangle().fill(Color.green)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
