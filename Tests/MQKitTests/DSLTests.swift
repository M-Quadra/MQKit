//
//  DSLTests.swift
//
//
//  Created by m_quadra on 2024/5/1.
//

import UIKit

struct UIViewDSL<T: UIView>: ~Copyable {
    let object: T
    init(_ object: T) {
        self.object = object
    }
}

extension UIViewDSL {
    
    @discardableResult
    consuming func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.object.backgroundColor = backgroundColor
        return self
    }

    @discardableResult
    consuming func alpha(_ alpha: CGFloat) -> Self {
        self.object.alpha = alpha
        return self
    }
}

func dsl<T: UIView>(
    for view: T = T(),
    closure: (_ make: consuming UIViewDSL<T>) -> Void
) -> T {
    closure(UIViewDSL(view))
    return view
}

let view0: UIView = dsl { (make: consuming UIViewDSL<UIView>) in
    make.backgroundColor(.white)
        .alpha(1)
}
// 等未来编译器类型推理能正确传递所有权再跳NoCopyable
//let view1: UIView = dsl { make in
//    make.backgroundColor(.white)
//        .alpha(1)
//}
