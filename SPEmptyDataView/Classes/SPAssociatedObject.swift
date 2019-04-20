//
//  SPAssociatedObject.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/19.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit

class SPAssociatedObject {

    
    /// 获取关联属性
    ///
    /// - Parameters:
    ///   - base:           关联类
    ///   - key:            属性对应值
    ///   - initialiser:    初始化闭包
    /// - Returns: 属性
    static func associatedObject<ValueType: Any>(base: Any, key: UnsafePointer<UInt8>, initialiser: () -> ValueType) -> ValueType {
        
        if let associated = objc_getAssociatedObject(base, key) as? ValueType {
            return associated
        }
        
        let associated = initialiser()
        
        objc_setAssociatedObject(base, key, associated, .OBJC_ASSOCIATION_RETAIN)
        
        return associated
    }
    
    /// 设置关联属性
    ///
    /// - Parameters:
    ///   - base:       关联类
    ///   - key:        属性对应值
    ///   - value:      新属性
    static func associatedObject<ValueTyoe: Any>(base: Any, key: UnsafePointer<UInt8>, value: ValueTyoe) {
        
        objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
}
