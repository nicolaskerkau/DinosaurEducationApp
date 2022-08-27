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
    @State var finalAnswer:Int?
    @State var submitted: Bool?
    @State var numCorrect = 0
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack {
                VStack (alignment: .leading) {
                    // Question number
                    Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                        .bold()
                }
                VStack (alignment: .center) {
                    // Question
                    Text(model.currentQuestion?.content ?? "")
                        .font(.body)
                        .padding(.horizontal, 40)
                }.padding(.top, 30)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            Button  {
                                selectedAnswer = index
                            } label: {
                                ZStack {
                                    RectangleCard(color: selectedAnswer == index ? Color.gray : Color.white)
                                        .frame(height: 48)
                                    
                                    if finalAnswer != nil {
                                        // The answer the user selected was the right one
                                        if index == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                        }
                                        // The answer the user selected was the wrong one
                                        else if finalAnswer == index && index != model.currentQuestion!.correctIndex {
                                            RectangleCard(color: Color.red)
                                                .frame(height: 48)
                                        }
                                        
                                    }
                                    
                                    Text(model.currentQuestion!.answers[index])
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                            }
                            .tint(.black)
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                            .disabled(submitted == true)
                        }
                    }
                }
                .padding(.top, 50)
                // Submit / Next lesson button
                Button  {
                    
                    if submitted == true {
                        submitted = nil
                        finalAnswer = nil
                        selectedAnswer = nil
                        
                        model.advanceNextQuestion()
                    }
                    else {
                        submitted = true
                        finalAnswer = selectedAnswer
                        if finalAnswer == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                    
                  
                    
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        if submitted == nil {
                            Text("Submit")
                                .bold()
                                .tint(.white)
                        }
                        else if submitted == true && model.hasNextQuestion() {
                            Text("Next Question")
                                .bold()
                                .tint(.white)
                        }
                        else if !model.hasNextQuestion() {
                            Text("Results")
                                .bold()
                                .tint(.white)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .disabled(selectedAnswer == nil)

            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else if model.currentQuestion == nil && numCorrect > 0 {
            TestResultsView(numberOfQuestion: 10, numberCorrect: numCorrect)
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
