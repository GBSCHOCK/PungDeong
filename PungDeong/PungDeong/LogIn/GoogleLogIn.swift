//
//  GoogleLogIn.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/07.
//


import SwiftUI
import GoogleSignIn

// 구글 로그인 디자인 가이드 : https://developers.google.com/identity/branding-guidelines?hl=ko
struct GoogleLogIn: View {
    
    @EnvironmentObject var vm: UserAuthModel
        
    var body: some View {
        Button(action: vm.signIn, label: {
            HStack(alignment: .center, spacing: 24) {
                Image("ic_google").frame(width: 18, height: 18)
                Text("Google 계정으로 로그인")
            }
        })
        .padding(EdgeInsets(top: 8, leading: 11, bottom: 8, trailing: 11))
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(radius: 4.0)
    }
    
    fileprivate func SignInButton() -> Button<Text> {
        Button(action: {
            vm.signIn()
        }) {
            Text("Sign in with Google")
        }
    }

    fileprivate func SignOutButton() -> Button<Text> {
        Button(action: {
            vm.signOut()
        }) {
            Text("Sign Out")
        }
    }
        
    fileprivate func ProfilePic() -> some View {
        AsyncImage(url: URL(string: vm.profilePicUrl))
            .frame(width: 100, height: 100)
    }
    
    fileprivate func UserInfo() -> Text {
        return Text(vm.givenName)
    }
    
}
