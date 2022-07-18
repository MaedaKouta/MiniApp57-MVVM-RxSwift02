//
//  ViewController.swift
//  MiniApp57-MVVM&RxSwift02
//
//  Created by 前田航汰 on 2022/07/15.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    @IBOutlet weak var beforeTextField: UITextField!
    @IBOutlet weak var afterTextField: UITextField!
    @IBOutlet weak var mixTextLabel: UILabel!

    private let disposeBag = DisposeBag()

    // viewModelをインスタンス化
    private lazy var viewModel = ViewModel (
        beforeTextObservable: beforeTextField.rx.text.asObservable(),
        afterTextObservable: afterTextField.rx.text.asObservable()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // viewModelのmixTextをmixTextLabelに流し続けてあげる
        viewModel.mixText
            .bind(to: mixTextLabel.rx.text)
            .disposed(by: disposeBag)
    }

}

