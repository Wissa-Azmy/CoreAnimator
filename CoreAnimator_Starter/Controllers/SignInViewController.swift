//
//  ViewController.swift
//  CoreAnimator_Starter
//
//  Created by Harrison Ferrone on 20.05.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signInButton.round(cornerRadius: 10, borderWidth: 3, borderColor: UIColor.white)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fadeInViews()
        animateButtonWithSpring()
    }
    
    // MARK: User Actions
    @IBAction func SignInOnButtonPressed(_ sender: Any) {
        segueToNextViewController(segueID: Constants.Segues.loadingVC, withDelay: 1.0)
    }
    
    // MARK: Animations
    func fadeInViews() {
        let fade = AnimationHelper.basicFadeAnimation()
        titleLabel.layer.add(fade, forKey: nil)
        // Delay fadeIn for the below views
        fade.beginTime = AnimationHelper.addDelay(time: 1.0)
        usernameField.layer.add(fade, forKey: nil)
        fade.beginTime = AnimationHelper.addDelay(time: 2.0)
        passwordField.layer.add(fade, forKey: nil)
    }
    
    func animateButtonWithSpring() {
        let moveUp = CASpringAnimation(keyPath: AnimationHelper.posY)
        moveUp.fromValue = signInButton.layer.position.y + AnimationHelper.screenBounds.height
        moveUp.toValue = signInButton.layer.position.y
        moveUp.duration = moveUp.settlingDuration
        moveUp.beginTime = AnimationHelper.addDelay(time: 2.0)
        moveUp.fillMode = kCAFillModeBackwards
        
        // Spring physics properties
        signInButton.layer.add(moveUp, forKey: nil)
        // The initial velocity is 0 by default so it can be set with both positive and negative values.
        moveUp.initialVelocity = 5
        moveUp.mass = 1  // It's = 1 by default
        moveUp.stiffness = 75 // It's default value is 100
        moveUp.damping = 12 // Controls how long the animation lasts by simulating resestence or friction on the string
        
    }
}

// MARK: Delegate Extensions

