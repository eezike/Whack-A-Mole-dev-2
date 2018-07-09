import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var moleButton0: UIButton!
    @IBOutlet weak var moleButton1: UIButton!
    @IBOutlet weak var moleButton2: UIButton!
    @IBOutlet weak var moleButton3: UIButton!
    @IBOutlet weak var moleButton4: UIButton!
    @IBOutlet weak var moleButton5: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var moles = [UIButton]()
    var score = 0
    let impact = UIImpactFeedbackGenerator()
    var counter = 30.0
    var timer = Timer()
    var x = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moleButton0.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton1.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton2.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton3.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton4.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton5.setImage(UIImage(named: "hole")!, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moles.append(moleButton0)
        moles.append(moleButton1)
        moles.append(moleButton2)
        moles.append(moleButton3)
        moles.append(moleButton4)
        moles.append(moleButton5)
    }
    
    func tapMole (index: Int)
    {
        if (moles[index].currentImage?.isEqual(UIImage(named: "mole")))!
        {
            score += 1
            moles[index].setImage(UIImage(named: "hole")!, for: .normal)
            impact.impactOccurred()
            change()
        }
    }
    
    @IBAction func m0Tap(_ sender: Any)
    {
        tapMole (index: 0)
    }
    
    @IBAction func m1Tap(_ sender: Any)
    {
        tapMole (index: 1)
    }
    
    @IBAction func m2Tap(_ sender: Any)
    {
        tapMole (index: 2)
    }
    
    @IBAction func m3Tap(_ sender: Any)
    {
        tapMole (index: 3)
    }
    
    @IBAction func m4Tap(_ sender: Any)
    {
        tapMole (index: 4)
    }
    
    @IBAction func m5Tap(_ sender: Any)
    {
        tapMole (index: 5)
    }
    
    func change()
    {
        let changer = Int(arc4random_uniform(UInt32(moles.count)))
        moles[changer].setImage(UIImage(named: "mole")!, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            self.moles[changer].setImage(UIImage(named: "hole")!, for: .normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func UpdateTimer() {
        counter = counter - 0.1
        
        x += 1
        if (counter >= 0.0)
        {
            timeLabel.text = (String (format: "%.0f",counter))
            startButton.setTitle("", for: .normal)
        }
        else
        {
            timer.invalidate()
            startButton.isEnabled = true
            startButton.setTitle("START", for: .normal)
            timeLabel.text = ""
            performSegue(withIdentifier: "secondToThirdSegue", sender: self)
        }
        
        if x % 8 == 0
        {
            change()
        }
    }
    
    @IBAction func startButtonTapped(_ sender: Any)
    {
        score = 0
        counter = 30.0
        
        moleButton0.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton1.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton2.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton3.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton4.setImage(UIImage(named: "hole")!, for: .normal)
        moleButton5.setImage(UIImage(named: "hole")!, for: .normal)
        
        if counter >= 0.0
        {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            startButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let dvc = segue.destination as! ThirdViewController
        dvc.score = self.score
    }
}




