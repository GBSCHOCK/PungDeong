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
    var answer: Answer
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                if(pageIndex==0) {
                    Spacer()
                } else {
                    NavigationLink("이전",  destination: TestPageView(test: test, pageIndex: pageIndex-1, answer: answer)).navigationBarBackButtonHidden(true)
                }
                if(pageIndex == test.pages.count - 1) {
                    Spacer()
                } else  {
                    NavigationLink("다음",  destination: TestPageView(test: test, pageIndex: pageIndex+1, answer: answer)).navigationBarBackButtonHidden(true)
                }
                Spacer()
                NavigationLink("\(pageIndex+1)/20",  destination: {}).navigationBarBackButtonHidden(true)
                Spacer()
            }
            ///
            /// 이미지가 들어갈 공간입니다.
            Spacer()
            ///
            Text(test.pages[pageIndex].text)
            if(pageIndex == test.pages.count-1) {
                NavigationLink(test.pages[pageIndex].choices[0].text, destination:{}).navigationBarBackButtonHidden(true).onAppear {
                    if answer.answeredType[pageIndex] == 0 {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let typeScore = answer.selects[selectedType, default: 0]
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                    } else {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let beforeType = answer.answeredType[pageIndex]
                        
                        let beforeTypeScore = answer.selects[beforeType, default: 0]
                        let typeScore = answer.selects[selectedType, default: 0]
                        
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                        answer.selects.updateValue(beforeType, forKey: beforeTypeScore - 1)
                    }
                }
                
                NavigationLink(test.pages[pageIndex].choices[1].text, destination:{}).navigationBarBackButtonHidden(true).onAppear {
                    if answer.answeredType[pageIndex] == 0 {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let typeScore = answer.selects[selectedType, default: 0]
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                    } else {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let beforeType = answer.answeredType[pageIndex]
                        
                        let beforeTypeScore = answer.selects[beforeType, default: 0]
                        let typeScore = answer.selects[selectedType, default: 0]
                        
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                        answer.selects.updateValue(beforeType, forKey: beforeTypeScore - 1)
                    }
                }
                
                NavigationLink(test.pages[pageIndex].choices[2].text, destination:{}).navigationBarBackButtonHidden(true).onAppear {
                    if answer.answeredType[pageIndex] == 0 {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let typeScore = answer.selects[selectedType, default: 0]
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                    } else {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let beforeType = answer.answeredType[pageIndex]
                        
                        let beforeTypeScore = answer.selects[beforeType, default: 0]
                        let typeScore = answer.selects[selectedType, default: 0]
                        
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                        answer.selects.updateValue(beforeType, forKey: beforeTypeScore - 1)
                    }
                }
                
            } else {
                NavigationLink(test.pages[pageIndex].choices[0].text, destination: TestPageView(test: test, pageIndex: pageIndex+1, answer: answer)).navigationBarBackButtonHidden(true).onAppear {
                    if answer.answeredType[pageIndex] == 0 {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let typeScore = answer.selects[selectedType, default: 0]
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                    } else {
                        let selectedType = test.pages[pageIndex].choices[0].type
                        let beforeType = answer.answeredType[pageIndex]
                        
                        let beforeTypeScore = answer.selects[beforeType, default: 0]
                        let typeScore = answer.selects[selectedType, default: 0]
                        
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                        answer.selects.updateValue(beforeType, forKey: beforeTypeScore - 1)
                    }
                }
                NavigationLink(test.pages[pageIndex].choices[1].text, destination: TestPageView(test: test, pageIndex: pageIndex+1, answer: answer)).navigationBarBackButtonHidden(true).onAppear {
                    if answer.answeredType[pageIndex] == 0 {
                        let selectedType = test.pages[pageIndex].choices[1].type
                        let typeScore = answer.selects[selectedType, default: 0]
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                    } else {
                        let selectedType = test.pages[pageIndex].choices[1].type
                        let beforeType = answer.answeredType[pageIndex]
                        
                        let beforeTypeScore = answer.selects[beforeType, default: 0]
                        let typeScore = answer.selects[selectedType, default: 0]
                        
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                        answer.selects.updateValue(beforeType, forKey: beforeTypeScore - 1)
                    }
                }
                NavigationLink(test.pages[pageIndex].choices[2].text, destination: TestPageView(test: test, pageIndex: pageIndex+1, answer: answer)).navigationBarBackButtonHidden(true).onAppear {
                    if answer.answeredType[pageIndex] == 0 {
                        let selectedType = test.pages[pageIndex].choices[2].type
                        let typeScore = answer.selects[selectedType, default: 0]
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                    } else {
                        let selectedType = test.pages[pageIndex].choices[2].type
                        let beforeType = answer.answeredType[pageIndex]
                        
                        let beforeTypeScore = answer.selects[beforeType, default: 0]
                        let typeScore = answer.selects[selectedType, default: 0]
                        
                        answer.answeredType[pageIndex] = selectedType
                        answer.selects.updateValue(selectedType, forKey: typeScore + 1)
                        answer.selects.updateValue(beforeType, forKey: beforeTypeScore - 1)
                    }
                }
            }
            if pageIndex == test.pages.count - 1 {
                NavigationLink("테스트 결과보기", destination: {}).navigationBarBackButtonHidden(true)
            }
            Text("\(answer.answeredType[0])")
        }
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TestPageView(test: test, pageIndex: 0, answer: answer)
        }
    }
}
