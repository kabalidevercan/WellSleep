//
//  StepperView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 20.02.2024.
//

import SwiftUI

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

#Preview {
    StepperView()
}
