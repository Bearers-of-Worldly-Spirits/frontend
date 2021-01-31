//
//  ProfilePictureView.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/20/21.
//

import UIKit


class ProfilePictureView : UIImageView {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        clipsToBounds = true
        layer.borderColor = UIColor.systemBackground.cgColor
        layer.borderWidth = 5.0
        contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.size.width/2
        super.layoutSubviews()
    }
}
