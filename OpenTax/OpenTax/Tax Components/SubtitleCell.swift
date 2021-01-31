//
//  SubtitleCell.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/27/21.
//

import UIKit
import SnapKit


final class SubtitleCell : UICollectionViewCell, ComponentBased {
    
    static var identifier = "subtitle"
    
    var data:ComponentData = ComponentData() {
        didSet {
            label.text = data.text
        }
    }
    
    private var label:UILabel!
    
    private var spacer:UIView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        contentView.addSubview(label)
        
        spacer = UIView()
        contentView.addSubview(spacer)
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.lessThanOrEqualToSuperview()
        }
        
        spacer.snp.makeConstraints { (make) in
            make.top.equalTo(self.label.snp.bottom).offset(40)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
