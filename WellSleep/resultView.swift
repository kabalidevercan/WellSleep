//
//  resultView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 20.02.2024.
//

import SwiftUI

struct resultView: View {
    @State private var alertTitle:String
    @State private var alertMessage:String
    
    init(alertTitle: String = "", alertMessage: String = "") {
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.red.opacity(0.6),.blue.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
           // LinearGradientMoving()
            Text("\(alertMessage)")
        }
    }
}

#Preview {
    resultView()
}
