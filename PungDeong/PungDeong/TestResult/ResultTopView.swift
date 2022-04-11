//
//  ResultTopView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/08.
//

import SwiftUI

struct ResultTopView: View {
    var body: some View {
    
        VStack {
            Text("당신의 결과는...")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Text("전문가에게 물어보는 물개")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("main"))
                
            
            Image("test-image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(Circle().stroke(.gray, lineWidth: 1))
                .padding(.vertical)
        }
    }
}

struct ResultTopView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTopView()
    }
}
