//
//  FirebaseDB.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/10.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FirebaseDB {
    
    private let db = Firestore.firestore()
    
    func getUserInfo(email: String, userInfo: UserInfo) {
        userInfo.test = fetchTest(email: email)
        userInfo.content1 = fetchContent1(email: email)
        userInfo.content2 = fetchContent2(email: email)
    }
    
    func fetchTest(email: String) -> Test? {
        var returnData: Test? = nil
        let docRef = db.collection("Test").document(email.description)

        docRef.getDocument(as: Test.self) { result in
            switch result {
            case .success(let test):
                
                returnData = test
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
        
        return returnData
    }
    
    func fetchContent1(email: String) -> Content1? {
        var returnData: Content1? = nil
        let docRef = db.collection("Content1").document(email.description)

        docRef.getDocument(as: Content1.self) { result in
            switch result {
            case .success(let content1):
                
                returnData = content1
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
        
        return returnData
    }
    
    func fetchContent2(email: String) -> Content2? {
        var returnData: Content2? = nil
        let docRef = db.collection("Content2").document(email.description)

        docRef.getDocument(as: Content2.self) { result in
            switch result {
            case .success(let content2):
                
                returnData = content2
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
        
        return returnData
    }
}
