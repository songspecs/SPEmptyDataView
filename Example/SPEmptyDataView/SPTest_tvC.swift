//
//  SPTest_tv.swift
//  SPEmptyDataView_Example
//
//  Created by 宋璞 on 2019/4/20.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SPEmptyDataView

class SPTest_tvC: SPEmpty_tvC {
    
    @IBOutlet var test_tv: UITableView!
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
        test_tv.sp_tv_emptyDataSource = self
        test_tv.sp_tv_emptyDelegate = self
        test_tv.tableFooterView = UIView()
    }
}


// MARK: UITableViewDelegate
extension SPTest_tvC :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "tcellid", for: indexPath)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /*
     // fixed font style. use custom view (UILabel) if you want something different
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
     
     }
     func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
     
     }
     */
    
}
// MARK: UITableViewDelegate
extension SPTest_tvC: UITableViewDelegate {
    /// 点击行事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0
    }
    ///自定义view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        return nil
    }
    
}

extension SPTest_tvC:SPEmptyDataSource{
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
