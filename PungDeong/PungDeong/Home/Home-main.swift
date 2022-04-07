//
//  Home-main.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/07.
//

import SwiftUI


struct Home_main: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("물개")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,
                           height: 200,
                           alignment: .center)
                    .padding()
                
                /* NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        ContinueButton()
                }) */
                
                NavigationLink(
                    destination: Text("Game Page"),
                    label: {
                        CardView(image: "작은물개", category: "첫 번째 게임", heading: "명탐정 물개와 함께", explanation: "마을의 평화를 해치는 범인을 찾아보아요!")
                    })
            }
            .toolbar {
                NavigationLink(
                    destination: Text("Profile"),
                    label: {
                        ToolbarImage()
                    })
            }
            .navigationBarItems(leading: Image("물개")
                .resizable()
                .frame(width: 50, height: 50, alignment: .topLeading))
            
            // 1번 2번 키워드 : toolbar, toolBarItem, navigationBarLeading, navigationBarTrailing
            
            
            //.navigationTitle("환영해요!")
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ToolbarImage: View {
    var body: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .frame(width: 30.0, height: 30.0)
            .foregroundStyle(
                .linearGradient(
                    colors: [.pink, .teal],
                    startPoint: .top,
                    endPoint: .bottom
                ) // 컬러 바꾸기
            )
    }
}

/* struct ContinueButton: View {
    var body: some View {
        Text("Continue")
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
} */


// 카드 뷰가 두개로 나뉘는게 좋을듯 합니다. (frame에 주석 참고)
// ex) SmallCardView, LargeCardView
// Home_main에서 HStack 과 VStack을 활용하여 만들어준 카드를 배치해줍니다. Stack 속에 Stack도 얼마든지 가능합니다.
struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var explanation: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,
                       height: 200,
                       alignment: .center)
            //frame 을 카드 종류에 맞게 조정해야합니다!
            //키워드 GeometryReader 사용하면 좋습니다. 하지만 여유가 없으시면 지금처럼 숫자로 값을 조정해주세요.
                .padding()
            
            HStack{
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(explanation)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
                
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct Home_main_Previews: PreviewProvider {
    static var previews: some View {
        Home_main()
    }
}
