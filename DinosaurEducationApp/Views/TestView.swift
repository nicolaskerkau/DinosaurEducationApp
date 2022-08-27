//
//  TestView.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/27/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswer:Int?
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack (alignment: .leading) {
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .bold()
                    .padding(.leading, 20)
                    
                // Question
                Text(model.currentQuestion?.content ?? "")
                    .padding(.horizontal, 20)
       
                // Answers
                ScrollView {
                    VStack (spacing: 20) {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            Button  {
                                selectedAnswer = index
                            } label: {
                                ZStack {
                                    RectangleCard(color: selectedAnswer == index ? Color.gray : Color.white)
                                        .frame(height: 48)
                                    Text(model.currentQuestion!.answers[index])
                                        .tint(selectedAnswer == index ? .white : .black)
                                }
                            }
                            .tint(.black)
                            .padding(.horizontal, 20)
                            .disabled(submitted)
                        }
                    }
                }
                .padding(.top, 50)
                // Button
                Button  {
                    submitted = true
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        Text("Submit")
                            .bold()
                            .tint(.white)
                    }
                }
                .padding(.horizontal, 20)

            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
