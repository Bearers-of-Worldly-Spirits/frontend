//
//  BasicSignupViewController.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/30/21.
//

import UIKit
import SnapKit


class BasicSignupViewController : UIViewController {
    
    var titleLabel:UILabel!
    var subtitleLabel:UILabel!
    
    var signupButton:UIButton!
    var loginButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        snap()
        
        loginButton.onTap {
            self.dismiss(animated: true, completion: nil)
        }
        
        signupButton.onTap {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        titleLabel = UILabel()
        titleLabel.text = "Open Tax"
        titleLabel.textColor = .primary
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        subtitleLabel = UILabel()
        subtitleLabel.text = "Open source tax software.\nMade with 🤍"
        subtitleLabel.textColor = .tertiaryLabel
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        view.addSubview(subtitleLabel)
        
        signupButton = UIButton()
        signupButton.backgroundColor = .primary
        signupButton.layer.cornerRadius = 10
        signupButton.layer.cornerCurve = .continuous
        signupButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        signupButton.titleLabel?.adjustsFontForContentSizeCategory = true
        signupButton.setTitleColor(.systemBackground, for: .normal)
        signupButton.setTitleColor(.systemGray6, for: .highlighted)
        signupButton.setTitle("Signup", for: .normal)
        view.addSubview(signupButton)
        
        loginButton = UIButton()
        loginButton.setTitle("Already have an account?", for: .normal)
        loginButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        loginButton.titleLabel?.adjustsFontForContentSizeCategory = true
        loginButton.setTitleColor(.tertiaryLabel, for: .normal)
        loginButton.setTitleColor(.quaternaryLabel, for: .highlighted)
        view.addSubview(loginButton)
    }
    
    func snap() {
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.lessThanOrEqualToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.lessThanOrEqualToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
        }
        
        signupButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.loginButton.snp.top).offset(0)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }

    }
    
    func login() {
        
    }
    
    func signup() {
        
    }
}
