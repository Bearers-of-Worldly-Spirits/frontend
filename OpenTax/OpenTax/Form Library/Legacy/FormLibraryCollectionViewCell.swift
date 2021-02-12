//
//  FormLibraryCollectionViewCell.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/17/21.
//

import UIKit
import SnapKit


class FormLibraryCollectionViewCell : UICollectionViewCell {
    
    
    var card:Card!
    var imageView:UIImageView!
    var textLabel:UILabel!
    var percentLabel:UILabel!
    var spacer:UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        
        card = Card()        
        contentView.addSubview(card)
        
        imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.cornerCurve = .continuous
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        card.addSubview(imageView)
        
        textLabel = UILabel()
        textLabel.textColor = .label
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.numberOfLines = 0
        card.addSubview(textLabel)
        
        percentLabel = UILabel()
        percentLabel.textColor = .systemGray2
        percentLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        percentLabel.adjustsFontForContentSizeCategory = true
        percentLabel.textAlignment = .right
        card.addSubview(percentLabel)
        
        spacer = UIView()
        contentView.addSubview(spacer)
    }
    
    func setUIConstraints() {
        card.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(20)
            make.height.lessThanOrEqualToSuperview()
        }

        imageView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview().inset(8)
            make.width.equalTo(50)
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(20)
            make.left.equalTo(self.imageView.snp.right).offset(8)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        percentLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(20)
            make.width.lessThanOrEqualToSuperview()
        }
        
        spacer.snp.makeConstraints { (make) in
            make.top.equalTo(card.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setData(_ data:LibraryRow) {
        imageView.image = data.image
        textLabel.text = data.text
        percentLabel.text = String(data.percent) + "%"
        setLabelColorBasedOnPercentComplete(data.percent)
    }
    
    func setLabelColorBasedOnPercentComplete(_ percent:Double) {
        if percent < 0.3 {
            percentLabel.textColor = .systemRed
        }else if percent < 0.6 {
            percentLabel.textColor = .systemOrange
        }else if percent < 1.0 {
            percentLabel.textColor = .systemGreen
        }else{
            percentLabel.textColor = .systemGray3
        }
    }
}


