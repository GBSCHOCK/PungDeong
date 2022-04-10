//
//  SwiftUIView-nextbutton.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/08.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("환영해요")
                .multilineTextAlignment(.center)
                .background(Color.white)
                .font(.system(size: 50))
                .foregroundColor(.black)
            Image("캐릭터")
                //테스트 관련 설명 이미지 자리
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            EditButton()
        
        
        }
      
        
    }
}


struct EditButton: View {
    var body: some View {
        VStack{
            Spacer()
            
            ZStack{
                Rectangle()
                    .fill(Color(red: 0.359, green: 0.731, blue: 0.963))
                    .frame(width: 300, height: 60)
                
                Text("지금 시작하기")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    //.bold()
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}


struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
