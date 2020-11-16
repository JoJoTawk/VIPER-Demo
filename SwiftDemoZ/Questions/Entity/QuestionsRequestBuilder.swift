//
//  QuestionsRequestBuilder.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 11/16/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

enum QuestionProvider {
    case listQuestions
}

extension QuestionProvider: Request {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return API.host + API.mainURL
    }
    
    var host: String {
        return API.host
    }
}
