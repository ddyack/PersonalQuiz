//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultDescription: UILabel!
    
    
    var results: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        let result = getResult(from: results)
        showResult(for: result)
    }

}

extension ResultsViewController {
    private func getResult(from results: [Answer]) -> AnimalType {
        
        var counterResults:[AnimalType : Int] = [.dog : 0,
                                                 .cat : 0,
                                                 .turtle : 0,
                                                 .rabbit : 0]

        for result in results {
            counterResults[result.type]? += 1
        }
        
        let sortedResults = counterResults.sorted { $0.1 > $1.1 }
        return sortedResults.first?.key ?? AnimalType.dog
    }
    
    private func showResult(for result: AnimalType) {
        resultLabel.text = "Вы - \(result.rawValue)"
        resultDescription.text = "\(result.definition)"
    }
}

