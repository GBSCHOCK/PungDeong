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
                .frame(width: 240, height: 240)
                .overlay(Circle().stroke(.gray, lineWidth: 1))
                .padding(.vertical)
                
               
            
            
            ForEach(resultData) { result in
                
                HStack {
                    Text("\(result.id)")
                        .fontWeight(.semibold)
                        .padding(.leading)
                    Spacer()
                    ProgressView(value: result.score, total: 10)
                        .frame(width: 230,height: 20)
                        .padding(.horizontal, 20)
                        .progressViewStyle(ResultProgressStyle())
                }
            }
            
            Spacer()
            
            HStack {
                Button {
                    print("DEBUG: Share Button has tapped")
                } label: {
                    HStack {


//                        Image(systemName: "square.and.arrow.up")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
                            
                            
                    }
                    .padding()
                    .frame(width: 50, height: 50)
                    .background(Color("main"))
                    .cornerRadius(25)
                }
                .padding(.horizontal, 6)
                
                
                
                Button {
                    print("DEBUG: Button has tapped")
                } label: {
                    HStack {
                        Text("메인화면으로 가기")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(Color("main"))
                    .cornerRadius(10)
                
                }
            }
        }
    }
}

//MARK: - 프로그레스 바 뷰 스타일

struct ResultProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
            .tint(Color("main"))
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
