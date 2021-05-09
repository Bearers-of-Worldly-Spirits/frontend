//
//  IntroViewController.swift
//  MoonMessenger
//
//  Created by Josh Arnold on 5/9/21.
//

import UIKit
import SwiftUI
import Preview


class IntroViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    var moonImageView = UIImageView(image: UIImage(named: "Moon") ?? UIImage())
    var backgroundImage = UIImageView(image: UIImage(named: "NightSky") ?? UIImage())
    var titleLabel:UILabel = UILabel.title()
    var bodyLabel:UILabel = UILabel.body()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        view.backgroundColor = .background
        
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.hero.id = "background"
        backgroundImage.hero.modifiers = [.duration(2.0)]
        view.addSubview(backgroundImage)
        
        moonImageView.hero.id = "moon"
        moonImageView.hero.modifiers = [.duration(2.0)]
        view.addSubview(moonImageView)
        
        titleLabel.text = "Moon."
        titleLabel.alpha = 0
        view.addSubview(titleLabel)
        
        bodyLabel.text = "Beautiful, secure, messaging."
        bodyLabel.alpha = 0
        view.addSubview(bodyLabel)
         
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        moonImageView.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }
                    
        bodyLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(20)
            make.height.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
            make.bottom.equalTo(self.bodyLabel.snp.top)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0) {
            self.titleLabel.alpha = 1
            self.bodyLabel.alpha = 0.5
        }
    }
}


@available(iOS 13.0, *)
struct IntroContentView_Previews : PreviewProvider {
    static var previews : some View {
        Group {
            Preview.make(IntroViewController())
        }
    }
}

