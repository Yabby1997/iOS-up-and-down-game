//
//  SecondViewController.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/11/07.
//

import Combine
import UIKit

class SecondViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var viewModel: SecondViewModel?
    private var cancellables: Set<AnyCancellable> = []
    
    convenience init(viewModel: SecondViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.bindUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func bindUI() {
        guard let viewModel = viewModel else { return }
        
        viewModel.$value
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.label.text = "\(value)은(는) 정답입니다!"
            }
            .store(in: &self.cancellables)
    }
}

class SecondViewModel {
    @Published var value: Int
    
    init(value: Int) {
        self.value = value
    }
}
