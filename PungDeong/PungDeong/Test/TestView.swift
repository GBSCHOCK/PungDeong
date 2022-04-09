//
//  TestView.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        NavigationView {
            TestPageView(test: test, pageIndex:0)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
