//
//  TradeView.swift
//  App267
//
//  Created by Вячеслав on 12/1/23.
//

import SwiftUI

struct TradeView: View {
    
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
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Balance")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                    
                    HStack {
                        
                        Text("$\(money)")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 23, weight: .medium))
                        
                        Spacer()
                        
                        Text("+\(3)%")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 12, weight: .regular))
                    }
                    
                    Text("+$ \(add_on)")
                        .foregroundColor(.green)
                        .font(.system(size: 14, weight: .regular))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                    
                    NavigationLink(destination: {
                        
                        ChartView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Trade")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    Text("Trading")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                    
                    if transes.isEmpty {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Text("No current trade")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("Start trading and current trades will appear here")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        
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
                        }
                    }
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    TradeView()
}
