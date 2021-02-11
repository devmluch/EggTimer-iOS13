import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBOutlet weak var titleLabel: UILabel!
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    var timer = Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        let hardness  = sender.currentTitle!
        titleLabel.text = hardness
        
        print(eggTimes[hardness]!)
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        if secondsPassed  < totalTime {

            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
            
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
