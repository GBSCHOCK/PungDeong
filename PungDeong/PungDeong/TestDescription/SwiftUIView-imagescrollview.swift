//
//  SwiftUIView-imagescrollview.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/08.
//

import SwiftUI

struct TestDescriptionContent: View {
    
    let images:[Image] = [Image("텍스트설명1"), Image("텍스트설명2"), Image("텍스트설명3")]
    
    var body: some View {
        
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(images.indices) { index in
                        images[index]
                    }
                    .frame(width: 300, height: 200)
                }
            }
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
}
