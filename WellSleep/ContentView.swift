//
//  ContentView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
            ZStack{
                
                Form{
                    Text("When do you want to wake up?")
                    Text("08.00")
                    Spacer()
                    Text("Desired amount of sleep?")
                    Text("8 Hours------ +-")
                    Spacer()
                    Text("Daily Coffe Invoke?")
                    Text("1 Cup------- +-")
                    Spacer()
                    
                }
                .padding()
                .background(Color.green)
                .scrollContentBackground(.hidden)
                
                
            }
       
        
            
           
        
    }
    
  
    
}

#Preview {
    ContentView()
}
