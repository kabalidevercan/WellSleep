//
//  ContentView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
            Section{
                List{
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
                .background(.linearGradient(colors: [.red.opacity(0.8),.black,.blue], startPoint: .center, endPoint: .bottom),in:RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                .navigationTitle("Se")
                
            }header: {
                Text("WellSleep")
                    .font(.headline)
            }
            .padding()
       
            
           
        
    }
}

#Preview {
    ContentView()
}
