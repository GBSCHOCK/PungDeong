//
//  PungDeongApp.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI

@main
struct PungDeongApp: App {
    
    @StateObject var googleUserAuth: GoogleUserAuthModel =  GoogleUserAuthModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(googleUserAuth)
            
//            NavigationView{
//                ContentView()
//            }.environmentObject(userAuth)
//            .navigationViewStyle(.stack)
        }
    }
}
