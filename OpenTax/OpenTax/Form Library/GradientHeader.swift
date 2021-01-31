//
//  GradientHeader.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/20/21.
//

import UIKit
import SnapKit


class GradientHeader : ResizableGradientView {
    
    var gradient:ResizableGradientView!
    var profilePicture: ProfilePictureView!
    var messageLabel: UILabel!
    var spacer:UIView!
    
    override init() {
        super.init()
        setupUI()
        snap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        gradient = ResizableGradientView()
        addSubview(gradient)
        
        profilePicture = ProfilePictureView()
        addSubview(profilePicture)
        
        messageLabel = UILabel()
        messageLabel.text = "Welcome back, User!"
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        messageLabel.textAlignment = .center
        messageLabel.textColor = .systemBackground
        messageLabel.adjustsFontForContentSizeCategory = true
        addSubview(messageLabel)
        
        spacer = UIView()
        addSubview(spacer)
    }
    
    func snap() {
        gradient.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        profilePicture.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.profilePicture.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
        
        spacer.snp.makeConstraints { (make) in
            make.top.equalTo(messageLabel.snp.bottom).offset(60)
            make.bottom.left.right.equalToSuperview()
        }
    }
}
