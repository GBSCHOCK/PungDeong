//
//  SwiftUIView-imagescrollview.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/08.
//

import SwiftUI
import SwiftUITrackableScrollView

struct TestDescriptionContent: View {
    
    @State private var scrollViewContentOffset = CGFloat(0)
    
    let images:[Image] = [Image("test1"), Image("test2"), Image("test3")]
    
    @State var isShown: Bool = false
    
    var body: some View {
        
        ZStack {
 
            VStack {
                GeometryReader { proxy in
                    TrackableScrollView(.horizontal, showIndicators: false, contentOffset: $scrollViewContentOffset) {
                        HStack(spacing: 0) {
                            ForEach(images.indices) { index in
                                images[index]
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: proxy.size.width, height: proxy.size.height)
                                        
           
                            }
                        }
                    }
                    .onAppear {
                        UIScrollView.appearance().isPagingEnabled = true
                    }
                    .onChange(of: scrollViewContentOffset, perform: { value in
                            print("scrollViewContentOffset", scrollViewContentOffset)
                            // Do something
                        
                        
                        if scrollViewContentOffset > 700 {
                            withAnimation {
                                self.isShown = true
                            }
                            
                        }
                })
           }
                
                
                
                
                
            }

            
            
            
            
            if isShown {
                VStack {
                    
                    Spacer()
                    
                    Button {
                        // 실행될 코드
                    } label: {
                        EditButtonView()
                            
                    }
                .frame(height: 60)
                }
            } else {
                // 버튼 없어용
                
            }
        }
    }
}
            
            

struct TestDescriptionContent_Previews: PreviewProvider {
    static var previews: some View {
        TestDescriptionContent()
    }
}
