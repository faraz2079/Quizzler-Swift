import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var midButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var upperButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            progressBar.progressTintColor = UIColor.green
            questionLabel.textColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            progressBar.progressTintColor = UIColor.red
            questionLabel.textColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
     @objc func updateUI(){
         questionLabel.text = quizBrain.getQuestionText()
         upperButton.setTitle(quizBrain.getFirstAnswer(), for: .normal)
         midButton.setTitle(quizBrain.getSecondAnswer(), for: .normal)
         bottomButton.setTitle(quizBrain.getThirdAnswer(), for: .normal)
         progressBar.progress = quizBrain.getProgress()
         scoreLabel.text = "Score: \(quizBrain.getScore()) \\ \(quizBrain.countQuiz())"
         self.midButton.backgroundColor = UIColor.clear
         self.bottomButton.backgroundColor = UIColor.clear
         self.upperButton.backgroundColor = UIColor.clear
         self.questionLabel.textColor = UIColor.white

    }
}


//                    let alertController = UIAlertController(title: "End of the Question", message: "Now the Questions restart again", preferredStyle: .alert)
//                    let okAction = UIAlertAction(title: "OK", style: .default) {_ in }
//                    alertController.addAction(okAction)
//                    alertController.present(alertController, animated: true, completion: nil)
