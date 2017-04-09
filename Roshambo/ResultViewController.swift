import UIKit

class ResultViewController : UIViewController {
  var playerPlayed: PlayOption?
  var opponentPlayed: PlayOption?

  // Interface Builder
  @IBOutlet weak var playerPlayedLabel: UILabel!
  @IBOutlet weak var opponentPlayedLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!

  @IBAction func playAgain() {
    self.presentingViewController?.dismiss(animated: true, completion: nil)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    playerPlayedLabel.text = optionToString(playerPlayed!)
    opponentPlayedLabel.text = optionToString(opponentPlayed!)
    resultLabel.text =
      isWinner(played: playerPlayed!, against: opponentPlayed!) ? "You Won!" :
      isTie(played: playerPlayed!, against: opponentPlayed!) ? "Tie" :
      "You Lost"
  }

  func isWinner(played: PlayOption, against: PlayOption) -> Bool {
    return played == .rock && against == .scissors ||
      played == .scissors && against == .paper    ||
      played == .paper    && against == .rock
  }

  func isTie(played: PlayOption, against: PlayOption) -> Bool {
    return played == .rock && against == .rock ||
      played == .scissors && against == .scissors ||
      played == .paper    && against == .paper
  }

  func optionToString(_ option: PlayOption) -> String {
    switch option {
    case .rock: return "Rock"
    case .paper: return "Paper"
    case .scissors: return "Scissors"
    }
  }

}
