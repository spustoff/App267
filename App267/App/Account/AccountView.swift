//
//  AccountView.swift
//  App267
//
//  Created by Вячеслав on 12/1/23.
//

import SwiftUI

struct AccountView: View {

    @AppStorage("money") var money: Int = 10000
    
    @AppStorage("transes") var transes: [String] = []
    
    @State var isLimit: Bool = false
    
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
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        
                        Text("Account")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            isLimit = true
                            
                        }, label: {
                            
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                        })
                    }
                    
                    Text("$\(money)")
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .semibold))
                    
                    HStack {
                        
                        Text("Limit: $500")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                        
                        Spacer()
                        
                        Text("Day")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.3)))
                    
                    Button(action: {
                        
                        isLimit = true
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Add Limit")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                }
                .padding()
                .background(Image("design").resizable().cornerRadius(15))
                .padding(.horizontal)
                
                if transes.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("No transactions")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Text("The complete history of the\ntransaction will be here")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(transes, id: \.self) { index in
                            
                                HStack {
                                    
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .semibold))
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text("DONE")
                                        .foregroundColor(.green)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .alert(isPresented: $isLimit) {
            Alert(
                title: Text("Information"),
                message: Text("You cannot add a limit until you have made 20 trades on the trade"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    AccountView()
}
