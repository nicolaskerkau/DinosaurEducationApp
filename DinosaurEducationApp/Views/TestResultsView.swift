//
//  TestResultsView.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/27/22.
//

import SwiftUI

struct TestResultsView: View {
    
    @EnvironmentObject var model: ContentModel
    var numberOfQuestion:Int
    var numberCorrect:Int
    
    var body: some View {
        
        let percentage = (Double(numberCorrect) / Double(numberOfQuestion)) * 100
       
        VStack {
            Text("\(Int(percentage))%")
                .bold()
                .font(.system(size: 100))
                .padding()
            Text("You answered \(numberCorrect) of \(numberOfQuestion) correctly.")
                .font(.title3)
                .fontWeight(.regular)
                .padding()
            Button {
                model.currentTestSelected = nil
            } label: {
                ZStack {
                    RectangleCard(color: Color.green)
                        .frame(height: 48)
                    Text("Finish")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
            }

        }
    }
}

