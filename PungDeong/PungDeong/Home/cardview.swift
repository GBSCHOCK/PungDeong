//
//  cardview.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/08.
//

import SwiftUI

// 카드뷰용 연습장입니다.

struct cardview: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack{
                CardView(title: "Game 1", description: "first game comes here")
                
                CardView(title: "Game 2", description: "second game comes here")
            }
            
            CardView(title: "Game 3", description: "the last game comes here")
            
            Spacer()
        }
        .padding()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5){
                Text("Additional Contents")
                    .font(.system(.largeTitle, design:.rounded))
                    .fontWeight(.black)
                Text("we will probably add some mini games here")
                    .font(.title2)
            }
            Spacer()
        }
    }
}

struct CardView: View {
    var title: String
    var description: String

    var body: some View {
        VStack(spacing: 20) {
            Image("물개")
                .resizable()
                .frame(width: 100, height: 100)
            VStack(spacing: 10) {
                Text(title)
                    .font(.system(.title2, design:.rounded))
                    .fontWeight(.black)
                Text(description)
                    .font(.body)
                    .fontWeight(.bold)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 250)
        .padding(10)
        .background(Color(.sRGB, red: 255/255, green: 248/255, blue: 243/255))
        .cornerRadius(20)
    }
}

struct cardview_Previews: PreviewProvider {
    static var previews: some View {
        cardview()
    }
}
