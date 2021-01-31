//
//  TitleCell.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/26/21.
//

import UIKit
import SnapKit


final class TitleCell : UICollectionViewCell, ComponentBased {
    
    static var identifier = "title"
    
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
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
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
            make.top.equalTo(self.label.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
