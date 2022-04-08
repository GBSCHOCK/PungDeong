//
//  TestResultView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/07.
//

import SwiftUI



struct ResultData: Identifiable {
    
    let id: Int
    let score: Double
    
    var description: String? {
        
        switch self.id {
        case 1:
            return "정보 재확인"
        case 2:
            return "근거 조사"
        case 3:
            return "전문가 자문"
        case 4:
            return "사실 재확인"
        case 5:
            return "중립"
        default:
            print("DEBUG: 잘못된 타입 값입니다.")
            return nil
        }
    }
}




struct TestResultView: View {
    
    
    //데이터 건네져 옴
    @State private var resultData: [ResultData] = [
        ResultData(id: 1, score: 3),
        ResultData(id: 2, score: 8),
        ResultData(id: 3, score: 6),
        ResultData(id: 4, score: 2),
        ResultData(id: 5, score: 4)
    ]
    
    @State private var type: Int = 0
    
    
    
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
                
                
                VStack {
                    ForEach(resultData) { result in
                        
                        HStack {
                            Spacer()
                            
                            Text("\(result.description ?? "")")
                                .fontWeight(.semibold)
                                .frame(alignment: .trailing)
                                .padding(.horizontal)
                            
                            
                            
                            
                            ZStack {
                                ProgressView(value: result.score, total: 10)
                                    .frame(width: 150,height: 20)
                                    .padding(.trailing, 30)
                                    .progressViewStyle(ResultProgressStyle())
                                    .tint(result.score > 5 ? Color.pink : Color("main"))
                                
                            }
                        }
                    }
                }
                .frame(alignment: .center)
                .offset(x: -40, y: 0)
                
                HStack {
                    Text("#교수님사랑 #대학원생운명")
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                
                    Spacer()
                }
                .padding(.top, 10)
                
                
                Text("당신은 사실여부가 확실하지 않을 때는 반드시 전문가에게 찾아가고야 마는 대학원생 물개시군요!. 불확실한 정보 보다는 교수님의 말을 전적으로 믿으시는 당신!")
                    .lineLimit(3)
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.top, 1)
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
        GeometryReader { geometry in
            
            let width: CGFloat = geometry.size.width
            
            ZStack(alignment: .leading) {
                       RoundedRectangle(cornerRadius: 5)
                           .frame(width: width, height: 10)
                           .foregroundColor(.gray.opacity(0.1))
                           .overlay(Color.black.opacity(0.5)).cornerRadius(14)
                       
                       RoundedRectangle(cornerRadius: 5)
                           .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * width, height: 10)
                           .foregroundColor(Color("main"))
                
                //반응형 UI 로 로직 수정 필요
                ForEach(1..<5) { i in
                    Rectangle()
                        .frame(width: 1.5, height: 20)
                        .foregroundColor(.white)
                        .offset(x: CGFloat(-2 + i * Int(width) / 5))
                }
            }
            
        }
        
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
