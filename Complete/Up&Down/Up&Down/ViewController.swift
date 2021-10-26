//
//  ViewController.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/26.
//

import Combine
import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var currentValueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 25, weight: .bold)
        $0.text = "10"
    }
    
    private lazy var valueSlider = UISlider().then {
        $0.maximumValue = 20
        $0.minimumValue = 0
        $0.value = 10
        $0.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        $0.addTarget(self, action: #selector(sliderValueEditingDidEnd), for: .touchUpInside)
    }
    
    private lazy var answerLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 40, weight: .bold)
        $0.textColor = .red
        $0.text = "오답"
    }
    
    // MARK: - Private Properteis
    
    private let viewModel: ViewModel
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.bindUI()
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
    
    private func bindUI() {
        self.viewModel.$currentValue
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.currentValueLabel.text = "\(value)"
            }
            .store(in: &cancellables)
        
        self.viewModel.$isAnswer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isAnswer in
                self?.updateAnswerLabel(isAnswer: isAnswer)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Private Methods
    
    @objc private func sliderValueDidChange(_ sender: UIControl) {
        viewModel.currentValue = Int(valueSlider.value)
    }
    
    @objc private func sliderValueEditingDidEnd(_ sender: UIControl) {
        viewModel.valueEdittingDidEnd()
    }
    
    private func updateAnswerLabel(isAnswer: Bool) {
        if isAnswer {
            answerLabel.text = "정답!"
            answerLabel.textColor = .systemGreen
        } else {
            answerLabel.text = "오답"
            answerLabel.textColor = .red
        }
    }
}
