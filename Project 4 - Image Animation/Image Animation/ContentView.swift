//
//  ContentView.swift
//  Focus
//
//  Created by Dantavious Williams on 2/23/20.
//  Copyright © 2020 Dantavious Williams. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var show = false
    
    var body: some View {
        
        
        ZStack {
            Color.white
            .edgesIgnoringSafeArea(.all)

            VStack {
                
                Image("image")
                    .foregroundColor(.red)
                    .frame(width: show ? 414 : 300, height: show ? 600 : 300)
                    .clipped()
                    .cornerRadius(30)
                    .blur(radius: show ? 0 : 30)
                    .shadow(radius: 30)
                    .animation(.spring())
                    
                    
                    
                Text("This is my app to learn new things Swift!")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 15.0)
                    .animation(.easeIn(duration: 0.4))
                    
                        
                    
                Button(action: {
                    withAnimation {
                        self.show.toggle()
                    }
                }) {
                    HStack {
                        Text("Click Me")
                            //.fontWeight(.regular)
                            .font(.custom("Poppins-Bold", size: 14))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 18.0)
                            .padding(.vertical, -10.0)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.0, green: 0.4039, blue: 0.9686, opacity: 1.0))
                    .cornerRadius(40)
                }
                        
            }
            
            Text("N4N0.")
            .font(.custom("Poppins-Bold", size: 42))
            //.fontWeight(.black)
            .multilineTextAlignment(.center)
            .padding(.top, show ? -335 : 180)
            .frame(width: 200.0)
            .animation(.easeOut(duration: 0.3))
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
