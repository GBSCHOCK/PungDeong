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
        LogInView().onAppear(){
            FirebaseDB().addEmail(email: "kshy1019@naver.com")
            FirebaseDB().addTest(email: "kshy1019@naver.com", test: Test(selects: [1,2,3,4,5], type: 5))
            FirebaseDB().getUserInfo(email: "kshy1019@naver.com", userInfo: userInfo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
