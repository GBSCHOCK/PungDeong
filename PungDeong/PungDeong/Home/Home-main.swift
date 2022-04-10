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
            ScrollView {
            VStack {
                //HeaderView()
                
                Image("물개")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,
                           height: 200,
                           alignment: .center)
                    .padding()
                
                HeaderView()
                
                HStack{
                    NavigationLink(
                        destination: Text("game 1"),
                        label: {
                            CardView(image: "작은물개", category: "Game 1", heading: "blank", description: "first game comes here")
                        })
                    
                    NavigationLink(
                        destination: Text("game 2"),
                        label: {
                            CardView(image: "작은물개", category: "Game 2", heading: "blank", description: "second game comes here")
                        })
                }
                
                NavigationLink(
                    destination: Text("game 3"),
                    label: {
                        CardView(image: "물개", category: "Game 3", heading: "blank", description: "the last game comes here")
                    })
                Spacer()
                
            }
            .padding()
            .toolbar {
                NavigationLink(
                    destination: Text("Profile"),
                    label: {
                        ToolbarImage()
                    })
            }
            .navigationBarItems(leading: Image("심볼")
                .resizable()
                .frame(width: 50, height: 50, alignment: .topLeading))
        
            }
        }
    }
}

struct Home_main_Previews: PreviewProvider {
    static var previews: some View {
        Home_main()
    }
}
