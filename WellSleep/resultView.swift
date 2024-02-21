//
//  resultView.swift
//  WellSleep
//
//  Created by Ercan Kabali on 20.02.2024.
//

import SwiftUI

struct resultView: View {
    @State  var alertTitle:String
    @State  var alertMessage:String
    @Environment(\.dismiss) var dismiss
    @State private var  dragSize = CGSize.zero
    
   
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.red.opacity(0.6),.blue.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
           // LinearGradientMoving()
            VStack(alignment:.center,spacing: 30){
                Text("Your ideal bedtime is ")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    ZStack(alignment:.center){
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 200,height: 200)
                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        Text("\(alertMessage)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                
                HStack(spacing:20){
                    Text("Sleep Tight")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                }
                VStack(alignment:.leading){
                    Image("zzz")
                        .resizable()
                        .frame(width: 32,height:32)
                    Text("hidden")
                        .hidden()
                    
                }
                VStack(spacing:20){
                    Text("Hidden")
                        .hidden()
                    Button{
                       dismiss()
                    }label: {
                        Text("Continue")
                            .frame(width: 200,height: 50,alignment: .center)
                            .background(.pink.opacity(0.7))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                            
                    }
                }
                
              /// VSTACK SON
            }
        
            //ZSTACK SON
        }
    }
}

#Preview {
    resultView(alertTitle: "Error", alertMessage: "Nil Time")
}







