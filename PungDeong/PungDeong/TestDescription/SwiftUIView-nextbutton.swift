//
//  SwiftUIView-nextbutton.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/08.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("환영해요")
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .font(.system(size: 50))
                    .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.leading, 30)
                
                Image("seal")
                    //테스트 관련 설명 이미지 자리
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                
                NavigationLink {
                    TestDescriptionContent()
                } label: {
                    EditButtonView()
                }
               

                
            
            
            }
        }
    }
}


struct EditButtonView: View {
    var body: some View {
 
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.359, green: 0.731, blue: 0.963))
                .frame(height: 50)
                .padding(20)
                
                
            
            Text("테스트 시작하기")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                //.bold()
                .padding()
                .foregroundColor(.white)
        }
        
        
    }
}


struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
