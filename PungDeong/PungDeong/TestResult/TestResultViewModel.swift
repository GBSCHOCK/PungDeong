//
//  TestResultViewModel.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/07.
//

import SwiftUI

import Alamofire

import KakaoSDKLink
import KakaoSDKCommon
// 기본 템플릿 사용 시 필요
import KakaoSDKTemplate



class TestResultViewModel {
    
    static func shareKakao() {
        
        //결과 공유  type 1 ID
        let templateId = 74829
        
        LinkApi.shared.customLink(templateId: Int64(templateId)) { (linkResult, error) in
            if let error = error {
                print(error)
            }
            else {
                print("customLink() success.")
                if let linkResult = linkResult {
                    // 카카오톡 오픈
                    UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                }
            }
        }
    }
}
