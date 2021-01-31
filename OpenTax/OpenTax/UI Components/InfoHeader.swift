//
//  InfoHeader.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/24/21.
//

import UIKit
import SnapKit


class InfoHeader : UIView {
    
    var title:String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subtitle:String = "" {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    private var titleLabel:UILabel!
    
    private var subtitleLabel:UILabel!
    
    init() {
        super.init(frame: .zero)
        setupUI()
        snap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        titleLabel = UILabel()
        titleLabel.textColor = .label
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        subtitleLabel = UILabel()
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        addSubview(subtitleLabel)
    }
    
    func snap() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
