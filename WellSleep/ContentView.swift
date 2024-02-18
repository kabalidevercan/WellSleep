//
//  ContentView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 18.02.2024.
//

import SwiftUI
import CoreML

struct StepperView: View {
    @State private var value = 1
    
    @State private var cup = "Cup"
    
    func incrementStep() {
        value += 1
        if value <= 1 {
            cup = "Cup"
        }else {
            cup = "Cups"
        }
    }


    func decrementStep() {
        value -= 1
        
        if value < 1 {
            value = 1
        }
        if value <= 1 {
            cup = "Cup"
        }else {
            cup = "Cups"
        }
    }


    var body: some View {
        Stepper {
            Text("\(value) \(cup)")
        } onIncrement: {
           
            incrementStep()
        } onDecrement: {
            
            decrementStep()
        }
        .padding(5)
        
    }
}


struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingSheet = false
    static var defaultWakeTime:Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    
    var body: some View {
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.8),.red], startPoint: .center, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    List{
                        Section{
                            DatePicker("Select Time",selection: $wakeUp,displayedComponents: .hourAndMinute)
                            
                        }header: {
                            Text("When do you want to wake up?")
                                .font(.headline)
                                .foregroundStyle(.black)
                        }
                        .padding()
                        
                        Section{
                            Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in:4...12,step: 0.25)
                        }header: {
                            Text("Desired Amount of Sleep?")
                                .font(.headline)
                                .foregroundStyle(.black)
                        }
                        .padding()
                        
                        Section{
                           StepperView()
                        }header: {
                            Text("Daily Coffee Intake")
                                .font(.headline)
                                .foregroundStyle(.black)
                        }
                        .padding()
                        
                        
                        
                        
                    }
                    .padding()
                    .scrollContentBackground(.hidden)
                    .opacity(0.8)
                    Button{
                        
                    }label: {
                        Text("Calculate")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding()
                    }
                    
                    
                    
                    
                    
                }
                .ignoresSafeArea()
                
            
            
        }
        
            
           
        
    }
    
  
    
}

#Preview {
    ContentView()
}
