//
//  SwiftUIView-teststartbutton.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/11.
//

import SwiftUI

struct SwiftUIView_teststartbutton: View {
    var body: some View {
        VStack(alignment: .leading){
               Image("캐릭터")
        //테스트 시작하기 관련 이미지 자리
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        Button(action: {
                    //버튼을 클릭했을 때 실행되는 코드
                    print("테스트")
                }){
                    //버튼의 보여지는 UI 코드
                    Text("테스트 시작하기")
                        .font(.system(size:30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .backgroundColor(.pink)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.pink, lineWidth: 5)
                }
                    
    }
}
}


struct SwiftUIView_teststartbutton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_teststartbutton()
    }
}
