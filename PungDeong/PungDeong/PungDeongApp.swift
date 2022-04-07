//
//  PungDeongApp.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI

@main
struct PungDeongApp: App {
    
    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }.environmentObject(userAuth)
            .navigationViewStyle(.stack)
                        
        }
    }
}
