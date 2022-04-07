//
//  SettingView.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/06.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("헤더").frame(width: .infinity).font(.system(size: 30, weight: .bold)).foregroundColor(Color.black)) {
                        Text("Test1.....")
                        Text("Test2.....")
                        Text("Test3.....")
                        Text("Test4.....")
                    }
                }
                .frame(width: .infinity, height: 300)
                .listStyle(.plain)
            }
            VStack {
                Text("D")
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
