//
//  NativePopoverBootcamp.swift
//  SwiftThinking
//
//  Created by 毛蔚 on 2024/1/14.
//

import SwiftUI

struct NativePopoverBootcamp: View {
    
    @State private var showPopover: Bool = false
    @State private var feedbackOptions: [String] = [
        "Very good",
        "Average",
        "Very bad"
    ]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            Button("Provide feedback?") {
                showPopover.toggle()
            }
            .padding(20)
            .background(.yellow)
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.top), content: {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12, content: {
                        ForEach(feedbackOptions, id: \.self) { option in
                            Button(option) {
                                
                            }
                            if option != feedbackOptions.last {
                                Divider()
                            }
                        }
                    })
                    .padding(20)
                    //                Text("Hello, subscribers!")
                    .presentationCompactAdaptation(.popover)
                }
            })
//            .popover(isPresented: $showPopover, content: {
//                Text("Hello, subscribers!")
//                    .presentationCompactAdaptation(.popover)
//            })
        }
    }
}

#Preview {
    NativePopoverBootcamp()
}
