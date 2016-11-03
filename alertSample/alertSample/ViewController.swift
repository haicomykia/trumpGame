//
//  ViewController.swift
//  alertSample
//
//  Created by 清水 凌 on 2016/10/27.
//  Copyright © 2016年 Ryo Shimizu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showUIAlertView(_ sender: AnyObject) {
        let normalAlert = UIAlertController(
            title: "AlertController",
            message: "New to iOS8",
            preferredStyle: .actionSheet
        );
        
        let defaultAction = UIAlertAction(
            title:"Understood!",
            style: .cancel,
            handler: nil
        );
        normalAlert.addAction(defaultAction);
        
        let actionTokyo = UIAlertAction(
            title: "東京",
            style: .default,
            handler: {
                action in self.returnSqure(num: 2);
            }
        );
        normalAlert.addAction(actionTokyo);
        
        let actionOsaka = UIAlertAction(
            title: "大阪",
            style: .default,
            handler:{
                action in self.returnSqure(num: 3);
            }

        );
        normalAlert.addAction(actionOsaka);
        
        let actionNagoya = UIAlertAction(
            title: "名古屋",
            style: .default,
            handler: {
                action in self.returnSqure(num: 5);
            }
        );
        normalAlert.addAction(actionNagoya);
        
        self.present(normalAlert, animated: true, completion: nil);
    }
    
    func returnSqure(num: Int){
        print(num * num);
    }
}

