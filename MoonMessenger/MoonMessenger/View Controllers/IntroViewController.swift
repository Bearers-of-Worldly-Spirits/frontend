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
         
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        moonImageView.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
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

