//
//  QuestionsViewController.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import UIKit

protocol QuestionsViewControllerProtocol: class {
    var presenter: QuestionsPresenterProtocol? { get set }
    
    //PRESENTER -- > VIEW
    func getQuestions()
    func reloadData(modal: [Question])
    }

class QuestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nibName = UINib(nibName: String(describing: QuestionsCell.self), bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: identifier)
            tableView.backgroundColor = .white
        }
    }
       
    @IBOutlet weak var questionTitleLabel: UILabel! {
        didSet {
            questionTitleLabel.numberOfLines = 0
            questionTitleLabel.textColor = .black
        }
    }
    
    var presenter: QuestionsPresenterProtocol?
    var answersArray: [Answer] = []
    var titleQuestion = ""
    
    let identifier = "Cell"
    
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        presenter?.getQuestions()
    }
    
    func createTitleView() {
        questionTitleLabel.text = titleQuestion
    }
    
    func showAlert(correct: Bool) {
        let alertView = UIAlertController(title: String(describing: correct), message: "", preferredStyle: .alert)
        let okay = UIAlertAction(title: "OKAY", style: .default) { (action) in
            print("okay")
        }
        alertView.addAction(okay)
        self.present(alertView, animated: true, completion: nil)
    }
}

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answersArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        guard let qCell = cell as? QuestionsCell else {
            return cell
        }
     
        let item = answersArray[indexPath.row]
        qCell.titleLabel.text = item.title
        
        return qCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = answersArray[indexPath.row]
        
        let bool = item.correct
        showAlert(correct: bool)
    }
}

extension QuestionsViewController: QuestionsViewControllerProtocol {
 
    func getQuestions() {
        presenter?.getQuestions()
    }
    
    func reloadData(modal: [Question]) {
        print(modal)
        
        let randomItem = modal.randomElement()
        
        guard let item = randomItem else { return }
        
        answersArray = item.answers
        
        titleQuestion = item.query
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.createTitleView()
        }
        
        
    }
}
