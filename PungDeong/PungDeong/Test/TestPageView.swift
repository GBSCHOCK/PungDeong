//
//  TestPageView.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import SwiftUI



struct TestPageView: View {
    
    
    //MARK: - Propeties
    
    let test: Test
    @State var pageIndex: Int = 0
    @State var currentItem: TestPage
    
    init(test: Test) {
        self.test = test
        self.currentItem = test.pages[0]
    }
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var showingAlert = false
    @State private var isLastPage = false
    
    func selectingType(index: Int) {
        let selectedType = test.pages[pageIndex].choices[index].type
        
        Answer.answeredType[pageIndex] = selectedType
        print(Answer.answeredType)
        
        //페이징 넘기기
        if(pageIndex != test.pages.count - 1){
            pageIndex = pageIndex + 1
            self.currentItem = test.pages[pageIndex]
        }
    }
    
    /*
     * 이전, 다음, 목록 버튼에 대한 Style
     */
    struct navigationButtonStyle: ButtonStyle {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: screenWidth * 0.1, height: screenWidth * 0.1)
                .font(.body)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(100.0).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
    }
    
    /*
     * 이전, 다음 버튼이 사라지는 경우에 대한 Style
     */
    struct disabledNavButtonStyle: ButtonStyle {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: screenWidth * 0.1, height: screenWidth * 0.1)
                .font(.body)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(100.0).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                ).opacity(0)
        }
    }
    
    struct testNumButtonStyle: ButtonStyle {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: screenWidth * 0.2, height: screenWidth * 0.1)
                .font(.body)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(100.0).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
    }
    
    struct testButtonStyle: ButtonStyle {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: screenWidth * 0.9, height: 45)
                .foregroundColor(Color.white)
                .background(Color("TestButton"))
                .cornerRadius(6.0)
        }
    }
    
    struct chosenButtonStyle: ButtonStyle {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: screenWidth * 0.9, height: 45)
                .foregroundColor(Color("TestButton"))
                .background(Color("ChosenButton"))
                .cornerRadius(6.0)
        }
    }
    
    struct resultButtonStyle: ButtonStyle {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: screenWidth * 0.9, height: 45)
                .foregroundColor(Color.white)
                .background(Color("TestButton"))
                .cornerRadius(6.0)
        }
    }
    
    var body: some View {
        ZStack {
            // Background Color
            Color("TestBackground").ignoresSafeArea()
            
            VStack {
                HStack {
                    // 사용자 편의를 위한 Spacer
                    Spacer().frame(width:screenWidth * 0.08,height:screenWidth * 0.08)
                    
                    // 첫 번쨰 페이지인 경우 이전 버튼 사라짐
                    if pageIndex == 0 {
                        NavigationLink {} label: {
                            Image(systemName: "arrow.left")
                        }.navigationBarHidden(true).buttonStyle(disabledNavButtonStyle()).disabled(true)
                    } else {
                        Button(action:{
                            self.pageIndex = pageIndex - 1
                            self.currentItem = test.pages[pageIndex]
                        }) {
                            Image(systemName: "arrow.left")
                        }.buttonStyle(navigationButtonStyle())
                    }
                    
                    // 마지막 페이지인 경우 다음 버튼이 사라짐
                    if pageIndex == test.pages.count - 1 {
                        
                        NavigationLink {} label: {
                            Image(systemName: "arrow.right")
                        }.navigationBarHidden(true).buttonStyle(disabledNavButtonStyle()).disabled(true)
                    } else {
                        Button(action:{
                            self.pageIndex = pageIndex + 1
                            self.currentItem = test.pages[pageIndex]
                        }) {
                            Image(systemName: "arrow.right")
                        }.buttonStyle(navigationButtonStyle())
                    }
                    
                    Spacer()
                    NavigationLink(" \(pageIndex+1) / 20 ",  destination: {}).navigationBarHidden(true).buttonStyle(testNumButtonStyle())
                    
                    Spacer().frame(width:screenWidth * 0.08,height:screenWidth * 0.08)
                }
                Spacer().frame(width:screenWidth, height:screenHeight * 0.02)
                Text(test.pages[pageIndex].text).frame(minWidth: screenWidth * 0.9, minHeight:  screenWidth * 0.9)
                    .border(Color.black, width:1).background()
                
                Spacer().frame(width:screenWidth, height:screenHeight * 0.05)
                
                if(pageIndex == test.pages.count-1) {
                    if(test.pages[pageIndex].choices[0].type==Answer.answeredType[pageIndex]) {
                        Button(action:{
                            self.isLastPage.toggle()
                            selectingType(index: 0)
                        }) {
                            Text(test.pages[pageIndex].choices[0].text)
                        }.buttonStyle(chosenButtonStyle())
                    } else {
                        Button(action:{
                            self.isLastPage.toggle()
                            selectingType(index: 0)
                        }) {
                            Text(test.pages[pageIndex].choices[0].text)
                        }.buttonStyle(testButtonStyle())
                    }
                    
                    if(test.pages[pageIndex].choices[1].type==Answer.answeredType[pageIndex]) {
                        Button(action:{
                            self.isLastPage.toggle()
                            selectingType(index: 1)
                        }) {
                            Text(test.pages[pageIndex].choices[1].text)
                        }.buttonStyle(chosenButtonStyle())
                    } else {
                        Button(action:{
                            self.isLastPage.toggle()
                            selectingType(index: 1)
                        }) {
                            Text(test.pages[pageIndex].choices[1].text)
                        }.buttonStyle(testButtonStyle())
                    }
                    
                    if(test.pages[pageIndex].choices[2].type==Answer.answeredType[pageIndex]) {
                        Button(action:{
                            self.isLastPage.toggle()
                            selectingType(index: 2)
                        }) {
                            Text(test.pages[pageIndex].choices[2].text)
                        }.buttonStyle(chosenButtonStyle())
                    } else {
                        Button(action:{
                            self.isLastPage.toggle()
                            selectingType(index: 2)
                        }) {
                            Text(test.pages[pageIndex].choices[2].text)
                        }.buttonStyle(testButtonStyle())
                    }
                } else {
                    if(test.pages[pageIndex].choices[0].type==Answer.answeredType[pageIndex]) {
                        Button(action:{
                            selectingType(index: 0)
                        }) {
                            Text(test.pages[pageIndex].choices[0].text)
                        }.buttonStyle(chosenButtonStyle())

                    } else {
                        Button(action:{
                            selectingType(index: 0)
                        }) {
                            Text(test.pages[pageIndex].choices[0].text)
                        }.buttonStyle(testButtonStyle())
                    }
                    
                    if(test.pages[pageIndex].choices[1].type==Answer.answeredType[pageIndex]) {
                        Button(action:{
                            selectingType(index: 1)
                        }) {
                            Text(test.pages[pageIndex].choices[1].text)
                        }.buttonStyle(chosenButtonStyle())
                    } else {
                        Button(action:{
                            selectingType(index: 1)
                        }) {
                            Text(test.pages[pageIndex].choices[1].text)
                        }.buttonStyle(testButtonStyle())
                    }
                    
                    if(test.pages[pageIndex].choices[2].type==Answer.answeredType[pageIndex]) {
                        Button(action:{
                            selectingType(index: 2)
                        }) {
                            Text(test.pages[pageIndex].choices[2].text)
                        }.buttonStyle(chosenButtonStyle())
                        
                    } else {
                        Button(action:{
                            selectingType(index: 2)
                        }) {
                            Text(test.pages[pageIndex].choices[2].text)
                        }.buttonStyle(testButtonStyle())
                    }
                }
                Spacer()
                
                if (isLastPage) {
                    
                    Button(action:{
                        for answer in Answer.answeredType {
                            if answer == 0 {
                                showingAlert = true
                            }
                        }
                        print("Result: \(Answer.answeredType)")
                    }) {
                        Text("테스트 결과 보기")
                    }.buttonStyle(resultButtonStyle())
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("결과 전송 실패"), message: Text("아직 응답하지 않은 문항이 있습니다."), dismissButton: .default(Text("확인")))
                        }
                }
            }
        }
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TestPageView(test: test)
        }
        .previewInterfaceOrientation(.portrait)
    }
}
