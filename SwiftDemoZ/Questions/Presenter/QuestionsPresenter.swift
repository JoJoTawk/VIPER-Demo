//
//  QuestionsPresenter.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

protocol QuestionsPresenterProtocol {
    var view: QuestionsViewControllerProtocol? { get set }
    var interactor: QuestionsInteractorInputProtocol? { get set }
    var router: QuestionsRouterProtocol? { get set }
    
    
    func getQuestions()
}

class QuestionsPresenter: QuestionsPresenterProtocol {
    
    weak var view: QuestionsViewControllerProtocol?
    var interactor: QuestionsInteractorInputProtocol?
    var router: QuestionsRouterProtocol?
    
    func getQuestions() {
        interactor?.getQuestions()
    }
}

extension QuestionsPresenter: QuestionsInteractorOutputProtocol {
    func didRetriveQuestions(modal: [Question]) {
        
        view?.reloadData(modal: modal)
    }
}
