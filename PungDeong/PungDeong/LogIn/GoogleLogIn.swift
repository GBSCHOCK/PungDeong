//
//  GoogleLogIn.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/07.
//


import SwiftUI
import GoogleSignIn

struct GoogleLogIn: View {
    
    @EnvironmentObject var vm: UserAuthModel
        
    var body: some View {
        VStack{
            if(vm.isLoggedIn){
                SignOutButton()
            }else{
                SignInButton()
            }
            //Text(vm.errorMessage)
        }
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
