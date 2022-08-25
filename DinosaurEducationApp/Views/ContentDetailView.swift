//
//  ContentDetailView.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/24/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
            VStack {
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                        .frame(height: 200)
                }
                // TODO: Add Explanation
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("More...")
                            .font(.title3)
                            .padding(.bottom, 5)
                        Text(lesson?.explanation ?? "")
                            .font(.system(size: 14))
                            .foregroundColor(Color(.sRGB, red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                    }
                }
                
                //MARK: Next Lesson Button
                if model.hasNextLesson() {
                    Button {
                        // Adavnce the lesson
                        model.advanceNextLesson()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 48)
                                .foregroundColor(Color.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(lesson?.title ?? "")
    }
}

/*
struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
*/
