//
//  UserInfo.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/10.
//

import SwiftUI

class UserInfo: Identifiable {
    public var userInfo = UserInfo()

    var email = ""
    var test : Test?
    var content1 : Content1?
    var content2 : Content2?
}

struct Test {
    var complete: Bool
    var selects: [Int:Int]
    var type: Int
}

struct Content1 {
    var complete: Bool
}

struct Content2 {
    var complete: Bool
}
