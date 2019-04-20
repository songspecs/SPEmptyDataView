//
//  SPSwizzling_cv.swift
//  SPEmptyDataView
//
//  Created by 宋璞 on 2019/4/20.
//  Copyright © 2019 宋璞. All rights reserved.
//

import UIKit

internal struct Static_cv {
    static var isSwizzleEndUpdates_cv = false
    static var isSwizzleReloadData_cv = false
}

internal extension UICollectionView {
    func  swizzleReloadData_cv(){
        if Static_cv.isSwizzleEndUpdates_cv {
            return
        }
        SPSwizzleMethod.swizzleMethod(self.classForCoder, originalSelector: #selector(UICollectionView.reloadData), swizzledSelector: #selector(UICollectionView.sp_cv_reloadData))
    }
    
    @objc func sp_cv_reloadData() {
        sp_cv_reloadData()
        sp_cv_reloadEmptyDataSet()
    }
    
    func sp_cv_reloadEmptyDataSet() {
        guard sp_cv_canDispaly() else {
            return
        }
        if (sp_cv_emptyDelegate?.shouldDisplay(emptyView: self) ?? true && sp_cv_itemCount == 0) ||
            sp_cv_emptyDelegate?.shouldBeForcedToDisplay(emptyView: self) ?? false {
            
            sp_cv_emptyDelegate?.willAppear(emptyView: self)
            
            guard let view = emptyView_cv else {
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
            view.desc_Lb.attributedText = sp_cv_emptyDataSource?.description(emptyView: self)
            view.logo_ImgV.image = sp_cv_emptyDataSource?.image(emptyView: self)
            if let verticalOffset = sp_cv_emptyDataSource?.verticalOffset(emptyView: self), verticalOffset > 0{
                view.verticalOffset = verticalOffset
            }
            if let buttonTitle = sp_cv_emptyDataSource?.buttonTitle(emptyView: self, state: .normal) {
                view.reload_Btn.setAttributedTitle(buttonTitle, for: .normal)
                view.reload_Btn.setAttributedTitle(sp_cv_emptyDataSource?.buttonTitle(emptyView: self, state: .highlighted), for: .highlighted)
                view.reload_Btn.setBackgroundImage(sp_cv_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .normal), for: .normal)
                view.reload_Btn.setBackgroundImage(sp_cv_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .highlighted), for: .highlighted)
                view.reload_Btn.isHidden = false
            }else{
                view.reload_Btn.isHidden = true
            }
            view.backgroundColor = sp_cv_emptyDataSource?.backgroundColor(emptyView: self)
            view.isHidden = false
            view.clipsToBounds = false
            // 配置可被点击
            view.isUserInteractionEnabled = sp_cv_emptyDelegate?.shouldAllowTouch(emptyView: self) ?? true
            UIView.performWithoutAnimation {
                view.layoutIfNeeded()
            }
            isScrollEnabled = sp_cv_emptyDelegate?.shouldAllowScroll(emptyView: self) ?? true
            sp_cv_emptyDelegate?.didAppear(emptyView: self)
            
        } else if emptyView_cv?.isHidden ?? false {
            sp_cv_invalidate()
        }else{
            emptyView_cv?.isHidden = true
        }
    }
}
