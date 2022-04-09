//
//  TestModel.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import Foundation
import SwiftUI

struct Test {
    
    let pages: [TestPage]
    
    subscript(_ pageIndex: Int) -> TestPage {
        return pages[pageIndex]
    }
}

struct TestPage {
    let text: String
    
    let choices:[Choice]
    
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let text: String
    let type: Int
}

struct Answer {
    static var answeredType: [Int] = []
    static var selects:[Int:Int] = [:]
    
//    init(_ pageLen:Int, typeLen:Int) {
//        self.answeredType = [Int](repeating: 0, count: pageLen)
//        for i in 1...5 {
//            self.selects.updateValue(i, forKey: 0)
//        }
//    }
}
