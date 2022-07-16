//
//  Model.swift
//  MiniApp57-MVVM&RxSwift02
//
//  Created by 前田航汰 on 2022/07/15.
//

import Foundation
import RxCocoa
import RxSwift

protocol ModelProtocol {
    func validate(beforeText: String?, afterText: String?) -> Observable<String>
}

final class Model: ModelProtocol {

    func validate(beforeText: String?, afterText: String?) -> Observable<String> {
        let before = beforeText ?? ""
        let after = afterText ?? ""
        return Observable.just((before + after))
    }


}
