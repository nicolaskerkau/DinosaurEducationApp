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
                }
                // TODO: Add Explanation
                
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
    }
}

/*
struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
*/
