//
//  SPUITableViewEx.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/20.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit

internal var kEmptyDataSetSource_tv = "emptyDataSetSource"
internal var kEmptyDelegate_tv      = "emptyDelegate"
internal var kEmptyDataSetView_tv   = "emptyDataSetView"
internal var kEmptyImage_tv         = "emptyImage"

extension UITableView {

    
    /// 空数据显现:数据代理对象
    weak public var sp_tv_emptyDataSource: SPEmptyDataSource? {
        get {
            return objc_getAssociatedObject(self, &kEmptyDataSetSource_tv) as? SPEmptyDataSource
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kEmptyDataSetSource_tv, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if newValue == nil || sp_tv_canDispaly() {
                sp_tv_invalidate()
            }
            swizzleReloadData_tv()
        }
    }
    
    /// 空数据显现:代理对象
    weak public var sp_tv_emptyDelegate: SPEmptyDelegate? {
        get {
            return objc_getAssociatedObject(self, &kEmptyDelegate_tv) as? SPEmptyDelegate
        }
        set(newValue) {
            if newValue != nil {
                sp_tv_invalidate()
            }
            objc_setAssociatedObject(self, &kEmptyDelegate_tv, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}


extension UITableView {
    
    public var emptyView_tv: SPEmptyDataView? {
        get {
            if let view = objc_getAssociatedObject(self, &kEmptyDataSetView_tv) as? SPEmptyDataView {
                return view
            }
            
            let view = SPEmptyDataView()
            objc_setAssociatedObject(self, &kEmptyDataSetView_tv, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return view
        }
        set(newValue) {
            objc_setAssociatedObject(self, kEmptyDataSetView_tv, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// item个数
    var sp_tv_itemsCount: Int {
        get {
            let items = tableViewItemsCount()
            return items
        }
    }
    
    /// 获取tableView 有多少项
    ///
    /// - Returns:
    func tableViewItemsCount() -> Int {
        var items = 0
        if !responds(to: #selector(getter: UITableView.dataSource)) {
            return items
        }
        let sections = self.dataSource?.numberOfSections?(in: self) ?? 0
        for sectionIndex in 0..<sections {
            items += self.dataSource?.tableView(self, numberOfRowsInSection: sectionIndex) ?? 0
        }
        return items
    }
    
    /// 初始化
    func sp_tv_invalidate() {
        sp_tv_emptyDelegate?.didAppear(emptyView: self)
        emptyView_tv?.removeFromSuperview()
        emptyView_tv = nil
        isScrollEnabled = true
        sp_tv_emptyDelegate?.didDisappear(emptyView: self)
    }
    
    /// 是否可以显示
    ///
    /// - Returns:
    func sp_tv_canDispaly() -> Bool {
        guard let _ = sp_tv_emptyDataSource else {
            return false
        }
        return true
    }
    
    @objc func sp_tv_didTapDataButton(_ sender: UIButton) {
        guard let sp_delegate = self.sp_tv_emptyDelegate else {
            return
        }
        sp_delegate.didTap(emptyView: self, button: sender)
    }
}
