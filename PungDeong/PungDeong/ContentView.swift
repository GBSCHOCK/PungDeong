//
//  ContentView.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        LogInView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
