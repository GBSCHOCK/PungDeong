//
//  PungDeongApp.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI
import KakaoSDKCommon

@main
struct PungDeongApp: App {
    
    //SwiftUI 지원 안되는 라이브러리 사용을 위해 선언
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//MARK: - AppDelegate SwiftUI 지원 안되는 라이브러리 사용을 위해 선언
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
                //패키지 초기화 작업 수행
        //🚨 Merge 전 APP key 반드시 수정 !! [ ]
        KakaoSDK.initSDK(appKey: "c99afea96191236b7d142ebe483ca142")
//        if let url = URLContexts.first?.url {
//                    print("url : \(url)")
//        }

        return true
    }
}
