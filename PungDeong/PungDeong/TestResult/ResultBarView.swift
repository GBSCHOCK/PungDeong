//
//  ResultBarView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/08.
//

import SwiftUI



struct ResultBarView: View {
    
    //데이터 건네져 옴
    @State private var resultData: [ResultData] = [
        ResultData(id: 1, score: 3),
        ResultData(id: 2, score: 8),
        ResultData(id: 3, score: 6),
        ResultData(id: 4, score: 2),
        ResultData(id: 5, score: 4)
    ]
    
    
    var body: some View {
     
        VStack {
            ForEach(resultData) { result in
                
                HStack {
                    Spacer()
                    
                    Text("\(result.description ?? "")")
                        .fontWeight(.semibold)
                        .frame(alignment: .trailing)
                        .padding(.horizontal)
                    
                    ZStack {
                        ProgressView(value: result.score, total: 10)
                            .frame(width: 150,height: 20)
                            .padding(.trailing, 30)
                            .progressViewStyle(ResultProgressStyle())
                            .tint(result.score > 5 ? Color.pink : Color("main"))
                        
                    }
                }
            }
        }
    }
}

struct ResultBarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultBarView()
    }
}
