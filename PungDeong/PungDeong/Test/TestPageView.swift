//
//  TestPageView.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import SwiftUI



struct TestPageView: View {
    
    let test: Test
    let pageIndex: Int
    
    @State private var showingAlert = false
    
    
    func unselected(index: Int) {
        let selectedType = test.pages[pageIndex].choices[index].type
        
        Answer.answeredType[pageIndex] = selectedType
        print(Answer.answeredType)
    }
    
    func selected(index: Int) {
        let selectedType = test.pages[pageIndex].choices[index].type
        
        Answer.answeredType[pageIndex] = selectedType
        print(Answer.answeredType)
    }
    
    
    var body: some View {
        ZStack {
            
            Color.orange.ignoresSafeArea()
        VStack {
            HStack {
                Spacer()
                if(pageIndex==0) {
                    Spacer()
                } else {
                    NavigationLink("이전",  destination: TestPageView(test: test, pageIndex: pageIndex-1)).navigationBarHidden(true)
                }
                if(pageIndex == test.pages.count - 1) {
                    Spacer()
                } else  {
                    NavigationLink("다음",  destination: TestPageView(test: test, pageIndex: pageIndex+1)).navigationBarHidden(true)
                }
                Spacer()
                NavigationLink("\(pageIndex+1)/20",  destination: {}).navigationBarHidden(true)
                Spacer()
            }
            ///
            /// 이미지가 들어갈 공간입니다.
            Image("TestImage_01")
                .resizable()
            ///
            Text(test.pages[pageIndex].text)
            if(pageIndex == test.pages.count-1) {
                Button(action:{
                    if Answer.answeredType[pageIndex] == 0 {
                        unselected(index: 0)
                    } else {
                        selected(index: 0)
                    }
                }) {
                    Text(test.pages[pageIndex].choices[0].text)
                }
                Button(action:{
                    if Answer.answeredType[pageIndex] == 0 {
                        unselected(index: 1)
                    } else {
                        selected(index: 1)
                    }
                }) {
                    Text(test.pages[pageIndex].choices[1].text)
                }
                Button(action:{
                    if Answer.answeredType[pageIndex] == 0 {
                        unselected(index: 2)
                    } else {
                        selected(index: 2)
                    }
                }) {
                    Text(test.pages[pageIndex].choices[2].text)
                }
            } else {
                
                NavigationLink(destination: TestPageView(test: test, pageIndex: pageIndex+1)) {Text(test.pages[pageIndex].choices[0].text)}.simultaneousGesture(TapGesture().onEnded{
                        if Answer.answeredType[pageIndex] == 0 {
                            unselected(index: 0)
                        } else {
                            selected(index: 0)
                        }
                }).navigationBarHidden(true)
                
                NavigationLink(destination: TestPageView(test: test, pageIndex: pageIndex+1)) {Text(test.pages[pageIndex].choices[1].text)}.simultaneousGesture(TapGesture().onEnded{
                        if Answer.answeredType[pageIndex] == 0 {
                            unselected(index: 1)
                        } else {
                            selected(index: 1)
                        }
                }).navigationBarHidden(true)
                
                NavigationLink(destination: TestPageView(test: test, pageIndex: pageIndex+1)) {Text(test.pages[pageIndex].choices[2].text)}.simultaneousGesture(TapGesture().onEnded{
                        if Answer.answeredType[pageIndex] == 0 {
                            unselected(index: 2)
                        } else {
                            selected(index: 2)
                        }
                }).navigationBarHidden(true)
            }
            
            
            if pageIndex == test.pages.count - 1 {
                
                NavigationLink(destination: {}){
                    Button("테스트 결과 보기") {
                        var index = 1
                        for answer in Answer.answeredType {
                            if answer == 0 {
                                showingAlert = true
                            }
                            index += 1
                        }
                        print("Result: \(Answer.answeredType)")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("결과 전송 실패"), message: Text("아직 응답하지 않은 문항이 있습니다."), dismissButton: .default(Text("확인")))
                    }
                }.navigationBarHidden(true)

                
            }
            
        }
        }
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TestPageView(test: test, pageIndex: 0).navigationBarHidden(true)
        }
    }
}
