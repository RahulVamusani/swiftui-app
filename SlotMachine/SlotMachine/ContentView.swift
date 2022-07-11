//
//  ContentView.swift
//  SlotMachine
//
//  Created by Rahul Vamusani on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    
    private var syms = [["apple", "star", "cherry"],["apple", "star", "cherry"],["apple", "star", "cherry"]]
    @State private var nums:[[Int]] = [[0,1,2],[0,1,2],[0,1,2]]
    @State private var points = 1000
    @State private var degval = 0.0
    private var betPoints = 5
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color(red:200/255, green: 143/255, blue: 32/255))
                .ignoresSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(
                    red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                // Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Slot Machine")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                // points Counter
                Text("Credits: " + String(self.points))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                // Images
                Spacer()
                
                VStack{
                    
                    
                    HStack{
                        Spacer()
                        Image(syms[0][nums[0][0]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        Image(syms[0][nums[0][1]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        Image(syms[0][nums[0][2]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Image(syms[1][nums[1][0]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        Image(syms[1][nums[1][1]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        Image(syms[1][nums[1][2]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        
                        
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Image(syms[2][nums[2][0]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        Image(syms[2][nums[2][1]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        Image(syms[2][nums[2][2]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .rotation3DEffect(.degrees(degval), axis: (x: 0, y: 1, z: 0))
                            .animation(.default, value: degval)
                            .padding(20)
                        
                        
                        Spacer()
                    }
                }
                
                // Button
                Spacer()
                Button(
                    
                    action: {
                        
                        
                        self.degval += 360.0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            for k in 0...2{
                                for j in 0...2 {
                                    self.nums[k][j] = Int.random(in: 0...2)
                                }
                            }
                            print(self.points)
                            for i in 0...2 {
                                
                                if(nums[i][0] == nums[i][1] && nums[i][1] == nums[i][2]) {
                                    
                                    self.points += 50
                                    
                                }
                                
                                if(nums[0][i] == nums[1][i] && nums[1][i] == nums[2][i]) {
                                    
                                    self.points += 50
                                }
                                
                                
                            }
                            
                            if(nums[0][0] == nums[1][1] && nums[1][1] == nums[2][2]) {
                                self.points += 50
                            }
                            
                            if(nums[0][2] == nums[1][1] && nums[1][1] == nums[2][0]) {
                                self.points += 50
                            }
                        }
                        
                        
                        
                        
                        
                    }
                ) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                Spacer()
                
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
