//
//  TestResultView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/07.
//

import SwiftUI
import UIKit


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}



struct TestResultView: View {
    
    private var viewModel =  TestResultViewModel()
    
    @State private var type: Int = 0
    
    var onlyResultView: some View {
        GeometryReader { geometry in
            VStack {
                ResultTopView()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                
                ResultBarView()
                    .offset(x: -geometry.size.width / 10)
                
                HStack {
                    Text("#교수님사랑 #예비대학원생")
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
        }
                
            
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ScrollView {
                        onlyResultView
                    }
                    
                                
                    Spacer()
                    
                    HStack {
                        
                        Button {
                            print("DEBUG: Button has tapped")
                            
                            // 메인화면 이동 메서드 호출
                            
                        } label: {
                            HStack {
                                Text("메인화면으로 가기")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(width: 260, height: 50)
                            .foregroundColor(.white)
                            .background(Color("main"))
                            .cornerRadius(10)
                            
                        
                        }
                        .padding(20)
                        
                        Spacer()
                    }
                }
                
                ShareMenu(delegate: self)
            }
        }
    }
    
    
}




extension TestResultView: ShareButtonDelegate {
    func kakaoButtonTapped() {
        print("DEBUG: kakao delegate method")
        viewModel.shareKakao()
    }
    
    func savePhotoButtonTapped() {
        print("DEBUG: save photo delegate method")
        let image = onlyResultView.snapshot()
        
        viewModel.saveImage(image: image)
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
