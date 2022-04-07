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
        ResultData(id: "정보 확인형", score: 3),
        ResultData(id: "근거 찾는형", score: 5),
        ResultData(id: "전문가 자문형", score: 6),
        ResultData(id: "바보형", score: 1),
        ResultData(id: "본문 정독형", score: 2)
        
        
    ]
    
    var body: some View {
        VStack {
            Text("당신의 결과는")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Text("전문가에게 물어보는 물개")
                .font(.title)
                .fontWeight(.bold)
            
            Image("test-image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            ForEach(resultData) { result in
                ProgressView("\(result.id)", value: result.score, total: 10)
                    .padding(.horizontal)
                    .progressViewStyle(ResultProgressStyle())
            }
            
            Spacer()
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
