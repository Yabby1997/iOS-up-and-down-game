//
//  ViewController.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/26.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var currentValueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 25, weight: .bold)
        $0.text = "50"
    }
    
    private lazy var valueSlider = UISlider().then {
        $0.maximumValue = 100
        $0.minimumValue = 0
        $0.value = 50
    }
    
    private lazy var answerLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 40, weight: .bold)
        $0.textColor = .red
        $0.text = "오답"
    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    // MARK: - Helpers
    
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(valueSlider)
        valueSlider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        self.view.addSubview(currentValueLabel)
        currentValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(valueSlider).offset(-50)
        }
        
        self.view.addSubview(answerLabel)
        answerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(currentValueLabel)
            make.top.equalTo(valueSlider).offset(50)
        }
    }
}
