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
    let disposeBag = DisposeBag()
    let mixText: Observable<String>
    //private let mixText = BehaviorRelay<String>

//    init(beforeTextObservable: Observable<String?>,
//         afterTextObservable: Observable<String?>,
//         model: ModelProtocol) {
//
////        let event = Observable
////            .combineLatest(beforeTextObservable, afterTextObservable)
////            .skip(1)
////            .flatMapLatest{
////                beforeText,
////                afterText -> Observable<Event<String>> in return model
////                    .validate(beforeText: beforeText, afterText: afterText)
////                    .materialize()
////            }.share()
////
////        self.mixText = event
////            .flatMap { event -> Observable<String> in
////                return .just("h")
////            }
////        }

    init(beforeTextObservable: Observable<String?>,
         afterTextObservable: Observable<String?>) {

        self.mixText = Observable.combineLatest(beforeTextObservable, afterTextObservable) {
            "\($0!)" + "\($1!)"
        }
            //.combineLatest(beforeTextObservable, afterTextObservable)
            //.merge(beforeTextObservable, afterTextObservable)
            //.disposed(by: disposeBag)

    }

}
