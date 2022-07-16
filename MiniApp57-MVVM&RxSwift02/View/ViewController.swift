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

    // viewModelに監視をお願いしている
    private lazy var viewModel = ViewModel(
        beforeTextObservable: beforeTextField.rx.text.asObservable(),
        afterTextObservable: afterTextField.rx.text.asObservable()
        //model: Model()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // 同期して、mixTextLabelの文字列も更新
        viewModel.mixText
            .bind(to: mixTextLabel.rx.text)
            .disposed(by: disposeBag)
    }

}

