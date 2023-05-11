//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstVariant: UIButton!
    @IBOutlet weak var secondVariant: UIButton!
    @IBOutlet weak var thirdVariant: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // selector without any bracets
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        firstVariant.setTitle("\(quizBrain.getQuestionAnswers()[0])", for: .normal)
        secondVariant.setTitle("\(quizBrain.getQuestionAnswers()[1])", for: .normal)
        thirdVariant.setTitle("\(quizBrain.getQuestionAnswers()[2])", for: .normal)


        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstVariant.backgroundColor = UIColor.clear
        secondVariant.backgroundColor = UIColor.clear
        thirdVariant.backgroundColor = UIColor.clear
    }
    
}

