//
//  QuestionData.swift
//  PersonalityQuiz_ChapterProject
//
//  Created by Invitado on 6/4/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        
        switch self {
        
        case .dog:
            return "You are outgoing...Friendly, lovable, and enjoy activities with friends"
        
        case .cat:
            return "You are mild-tempered, enjoy doing things on your own terms"
        
        case .rabbit:
            return "You are healthy and full of energy"
        
        case .turtle:
            return "Very wise, centered person, ahead of your years. Slow and steady is your motto"
        }
    }
}

var questions: [Question] =  [
    
    Question(text: "Which food do you like the most?",
             type: .single,
             answers:  [
                
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
                        ]),
    
    Question(text: "Which activities do you enjoy",
             type: .multiple,
             answers: [
                
                Answer(text: "Swimming", type: .turtle),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Eating", type: .dog)
        
                      ]),
    
    Question(text: "How much do you enjoy car rides?",
             type: .ranged,
             answers: [
                
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .dog)
                     ])
]




