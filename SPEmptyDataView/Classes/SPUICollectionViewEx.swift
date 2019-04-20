//
//  SPUICollectionViewEx.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/20.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit

internal var kEmptyDataSetSource_cv = "emptyDataSetSource"
internal var kEmptyDelegate_cv      = "emptyDelegate"
internal var kEmptyDataSetView_cv   = "emptyDataSetView"
internal var kEmptyImage_cv         = "emptyImage"

extension UICollectionView {

    /// 空数据显现:数据代理对象
    weak public var sp_cv_emptyDataSource: SPEmptyDataSource? {
        get {
            return objc_getAssociatedObject(self, &kEmptyDataSetSource_cv) as? SPEmptyDataSource
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kEmptyDataSetSource_cv, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if newValue == nil || sp_cv_canDispaly() {
                sp_cv_invalidate()
            }
            swizzleReloadData_cv()
        }
    }
    
    /// 空数据显现:代理对象
    weak public var sp_cv_emptyDelegate: SPEmptyDelegate? {
        get {
            return objc_getAssociatedObject(self, &kEmptyDelegate_cv) as? SPEmptyDelegate
        }
        set(newValue) {
            if newValue != nil {
                sp_cv_invalidate()
            }
            objc_setAssociatedObject(self, &kEmptyDelegate_cv, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}


extension UICollectionView {
    
    public var emptyView_cv: SPEmptyDataView? {
        get {
            if let view = objc_getAssociatedObject(self, &kEmptyDataSetView_cv) as? SPEmptyDataView {
                return view
            }
            
            let view = SPEmptyDataView()
            objc_setAssociatedObject(self, &kEmptyDataSetView_cv, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return view
        }
        set(newValue) {
            objc_setAssociatedObject(self, kEmptyDataSetView_cv, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// item个数
    var sp_cv_itemCount: Int {
        get {
            let items = collectionViewItemsCount()
            return items
        }
    }
    
    /// 获取collection 有多少项
    ///
    /// - Returns:
    func collectionViewItemsCount() -> Int {
        var items = 0
        if !responds(to: #selector(getter: UICollectionView.dataSource)) {
            return items
        }
        let sections = self.dataSource?.numberOfSections?(in: self) ?? 0
        for sectionIndex in 0..<sections {
            items += self.dataSource?.collectionView(self, numberOfItemsInSection: sectionIndex) ?? 0
        }
        return items
    }
    
    /// 初始化
    func sp_cv_invalidate() {
        sp_cv_emptyDelegate?.didAppear(emptyView: self)
        emptyView_cv?.removeFromSuperview()
        emptyView_cv = nil
        isScrollEnabled = true
        sp_cv_emptyDelegate?.didDisappear(emptyView: self)
    }
    
    /// 是否可以显示
    ///
    /// - Returns:
    func sp_cv_canDispaly() -> Bool {
        guard let _ = sp_cv_emptyDataSource else {
            return false
        }
        return true
    }
    
    @objc func sp_cv_didTapDataButton(_ sender: UIButton) {
        guard let sp_delegate = self.sp_cv_emptyDelegate else {
            return
        }
        sp_delegate.didTap(emptyView: self, button: sender)
}
}
