//
//  QuestionsInteractor.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

protocol QuestionsInteractorOutputProtocol {
    func didRetriveQuestions(modal: [Question])
}

protocol QuestionsInteractorInputProtocol {
    var presenterOutput: QuestionsInteractorOutputProtocol? { get set }
    var dataSource: QuestionsDataSourceProtocol? { get set }
    
    func getQuestions()
}


class QuestionsInteractor: QuestionsInteractorInputProtocol {
    var presenterOutput: QuestionsInteractorOutputProtocol?
    var dataSource: QuestionsDataSourceProtocol?
    
    func getQuestions() {
//        data
        dataSource?.getAllQuestions( completion: { modal in
            self.presenterOutput?.didRetriveQuestions(modal: modal)
        })
    }    
}
