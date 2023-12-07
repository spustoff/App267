//
//  ChartView.swift
//  App267
//
//  Created by Вячеслав on 12/1/23.
//

import SwiftUI

struct ChartView: View {
    
    @Environment(\.presentationMode) var router
    
    @State var current_timeframe: Int = 1
    
    @AppStorage("money") var money: Int = 10000
    @AppStorage("transes") var transes: [String] = []
    @AppStorage("add_on") var add_on: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("EUR/USD")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                HStack(alignment: .bottom) {
                    
                    Text("\(Int.random(in: 1...255435))")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Text("+\(Int.random(in: 1...25))%")
                        .foregroundColor(.green)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach([1, 5, 15, 30, 50, 90], id: \.self) { index in
                        
                            Button(action: {
                                
                                current_timeframe = index
                                
                            }, label: {
                                
                                Text("\(index) m")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .padding(8)
                                    .padding(.horizontal, 10)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                    .overlay (
                                    
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("primary"))
                                            .opacity(current_timeframe == index ? 1 : 0)
                                    )
                            })
                        }
                    }
                    .padding(1)
                    .padding(.horizontal)
                }
                
                Image("graph")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                        money += 150
                        transes.append("EUR/USD")
                        add_on += 150
                        
                    }, label: {
                        
                        Text("Trade")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.green))
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ChartView()
}
