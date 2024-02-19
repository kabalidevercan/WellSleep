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
        cup = value <= 1 ? "Cup" : "Cups"
    }


    func decrementStep() {
        value -= 1
        if value < 1 {
            value = 1
        }
        cup = value <= 1 ? "Cup" : "Cups"
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


/*
 struct LinearGradientExample: View {
     
     let colors: [Color] = [.purple, .blue, .cyan, .teal]
     let availablePoints = [UnitPoint.top, .topLeading, .topTrailing, .bottom, .bottomLeading, .bottomTrailing, .center, .leading, .trailing]
     
     @State private var currentPoints = [UnitPoint.top, .bottom]
     var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
     
     var body: some View {
         LinearGradient(colors: colors, startPoint: currentPoints[0], endPoint: currentPoints[1])
             .animation(.easeInOut(duration: 2), value: currentPoints)
             .onReceive(timer, perform: { _ in
                 currentPoints = [availablePoints.randomElement()!, availablePoints.randomElement()!]
             })
             .ignoresSafeArea()
     }
 }
 
 */

struct LinearGradientMoving:View{
    let colors:[Color] = [.red.opacity(0.6),.black,.blue.opacity(0.5)]
    let availablePoints = [UnitPoint.top,.topLeading,.topTrailing,.bottom,.bottomLeading,.bottomTrailing,.center]
    
    @State private var currentPoints = [UnitPoint.topTrailing,.bottom]
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View{
        LinearGradient(stops: [.init(color: colors[0], location: 0.1),.init(color: colors[1], location: 0.9),.init(color: colors[2], location: 0.1)], startPoint: currentPoints[0], endPoint: currentPoints[1])
        //LinearGradient(colors: colors, startPoint: currentPoints[0], endPoint: currentPoints[1])
            .animation(.easeIn(duration: 3), value: currentPoints)
            .onReceive(timer, perform: { _ in
                currentPoints = [availablePoints.randomElement()!,availablePoints.randomElement()!]
            })
            .ignoresSafeArea()
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
               LinearGradientMoving()
                //LinearGradient(stops: [.init(color: .red, location: 0.5),.init(color: .black, location:  0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ///
                Image("moon")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .edgesIgnoringSafeArea(.bottom)
                
                VStack(alignment: .center,spacing: 0){
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("WellSleep")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                                  List{
                                      Section{
                                              Text("When do you want to wake up?")
                                              .font(.headline)
                                          
                                          DatePicker("Select Time",selection: $wakeUp,displayedComponents: .hourAndMinute)
                                          
                                      }header: {
                                      }
                                      .padding()
                                      
                                      Section{
                                          Text("Desired Amount of Sleep?")
                                              .font(.headline)
                                              
                                          Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in:4...12,step: 0.25)
                                      }header: {
                                      }
                                      .padding()
                                      
                                      Section{
                                          Text("Daile Coffee Intake")
                                              .font(.headline)
                                         StepperView()
                                      }header: {
                                        
                                      }
                                      .padding()
                                  }
                                  .padding()
                                  .scrollContentBackground(.hidden)
                                  .opacity(0.8)
                    Spacer()
                                  Button{
                                      
                                  }label: {
                                      Text("Calculate")
                                          .font(.headline)
                                          .foregroundStyle(.black)
                                          .padding()
                                  }
                        
                                  
                }
                .padding()
                .ignoresSafeArea()
                
                //
        }
        
            
           
        
    }
    
  
    
}

#Preview {
    ContentView()
}
