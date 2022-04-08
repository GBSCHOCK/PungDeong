//
//  AppleLogIn.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI
import AuthenticationServices

struct AppleLogIn: View {
    
    @State private var appleSignInDelegate: SignInWithAppleDelegate! = nil
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        SignInWithAppleButton()
            .frame(width: screenWidth * 0.8, height: 40)
            .cornerRadius(5)
            .onTapGesture(perform: showAppleLogin)
    }
    
    private func showAppleLogin() {
        appleSignInDelegate = SignInWithAppleDelegate {
          print("로그인 성공?: \($0)")
        }
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
     
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = appleSignInDelegate
        controller.presentationContextProvider = appleSignInDelegate
        controller.performRequests()
      }
}

final class SignInWithAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}

class SignInWithAppleDelegate: NSObject {
    private let signInSucceeded: (Bool) -> Void
    
    init (onSignedIn: @escaping (Bool) -> Void) {
        signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegate: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            case let appleIdCredential as ASAuthorizationAppleIDCredential:
                if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
                    print("111111 ================= 첫 로그인")
                    displayLog(credential: appleIdCredential)
                } else {
                    print("222222 ================== 로그인 했었음")
                    displayLog(credential: appleIdCredential)
                }
                signInSucceeded(true)
            
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    }
    
    private func displayLog(credential: ASAuthorizationAppleIDCredential) {
        print("identityToken: \(String(describing: credential.identityToken))\nauthorizationCode: \(credential.authorizationCode!)\nuser: \(credential.user)\nemail: \(String(describing: credential.email))\ncredential: \(credential)")
    }
}

extension SignInWithAppleDelegate: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.last!
    }
}
