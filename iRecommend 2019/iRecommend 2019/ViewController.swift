//
//  ViewController.swift
//  iRecommend 2019
//
//  Created by Jacqualyn Blizzard-Caron on 1/22/19.
//  Copyright © 2019 Jacqualyn Blizzard-Caron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backgroundImageView = UIImageView()
   
    // Part 3 - Storing netflix shows
    var netflixShows: [String] = ["Tidying Up with Marie Kondo", "Kim's Convenience", "Stranger Things", "Orange is the New Black", "Master of None"]
    
    // Part 2 - Creating an IBOutlet for the recommendation label
    @IBOutlet weak var recommendationLabel: UILabel!
    
    // Extension 2 - Image View for corresponding picture
    @IBOutlet weak var showImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBackground()
    }
    
    // Part 2 - Creating an IBAction to handle code when the button is clicked.
    @IBAction func handlePickShow(_ sender: Any) {
        getRandomShow()
    }
    
    // Part 4 - Creating a function to get a random show
    func getRandomShow() {
        var randomShow = netflixShows.randomElement()
        recommendationLabel.text = randomShow
        // Extension 2 - Updates the image view with matching show photo
        showImageView.image = UIImage(named: randomShow!)
    }
    
    // Part 5 - Get a show when the device is shaken
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        getRandomShow()
    }
    
    // Extension 3 - Getting user input and adding it to the show array
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBAction func handleAddingUserInput(_ sender: Any) {
        var newShow = userInputTextField.text
        netflixShows.append(newShow!)
        userInputTextField.resignFirstResponder()
        userInputTextField.text = ""
    }
    
    // OPTIONAL Part 1 - Setting a background image programmatically
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "Background Image")
        view.sendSubviewToBack(backgroundImageView)
    }
}

