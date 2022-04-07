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
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        ContinueButton()
                })
                
                NavigationLink(
                    destination: Text("Game Page"),
                    label: {
                        CardView(image: "작은물개", category: "첫 번째 게임", heading: "명탐정 물개와 함께", explanation: "마을의 평화를 해치는 범인을 찾아보아요!")
                })
            }
            .navigationTitle("환영해요!")
            // .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContinueButton: View {
    var body: some View {
        Text("Continue")
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
}

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
