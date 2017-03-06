//
//  ViewController.swift
//  ZXMCustomFont
//
//  Created by com.googosoft on 2017/3/6.
//  Copyright © 2017年 googosoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fontL: UILabel!
    @IBOutlet weak var changeFontBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func changeFontAction(_ sender: UIButton) {
        fontIndex = (fontIndex + 1) % 3;
        tableView.reloadData()
    }
    
    var data  = [ "《生活不止眼前的苟且》",
    "妈妈坐在门前，哼着花儿与少年",
    "虽已时隔多年，记得她泪水涟涟",
    "那些幽暗的时光，那些坚持与慌张",
    "在临别的门前，妈妈望着我说",
    "生活不止眼前的苟且，还有诗和远方的田野",
    "你赤手空拳来到人世间，为找到那片海不顾一切",
    "                                                         --- 许巍"]
    
    let  fontNames = ["Copperplate-Bold", "Copperplate","Copperplate-Light"]
    
    var fontIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50;
    
        //便利電腦字體
        for family in UIFont.familyNames{
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont.init(name: fontNames[fontIndex], size: 16)
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    

}

