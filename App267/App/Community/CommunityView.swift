//
//  CommunityView.swift
//  App267
//
//  Created by Вячеслав on 12/1/23.
//

import SwiftUI

struct CommunityView: View {
    
    @AppStorage("friends") var friends: [String] = []
    
    @State var isAdd: Bool = false
    @State var text_field: String = ""
    
    @State var selectedFriend: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 18, weight: .medium))
                    })
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    Image(systemName: "trophy.fill")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 18, weight: .regular))
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(.black.opacity(0.15)))
                    
                    Text("Rate will appear here\nAdd friends and start trading")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                if !friends.isEmpty {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(friends, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    selectedFriend = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Circle()
                                            .stroke(selectedFriend == index ? Color("primary") : .gray.opacity(0.35))
                                            .frame(width: 21, height: 21)
                                            .overlay (
                                            
                                                Circle()
                                                    .fill(Color("primary"))
                                                    .frame(width: 17, height: 17)
                                                    .overlay (
                                                    
                                                        Image(systemName: "checkmark")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 8, weight: .medium))
                                                    )
                                                    .opacity(selectedFriend == index ? 1 : 0)
                                            )
                                        
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .medium))
                                            .frame(width: 45, height: 45)
                                            .background(Circle().fill(.gray.opacity(0.2)))
                                        
                                        VStack(alignment: .leading, spacing: 0, content: {
                                            
                                            Text(index)
                                                .foregroundColor(selectedFriend != index ? .white : Color("primary"))
                                                .font(.system(size: 15, weight: .medium))
                                            
                                            if selectedFriend == index {
                                                
                                                Text("Trading now")
                                                    .foregroundColor(Color("primary"))
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                        })
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                    .padding(.horizontal)
                                })
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .overlay (
            
                ZStack {
                    
                    Color.black.opacity(isAdd ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture() {
                            
                            withAnimation(.spring()) {
                                
                                isAdd = false
                            }
                        }
                    
                    VStack {
                        
                        ZStack {
                            
                            Text("New Friend")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            HStack {
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        isAdd = false
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .bold))
                                        .frame(width: 25, height: 25)
                                        .background(Circle().fill(.gray.opacity(0.15)))
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    friends.append(text_field)
                                    
                                    text_field = ""
                                    
                                    UIApplication.shared.endEditing()
                                    
                                    withAnimation(.spring()) {
                                        
                                        isAdd = false
                                    }
                                    
                                }, label: {
                                    
                                    Text("Add")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 15, weight: .medium))
                                })
                                .opacity(text_field.isEmpty ? 0.5 : 1)
                                .disabled(text_field.isEmpty ? true : false)
                            }
                        }
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Type name...")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(text_field.isEmpty ? 1 : 0)
                                
                                TextField("", text: $text_field)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                        }
                        .padding(.top)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("bg").ignoresSafeArea())
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: isAdd ? 0 : UIScreen.main.bounds.height)
                }
            )
        }
    }
}

#Preview {
    CommunityView()
}

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
