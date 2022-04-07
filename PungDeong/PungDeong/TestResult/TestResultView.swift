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
        ResultData(id: "근거 조사", score: 8),
        ResultData(id: "전문가 자문", score: 6),
        ResultData(id: "사실 재확인", score: 2),
        ResultData(id: "중립성", score: 4)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                
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
                }
                
                
                ForEach(resultData) { result in
                    
                    HStack {
                        VStack(alignment: .trailing) {
                            Text("\(result.id)")
                                .fontWeight(.semibold)
                                
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        ZStack {
                            ProgressView(value: result.score, total: 10)
                                .frame(width: 230,height: 20)
                                .padding(.trailing, 30)
                                .tint(result.score > 5 ? Color.pink : Color("main"))
                            .progressViewStyle(ResultProgressStyle())
                            
                        }
                    }
                }
                
                
                Text("당신은 사실여부가 확실하지 않을 때는 반드시 전문가에게 찾아가고야 마는 대학원생 물개시군요!. 불확실한 정보 보다는 교수님의 말을 전적으로 믿으시는 당신!")
                    .lineLimit(3)
                    .font(.body)
                    .padding()
                .multilineTextAlignment(.leading)
                    
                
            }
            
    
                        
            Spacer()
            
            HStack {
                Button {
                    print("DEBUG: Share Button has tapped")
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.white)
                            
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
        ZStack(alignment: .leading) {
                   RoundedRectangle(cornerRadius: 5)
                       .frame(width: 250, height: 10)
                       .foregroundColor(.gray.opacity(0.1))
                       .overlay(Color.black.opacity(0.5)).cornerRadius(14)
                   
                   RoundedRectangle(cornerRadius: 5)
                       .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 10)
                       .foregroundColor(Color("main"))
            
            //반응형 UI 로 로직 수정 필요
            ForEach(1..<6) { i in
                Rectangle()
                    .frame(width: 2, height: 20)
                    .foregroundColor(.white)
                    .offset(x: CGFloat(-2 + i * 40))
            }
        }
        .padding()
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
