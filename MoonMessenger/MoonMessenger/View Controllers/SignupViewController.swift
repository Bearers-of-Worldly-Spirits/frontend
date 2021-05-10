//
//  SignupViewController.swift
//  MoonMessenger
//
//  Created by Josh Arnold on 5/10/21.
//

import Foundation
import UIKit
import SwiftUI
import Preview


class SignupViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    var titleLabel:UILabel = UILabel.title()
    var signup:ShinyButton!
    var login:TextButton!
    var moonBackground:UIImageView = UIImageView(image: UIImage(named: "SignupMoon")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        hero.isEnabled = true
        
        moonBackground.contentMode = .scaleAspectFill
        moonBackground.alpha = 0
        moonBackground.transform = CGAffineTransform(translationX: 0, y: -100)
        view.addSubview(moonBackground)
        
        titleLabel.text = "Signup."
        titleLabel.alpha = 0
        titleLabel.transform = CGAffineTransform(translationX: 0, y: 20)
        view.addSubview(titleLabel)
        
        signup = ShinyButton("Signup") {
            self.signupUser()
        }
        signup.hero.id = "signup"
        signup.hero.modifiers = [.duration(0.5)]
        view.addSubview(signup)
        
        login = TextButton("Have an account?") {
            self.loginUser()
        }
        login.hero.id = "login"
        login.hero.modifiers = [.duration(0.3)]
        view.addSubview(login)
                
        moonBackground.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(225)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.left.right.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
        
        signup.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(46)
            make.center.equalToSuperview()
        }
        
        login.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(
            withDuration: 0.9,
                    delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.7,
                    options: [],
                    animations: {
                        self.titleLabel.alpha = 1
                        self.titleLabel.transform = .identity
                        self.moonBackground.alpha = 1
                        self.moonBackground.transform = .identity
                    },
                    completion: nil
                )
    }
    
    func signupUser() {
        
    }
    
    func loginUser() {
        
    }
}


@available(iOS 13.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews : some View {
        Group {
            Preview.make(SignupViewController())
        }
    }
}

