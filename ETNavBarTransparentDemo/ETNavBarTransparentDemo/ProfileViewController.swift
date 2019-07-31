//
//  ProfileViewController.swift
//  ETNavBarTransparentDemo
//
//  Created by Bing on 2017/3/1.
//  Copyright © 2017年 tanyunbing. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navBarBgAlpha = 0
        self.navBarTintColor = .white
        
    }

    @IBAction func popWithCodeAction(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func popToRootAction(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        print(scrollView)
        
        let contentOffsetY = scrollView.contentOffset.y
        let showNavBarOffsetY = 200 - topLayoutGuide.length
        
        
        //navigationBar alpha
        if contentOffsetY > showNavBarOffsetY  {
            var navAlpha = (contentOffsetY - (showNavBarOffsetY)) / 40.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            if navAlpha > 0.8 {
                navBarTintColor = UIColor.defaultNavBarTintColor
                statusBarStyle = .default
                
            }else{
                navBarTintColor = UIColor.white
                statusBarStyle = .lightContent
            }
        }else{
            navBarBgAlpha = 0
            navBarTintColor = UIColor.white
            statusBarStyle = .lightContent
        }

    }
    
    
    
}
