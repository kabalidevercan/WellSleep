//
//  ContentView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 18.02.2024.
//

import SwiftUI
import CoreML




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
    
    
    func calculateBedtime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(coffee: Int64(Double(coffeeAmount)), estimatedSleep: sleepAmount, wake: Int64(Double(hour + minute)))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened )
            //more code here
        }catch{
            
            alertTitle = "Error!!!"
            alertMessage = "Sorry,there was a problem calculating your bedtime"
            
            //something went wrong!
        }
        
        
        showingSheet = true
    }
    
    
    
    
    
    
    var body: some View {
        
        
            ZStack{
               LinearGradientMoving()
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
                                              .foregroundStyle(.gray)
                                              .fontWeight(.bold)
                                          
                                      }header: {
                                      }
                                      .padding()
                                      
                                      Section{
                                          Text("Desired Amount of Sleep?")
                                              .font(.headline)
                                              
                                          Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in:4...12,step: 0.25)
                                              .foregroundStyle(.gray)
                                              .fontWeight(.bold)
                                      }header: {
                                      }
                                      .padding()
                                      
                                      Section{
                                          Text("Daile Coffee Intake")
                                              .font(.headline)
                                         StepperView()
                                              .foregroundStyle(.gray)
                                              .fontWeight(.bold)
                                      }header: {
                                        
                                      }
                                      .padding()
                                  }
                                  .sheet(isPresented: $showingSheet, content: {
                                      resultView(alertTitle: alertTitle,alertMessage: alertMessage)
                                  })
                                  .padding()
                                  .scrollContentBackground(.hidden)
                                  .opacity(0.8)
                    Spacer()
                                  Button{
                                      calculateBedtime()
                                      
                                  }label: {
                                     Image(systemName: "moon.circle")
                                          .imageScale(.large)
                                  }
                                  .padding()
                                  .frame(width: 150,height: 50)
                                  .background(.thickMaterial.opacity(0.9))
                                  .cornerRadius(4)
                        Spacer()
                                  
                }
                .foregroundColor(.pink.opacity(0.7))
                .padding()
                .ignoresSafeArea()
                //
        }
    }
}

#Preview {
    ContentView()
}
