//
//  QuestionsDataSource.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

typealias QuestionsCompletion = (([Question]) -> Void)

protocol QuestionsDataSourceProtocol: class {
    
    func getAllQuestions(completion: @escaping QuestionsCompletion)
}

class QuestionsDataSource: QuestionsDataSourceProtocol {
    
    func getAllQuestions(completion: @escaping QuestionsCompletion) {
        let service = NetworkService(session: URLSession(configuration: .ephemeral),
                                     modifiers: QuestionProvider.listQuestions.build())
        
        service.apiCall { (result) in
            
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let data):
                do {
                    let modal = try JSONDecoder().decode(QuestionsModal.self, from: data)
                    let questions = modal.questions
                    completion(questions)
                }catch(let error) {
                    print(error)
                }
            }   
        }
    }
}
