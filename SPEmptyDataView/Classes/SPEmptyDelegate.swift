//
//  SPEmptyDelegate.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/19.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit

/// 空数据时代理
public protocol SPEmptyDelegate: class {

    /// 配置是否强制显示空视图
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: true-显示  false-不强制显示(default)
    func shouldBeForcedToDisplay(emptyView scrollView: UIScrollView) -> Bool
    
    /// 配置是否允许显示空视图
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: true 显示 (default)
    /// - Returns: false 不显示
    func shouldDisplay(emptyView scrollView: UIScrollView) -> Bool
    
    /// 配置空视图是否允许点击
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: true 允许 (default)
    /// - Returns: false 不允许
    func shouldAllowTouch(emptyView scrollView: UIScrollView) -> Bool
    
    /// 配置空视图时是否允许滚动
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: - true 允许 (default)  - false 不允许
    func shouldAllowScroll(emptyView scrollView: UIScrollView) -> Bool
    
    /// 配置空视图时按钮点击事件
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - button: 被点击的按钮
    func didTap(emptyView scrollView: UIScrollView, button: UIButton)
    
    /// 配置空视图将要显示的回调
    ///
    /// - Parameter scrollView: 目标视图
    func willAppear(emptyView scrollView: UIScrollView)
    
    /// 配置空视图显示后的回调
    ///
    /// - Parameter scrollView: 目标视图
    func didAppear(emptyView scrollView: UIScrollView)
    
    /// 配置空视图将要消失的回调
    ///
    /// - Parameter scrollView: 目标视图
    func willDisappear(emptyView scrollView: UIScrollView)
    
    /// 配置空视图消失后回调
    ///
    /// - Parameter scrollView: 目标视图
    func didDisappear(emptyView scrollView: UIScrollView)
}

// MARK: - 空数据代理
public extension SPEmptyDelegate {
    
    /// 配置是否强制显示空视图
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: true-显示  false-不强制显示(default)
    func shouldBeForcedToDisplay(emptyView scrollView: UIScrollView) -> Bool { return false}
    
    /// 配置是否允许显示空视图
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: true 显示 (default)
    /// - Returns: false 不显示
    func shouldDisplay(emptyView scrollView: UIScrollView) -> Bool { return true}
    
    /// 配置空视图是否允许点击
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: true 允许 (default)
    /// - Returns: false 不允许
    func shouldAllowTouch(emptyView scrollView: UIScrollView) -> Bool { return true}
    
    /// 配置空视图时是否允许滚动
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: - true 允许 (default)  - false 不允许
    func shouldAllowScroll(emptyView scrollView: UIScrollView) -> Bool { return true}
    
    /// 配置空视图时按钮点击事件
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - button: 被点击的按钮
    func didTap(emptyView scrollView: UIScrollView, button: UIButton) {}
    
    /// 配置空视图将要显示的回调
    ///
    /// - Parameter scrollView: 目标视图
    func willAppear(emptyView scrollView: UIScrollView) {}
    
    /// 配置空视图显示后的回调
    ///
    /// - Parameter scrollView: 目标视图
    func didAppear(emptyView scrollView: UIScrollView) {}
    
    /// 配置空视图将要消失的回调
    ///
    /// - Parameter scrollView: 目标视图
    func willDisappear(emptyView scrollView: UIScrollView) {}
    
    /// 配置空视图消失后回调
    ///
    /// - Parameter scrollView: 目标视图
    func didDisappear(emptyView scrollView: UIScrollView) {}
}
