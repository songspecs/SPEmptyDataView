//
//  SPTest_cv.swift
//  SPEmptyDataView_Example
//
//  Created by 宋璞 on 2019/4/20.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SPEmptyDataView

class SPTest_cvC: SPEmpty_cvC {

    @IBOutlet var test_cv: UICollectionView!
    /*----------------------------   自定义属性区域    ----------------------------*/
    
    
    /****************************Storyboard 绑定方法区域****************************/
    
    
    
    /**************************** 以下是方法区域 ****************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 一般情况下 再数据返回来之后再将其设置为true
        self.showEmptyView = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    /**
     界面基础设置
     */
    func setupUI() {
        test_cv.sp_cv_emptyDelegate = self
        test_cv.sp_cv_emptyDataSource = self
        
    }
   
}

// MARK: - UICollectionViewDataSource
extension SPTest_cvC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccellid", for: indexPath)
        cell.backgroundColor = UIColor.purple
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 0
    }
}
extension SPTest_cvC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
}

extension SPTest_cvC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: (self.view.frame.size.width - 40)/2, height: (self.view.frame.size.width - 40)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        return .zero
    }
}

extension SPTest_cvC:SPEmptyDataSource{
    /**
     配置空数据时显示的副标题（描述）
     
     - Parameter scrollView: 目标视图
     
     - Returns: 副标题（描述）
     
     */
    func description(emptyView scrollView: UIScrollView) -> NSAttributedString? {
        var attributes: [NSAttributedStringKey:Any] = [:]
        attributes[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 17)
        attributes[NSAttributedStringKey.foregroundColor] = UIColor.red
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        attributes[NSAttributedStringKey.paragraphStyle] = paragraph
        let attributedString =  NSMutableAttributedString(string: "商品列表数据为空啊", attributes: nil)
        let range = (attributedString.string as NSString).range(of: "列表数据")
        attributedString.addAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.6784313725, blue: 0.9450980392, alpha: 1)], range: range)
        return attributedString
    }
    
    /**
     配置空数据时显示的图片
     
     - Parameter scrollView: 目标视图
     
     - Returns: 图片
     
     */
    func image(emptyView scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "nonetwork")
        
    }
    
    /**
     配置空数据时显示的按钮的标题
     
     - Parameter scrollView: 目标视图
     - Parameter state: 按钮状态
     
     - Returns: 按钮标题
     
     */
    func buttonTitle(emptyView scrollView: UIScrollView, state: UIControlState) -> NSAttributedString? { return nil }
    
    /**
     配置空数据时显示的按钮图片
     
     - Parameters:
     - scrollView: 目标视图
     - state: 按钮状态
     
     - Returns: 按钮图片
     
     */
    func buttonImage(emptyView scrollView: UIScrollView, state: UIControlState) -> UIImage? { return nil }
    
    /**
     配置空数据时显示的按钮背景图片
     
     - Parameters:
     - scrollView: 目标视图
     - Parameter state: 按钮状态
     
     - Returns: 按钮背景图片
     
     */
    func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControlState) -> UIImage? { return nil }
    
    /**
     配置空数据时显示背景颜色
     
     - Parameter scrollView: 目标视图
     
     - Returns: 背景颜色
     
     */
    func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor? { return .white }
    
    /**
     配置空数据时显示的视图的垂直偏移量
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图的偏移量
     
     */
    func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat{
        return 0
    }
}



