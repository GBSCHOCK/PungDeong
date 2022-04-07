//
//  TestResultView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/07.
//

import SwiftUI

struct ResultData: Identifiable {
    let id: String
    let score: Double
}

struct TestResultView: View {
    
    @State private var resultData: [ResultData] = [
        ResultData(id: "정보 확인형", score: 0.3),
        ResultData(id: "근거 찾는형", score: 0.5),
        ResultData(id: "전문가 자문형", score: 0.2),
        ResultData(id: "바보형", score: 0.4),
        ResultData(id: "본문 정독형", score: 0.9)
        
        
    ]
    
    var body: some View {
        VStack {
            Text("당신의 결과는")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("wow")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(resultData) { result in
                ProgressView("\(result.id)", value: result.score)
                    .padding(.horizontal)
                    .progressViewStyle(ResultProgressStyle())
            }
        }
    }
}

struct ResultProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
