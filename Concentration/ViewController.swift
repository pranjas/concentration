//
//  ViewController.swift
//  Concentration
//
//  Created by Jasleen Arora Srivastava on 06/11/18.
//  Copyright © 2018 Jasleen Arora Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let numCards = 10
    private lazy var game = Concentration(numCards: numCards)
    private let flipLabel = UILabel()
    
    private var allButtons = [[UIButton]]()
    private let rows = 5
    private let cols = 4
    private var faceupCardIndex: Int?
    private let newGameButton = UIButton()

    private let enabledButtonColor = UIColor.orange
    private let disabledButtonColor = UIColor.gray
    private let newGameButtonColor = UIColor.init(red: 0.31, green: 0.61, blue: 0.22, alpha: 0.78)
    private let systemFontSize = UIFont.systemFontSize * 4
    private let stackViewSpacing :CGFloat = 5.0
    
    private var clickedDate = Date()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Create an empty array of buttons.
        for r in 0..<rows {
            allButtons.append([])
            addHorizontalStackView(whichRow: r, numButtons: cols)
        }
        addFlipLabelAndNewGameButton()
        view.backgroundColor = .black
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func addFlipLabelAndNewGameButton() {
        flipLabel.text = "Flips = 0"
        flipLabel.textAlignment = .center
        flipLabel.textColor = .red
        flipLabel.font = UIFont.systemFont(ofSize: systemFontSize, weight: .heavy)
        let horizStackView = UIStackView()
        horizStackView.alignment = .fill
        horizStackView.axis = .horizontal
        horizStackView.distribution = .fillEqually
        
        horizStackView.addArrangedSubview(flipLabel)
        horizStackView.addArrangedSubview(newGameButton)
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.backgroundColor = newGameButtonColor
        newGameButton.addTarget(self, action: #selector(ViewController.onResetButtonClick(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(horizStackView)
        flipLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func onResetButtonClick(_ sender: UIButton) {
        game = Concentration(numCards: numCards)
        for r in 0..<rows {
            for c in 0..<cols{
                allButtons[r][c].backgroundColor = enabledButtonColor
                allButtons[r][c].isEnabled = true
                allButtons[r][c].setTitle("", for: .normal)
            }
        }
        flipCount = 0
    }
    
    private func addHorizontalStackView(whichRow :Int, numButtons: Int) {
        let horizontalStackView = UIStackView()
        horizontalStackView.alignment = .fill
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        
        //TODO: We need to set the height and width to be proportional to the button's label size.
        for x in 0..<numButtons {
            let btn = UIButton()
            btn.backgroundColor = enabledButtonColor
            
            btn.titleLabel?.font = UIFont.systemFont(ofSize: systemFontSize, weight: .heavy)
            horizontalStackView.addArrangedSubview(btn)
            horizontalStackView.spacing = stackViewSpacing
            btn.tag = whichRow * cols + x
            allButtons[whichRow].append(btn)
            btn.setTitle("", for: .normal)
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
            
            btn.addTarget(self, action: #selector(ViewController.onCardClick(_:)), for: .touchUpInside)
        }
        stackView.addArrangedSubview(horizontalStackView)
    }
    
    @IBOutlet weak var stackView: UIStackView!
    private var flipCount = 0 {
        didSet {
            flipLabel.text = "Flips = \(flipCount)"
        }
    }

    @IBAction func onCardClick(_ sender: UIButton) {
        
        //MARK: if we click the faced up card again then do nothing.
        if (sender.tag == faceupCardIndex) {
            return
        }
        
        sender.setTitle(game.getCardAt(index: sender.tag)?.label ?? "", for: .normal)
        
        //This will probably run each time except the first time
        //or When we have a new game.
        let secondClickDate = Date()
        let interval = secondClickDate.timeIntervalSince(clickedDate)
        clickedDate = secondClickDate
        var scoreAmount  = 0
        
        if game.faceUpCard != nil {
            let row = faceupCardIndex! / cols
            let col = faceupCardIndex! % cols
            let faceupCardbtn = allButtons[row][col]
            //MARK: Check if we flip and match. flip returns true if we have a match
            if game.flip(cardAt: sender.tag) {
                sender.isEnabled = false
                sender.backgroundColor = disabledButtonColor
                faceupCardbtn.backgroundColor = disabledButtonColor
                faceupCardbtn.isEnabled = false
                scoreAmount = 2
            }
            else {
                faceupCardbtn.backgroundColor = enabledButtonColor
                faceupCardbtn.setTitle("", for: .normal)
                scoreAmount = -1
            }
        } else {
            let _ = game.flip(cardAt: sender.tag)
        }
        faceupCardIndex = sender.tag
        scoreAmount = (interval < 2) ? (scoreAmount * 2) : scoreAmount
        flipCount += scoreAmount
        clickedDate = Date() // Get the current date and time.
    }
}

