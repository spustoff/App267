//
//  SettingsView.swift
//  App267
//
//  Created by Вячеслав on 12/1/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @AppStorage("money") var money: Int = 10000
    @AppStorage("transes") var transes: [String] = []
    @AppStorage("add_on") var add_on: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 19, weight: .semibold))
                        .frame(width: 55, height: 55)
                        .background(Circle().fill(.gray.opacity(0.1)))
                    
                    Text("You're (Trader)")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    Spacer()
                }
                .padding([.horizontal, .top])
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1Xh0dadxZwQ7ciyqLExEYNaETQjS0ydD-fsXJxYwl3-U/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Rate Us")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    transes.removeAll()
                    money = 10000
                    add_on = 0
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Reset all data")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
