//
//  ViewWithSlider.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 08.04.2022.
//

import Foundation
import SnapKit

class ViewWithSlider: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    private lazy var greenview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 78/255, green: 161/255, blue: 101/255, alpha: 0.05)
        view.layer.cornerRadius = 50
        return view
    }()
    private lazy var slider: UISlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        animator = UIViewPropertyAnimator(duration: 1.5, curve: .linear, animations: {
            self.greenview.transform = .init(scaleX: 10, y: 10)
            self.greenview.backgroundColor = UIColor(red: 78/255, green: 161/255, blue: 101/255, alpha: 1)
        })
    }
    
    @objc private func sliderDidChange(_ sender: UISlider){
        animator.fractionComplete = CGFloat(sender.value)
    }
}

extension ViewWithSlider {
    private func initialize() {
        
        view.backgroundColor = .white
        view.addSubview(greenview)
        view.addSubview(slider)
        greenview.snp.makeConstraints{maker in
            maker.right.left.equalToSuperview().inset(190)
            maker.top.bottom.equalToSuperview().inset(420)
        }
        
        slider.snp.makeConstraints{maker in
            maker.right.left.equalToSuperview().inset(30)
            maker.bottom.equalToSuperview()
            maker.top.equalTo(greenview).inset(300)
        }
        
        slider.addTarget(self, action: #selector(sliderDidChange(_:)), for: .valueChanged)
    }
}
