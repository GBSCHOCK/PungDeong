//
//  SettingView.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/06.
//

import SwiftUI

struct SettingView: View {
    let menus: [String : String] = ["연결 계정 관리" : "arrow.triangle.2.circlepath","푸시 알림 설정" : "bell","다크 모드 설정" : "macmini","공지사항" : "info.circle"]
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    VStack {
                        List {
                            Section(header: ListHeader().frame(width: geometry.size.width, alignment: .leading).background(Color("VeryLightBlue")).padding(-6)) {
                                ForEach(menus.sorted(by: >), id: \.key) { key, value in
                                    NavigationLink(
                                        destination: DetailView(data: key)) {
                                            Image(systemName: value)
                                                .foregroundColor(Color.blue)
                                            Text(key)
                                        }.padding(10)
                                }
                            }
                        }
                        .listStyle(.plain)
                        .padding(0)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("로그아웃")
                        }).buttonStyle(SettingButtonStyle())
                        Button(action: {
                            
                        }, label: {
                            Text("회원탈퇴")
                        })
                        .buttonStyle(SettingButtonStyle())
                        .padding(30)
                        Spacer()
                    }
                    .frame(width: .infinity, height: geometry.size.height/1)
                    Spacer()
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct DetailView: View {
    var data: String
    var body: some View {
        VStack {
            Text(data)
        }
    }
}

struct ListHeader: View {
    var body: some View {
        VStack {
            Text("계정")
                .foregroundColor(Color("CustomGray"))
                .font(.system(size: 25, weight: .bold))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
        .frame(height: 50)
    }
}

struct SettingButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 45)
            .font(.system(size: 14))
            .foregroundColor(Color.white)
            .background(Color("LightBlue"))
            .cornerRadius(6.0)
    }
}

struct NotificationSettingView: View {
    var body: some View {
        VStack {
            
        }
    }
}

