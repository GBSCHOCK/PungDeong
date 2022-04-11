//
//  FloatingMenuView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/11.
//

import SwiftUI

protocol ShareButtonDelegate {
    func kakaoButtonTapped()
    func savePhotoButtonTapped()
}


struct ShareMenu: View {
    
    var delegate: ShareButtonDelegate
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            FloatingMenuView(delegate: delegate)
                .padding()
        }
    }
}

struct FloatingMenuView: View {
    
    //MARK: - Properties
    
    var delegate: ShareButtonDelegate
    
    @State var isShow = false
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    
    

    
    
    var body: some View {
        VStack {
            Spacer()
            
            if showMenuItem1 {
                Button {
                    print("DEBUG: Camera Button Tapped")
                    
                    delegate.kakaoButtonTapped()
                } label: {
                    MenuItem(icon: "camera.fill")
                }
                .transition(.move(edge: .trailing))
            }
            
            if showMenuItem2 {
                Button {
                    print("DEBUG: Photo Button Tapped")
                    delegate.savePhotoButtonTapped()
                    
                } label: {
                    MenuItem(icon: "photo.on.rectangle")
                }
                .transition(.move(edge: .trailing))
            }
            
            if showMenuItem3 {
                Button {
                    print("DEBUG: Share Button Tapped")
                    
                } label: {
                    MenuItem(icon: "square.and.arrow.up.fill")
                }
                .transition(.move(edge: .trailing))
            }
            
            
            Button {
                print("DEBUG: FloatButton Tapped")
                self.showMenu()
                self.isShow.toggle()
            } label: {
                if isShow {
                    FloatButton(icon: "xmark")
                        
                    
                } else {
                    FloatButton(icon: "square.and.arrow.up")
                }
                
            }
        }
    }
    
    
    //MARK: - Helpers
    func showMenu() {
        withAnimation {
            showMenuItem3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        })
    }
}

struct MenuItem: View {
    
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("main"))
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        
    }
}



struct FloatButton: View {
    
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("main"))
                .frame(width: 70, height: 70)
            
            
            Image(systemName: icon )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34, height: 34)
                .foregroundColor(.white)
            
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
    
    }
}

//
//struct FloatingMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShareMenu(delegate: ShareB)
//    }
//}
