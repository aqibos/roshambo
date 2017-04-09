import UIKit

class SelectViewController: UIViewController {

  override func viewDidLoad() { super.viewDidLoad() }

  @IBAction func play(_ sender: UIButton) {
    let playerPlayed = PlayOption(rawValue: sender.tag)!
    let opponentPlayed = opponentsMove()
    onResult(played: playerPlayed, against: opponentPlayed)
  }

  func onResult(played: PlayOption, against: PlayOption) {
    let resultController = loadResultController()
    resultController.playerPlayed = played
    resultController.opponentPlayed = against
    presentResult(controller: resultController)
  }

  func loadResultController() -> ResultViewController {
    return storyboard?.instantiateViewController(
      withIdentifier: "result"
    ) as! ResultViewController
  }

  func presentResult(controller: ResultViewController) {
    present(controller, animated: true, completion: nil)
  }


  func opponentsMove() -> PlayOption {
    func randomNumber() -> Int {
      let randomValue = 0 + arc4random() % 2
      return Int(randomValue)
    }
    
    return PlayOption(rawValue: randomNumber())!
  }
}
