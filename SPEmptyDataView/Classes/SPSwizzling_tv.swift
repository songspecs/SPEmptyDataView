//
//  SPSPSwizzling_tv.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/20.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit
import SnapKit

internal struct Static_tv{
    static var isSwizzleEndUpdates_tv = false
    static var isSwizzleReloadData_tv = false
}

internal extension UITableView {
    
    func swizzleReloadData_tv() {
        if Static_tv.isSwizzleEndUpdates_tv {
            return
        }
        SPSwizzleMethod.swizzleMethod(self.classForCoder, originalSelector: #selector(UITableView.reloadData), swizzledSelector: #selector(UITableView.sp_tv_reloadData))
    }
    
    @objc func sp_tv_reloadData() {
        sp_tv_reloadData()
        sp_tv_reloadEmptyDataSet()
    }
    
    func sp_tv_reloadEmptyDataSet() {
        guard sp_tv_canDispaly() else {
            return
        }
        if (sp_tv_emptyDelegate?.shouldDisplay(emptyView: self) ?? true && sp_tv_itemsCount == 0) ||
            sp_tv_emptyDelegate?.shouldBeForcedToDisplay(emptyView: self) ?? false {
            
            sp_tv_emptyDelegate?.willAppear(emptyView: self)
            
            guard let view = emptyView_tv else {
                return
            }
            if view.superview == nil {
                
                if self.subviews.count > 1 {
                    insertSubview(view, at: 0)
                } else {
                    addSubview(view)
                }
            }
            view.snp.makeConstraints({ (make) in
                make.width.equalToSuperview()
                make.height.equalToSuperview()
                make.center.equalToSuperview()
            })
            view.desc_Lb.attributedText = sp_tv_emptyDataSource?.description(emptyView: self)
            view.logo_ImgV.image = sp_tv_emptyDataSource?.image(emptyView: self)
            if let verticalOffset = sp_tv_emptyDataSource?.verticalOffset(emptyView: self), verticalOffset > 0{
                view.verticalOffset = verticalOffset
            }
            if let buttonTitle = sp_tv_emptyDataSource?.buttonTitle(emptyView: self, state: .normal) {
                view.reload_Btn.setAttributedTitle(buttonTitle, for: .normal)
                view.reload_Btn.setAttributedTitle(sp_tv_emptyDataSource?.buttonTitle(emptyView: self, state: .highlighted), for: .highlighted)
                view.reload_Btn.setBackgroundImage(sp_tv_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .normal), for: .normal)
                view.reload_Btn.setBackgroundImage(sp_tv_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .highlighted), for: .highlighted)
                view.reload_Btn.isHidden = false
            }else{
                view.reload_Btn.isHidden = true
            }
            view.backgroundColor = sp_tv_emptyDataSource?.backgroundColor(emptyView: self)
            view.isHidden = false
            view.clipsToBounds = false
            // 配置可被点击
            view.isUserInteractionEnabled = sp_tv_emptyDelegate?.shouldAllowTouch(emptyView: self) ?? true
            UIView.performWithoutAnimation {
                view.layoutIfNeeded()
            }
            isScrollEnabled = sp_tv_emptyDelegate?.shouldAllowScroll(emptyView: self) ?? true
            sp_tv_emptyDelegate?.didAppear(emptyView: self)
            
        } else if emptyView_tv?.isHidden ?? false {
            sp_tv_invalidate()
        }else{
            emptyView_tv?.isHidden = true
        }
    }
}
