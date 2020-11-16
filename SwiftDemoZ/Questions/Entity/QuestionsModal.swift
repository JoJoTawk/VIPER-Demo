//
//  Modal.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

struct QuestionsModal: Codable {
    var questions: [Question]
}

struct Question: Codable {
    let query: String // The prompt/title/question we want to ask
    let answers: [Answer] // List of answers (always 4)
}

struct Answer: Codable {
    let title: String // The prompt/title/answer choice to the question
    let correct: Bool // Is this the correct answer or not
}
