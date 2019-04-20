//
//  SPEmptyDataSource.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/19.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit

/// 空数据代理
public protocol SPEmptyDataSource: class {
    
    /// 配置空数据时显示的副标题（描述）
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 副标题（描述）
    func description(emptyView scrollView: UIScrollView) -> NSAttributedString?

    /// 配置空数据时显示的图片
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 图片
    func image(emptyView scrollView: UIScrollView) -> UIImage?
    
    /// 配置空数据时显示的按钮的标题
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - state: 按钮状态
    /// - Returns: 按钮标题
    func buttonTitle(emptyView scrollView: UIScrollView, state: UIControl.State) -> NSAttributedString?
    
    /// 配置空数据时显示的按钮图片
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - state: 按钮状态
    /// - Returns: 按钮图片
    func buttonImage(emptyView scrollView: UIScrollView, state: UIControl.State) -> UIImage?
    
    /// 配置空数据时显示的按钮背景图片
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - state: 按钮状态
    /// - Returns: 按钮背景图片
    func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControl.State) -> UIImage?
    
    /// 配置空数据时显示背景颜色
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 配置空数据时显示背景颜色
    func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor?
    
    /// 配置空数据时显示的视图的垂直偏移量
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 空数据时显示的视图的偏移量
    func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat
}

extension SPEmptyDataSource {
    
    /// 配置空数据时显示的副标题（描述）
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 副标题（描述）
    func description(emptyView scrollView: UIScrollView) -> NSAttributedString? { return nil }
    
    /// 配置空数据时显示的图片
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 图片
    func image(emptyView scrollView: UIScrollView) -> UIImage? { return nil }
    
    /// 配置空数据时显示的按钮的标题
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - state: 按钮状态
    /// - Returns: 按钮标题
    func buttonTitle(emptyView scrollView: UIScrollView, state: UIControl.State) -> NSAttributedString? { return nil }
    
    /// 配置空数据时显示的按钮图片
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - state: 按钮状态
    /// - Returns: 按钮图片
    func buttonImage(emptyView scrollView: UIScrollView, state: UIControl.State) -> UIImage? { return nil }
    
    /// 配置空数据时显示的按钮背景图片
    ///
    /// - Parameters:
    ///   - scrollView: 目标视图
    ///   - state: 按钮状态
    /// - Returns: 按钮背景图片
    func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControl.State) -> UIImage? { return nil }
    
    /// 配置空数据时显示背景颜色
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 配置空数据时显示背景颜色
    func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor? { return nil }
    
    /// 配置空数据时显示的视图的垂直偏移量
    ///
    /// - Parameter scrollView: 目标视图
    /// - Returns: 空数据时显示的视图的偏移量
    func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat { return 0 }
}
