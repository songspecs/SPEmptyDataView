//
//  SPEmpty_cvC.swift
//  SPEmptyDataView_Example
//
//  Created by 宋璞 on 2019/4/21.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SPEmptyDataView

open class SPEmpty_cvC: UIViewController {
    ///是否要显示空列表界面
    public var showEmptyView:Bool = false
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
extension SPEmpty_cvC :SPEmptyDelegate{
    /**
     配置是否允许显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否显示
     - true 显示 (default)
     - false 不显示
     
     */
    open func shouldDisplay(emptyView scrollView: UIScrollView) -> Bool{
        return self.showEmptyView
    }
    open func didTap(emptyView scrollView: UIScrollView, button: UIButton){
        
    }
}

