//
//  ViewModel.swift
//  MiniApp57-MVVM&RxSwift02
//
//  Created by 前田航汰 on 2022/07/15.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {

    // let disposeBag = DisposeBag()
    let mixText: Observable<String>

    init(beforeTextObservable: Observable<String?>,
         afterTextObservable: Observable<String?>) {

        self.mixText = Observable.combineLatest(beforeTextObservable, afterTextObservable) {
            "\($0!)" + "\($1!)"
        }
    }

}
