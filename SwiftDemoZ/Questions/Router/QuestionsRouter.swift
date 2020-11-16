//
//  QuestionsRouter.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

protocol QuestionsRouterProtocol {
    static func createModal() -> UIViewController
}

class QuestionsRouter: QuestionsRouterProtocol {
    static func createModal() -> UIViewController {
        let instance: QuestionsViewController = QuestionsViewController()
        var presenter: QuestionsPresenterProtocol & QuestionsInteractorOutputProtocol = QuestionsPresenter()
        var interactor: QuestionsInteractorInputProtocol = QuestionsInteractor()
        let dataManager: QuestionsDataSourceProtocol = QuestionsDataSource()
        let router: QuestionsRouterProtocol = QuestionsRouter()
        
        instance.presenter = presenter
        presenter.view = instance
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenterOutput = presenter
        interactor.dataSource = dataManager
        return instance
        
    }    
}
