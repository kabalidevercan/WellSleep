//
//  LinearGradientMovingView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 20.02.2024.
//

import SwiftUI
struct LinearGradientMoving:View{
    let colors:[Color] = [.red.opacity(0.6),.blue.opacity(0.5),.blue.opacity(0.5)]
    let availablePoints = [UnitPoint.top,.topLeading,.topTrailing,.bottom,.bottomLeading,.bottomTrailing,.center]
    
    @State private var currentPoints = [UnitPoint.top,.bottom]
    var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
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


#Preview {
    LinearGradientMoving()
}
