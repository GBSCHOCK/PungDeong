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
                    .fill(Color.black).opacity(0.6)
                    .frame(width: 300, height: 70)
                
                Text("테스트 시작하기")
                    .font(.largeTitle)
                    .bold()
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

