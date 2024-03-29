//
//  fukubukuroViewController.swift
//  houchi
//
//  Created by 橋目　那桜 on 2021/01/15.
//  Copyright © 2021 橋目　那桜. All rights reserved.
//

import UIKit
import SCLAlertView
class fukubukuroViewController: UIViewController {
    @IBOutlet var one: UIButton!
    @IBOutlet var eleven: UIButton!
    @IBOutlet var kingaku: UILabel!
    @IBOutlet var fukubukuroButton2: UIButton!
    @IBOutlet var shopButton2: UIButton!
    @IBOutlet var kaihouButton2: UIButton!
    var shozikinn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shozikinn = Game.shared.user.shozikin
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ONE() {
        // 所持金を取り出す
        if shozikinn >  1500 {
            // 所持金から金額を引く
            shozikinn = shozikinn - 1500
            kingaku.text = "\(String(shozikinn))円"
            // 引いた金額を保存する
            
            performSegue(withIdentifier: "1", sender: nil)
            
        } else {
            SCLAlertView().showTitle(
                "お金が足りないよ",
                subTitle: "所持金を増やして福袋を買おう！", timeout: .none,
                completeText:"戻る",
                style: .info,
                colorStyle: 0xb0c4de,
                colorTextButton: 0x696969
            )
            
            
            
            
        }
        
    }
    
    @IBAction func ELEVEN() {
        if shozikinn >  15000 {
            shozikinn = shozikinn - 15000
		kingaku.text = "所持金額:  \(String(shozikinn))円"
            performSegue(withIdentifier: "11", sender: nil)
            
        } else {
            SCLAlertView().showTitle(
                "お金が足りないよ",
                subTitle: "所持金を増やして福袋を買おう！", timeout: .none,
                completeText:"戻る",
                style: .info,
                colorStyle: 0xb0c4de,
                colorTextButton: 0x696969
            )
            
            
            
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
    @IBAction func back1() {
        self.dismiss(animated: true, completion: nil)
    }
	
    @objc func closeMenu(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.fukubukuroButton2.center.x = -40
            self.shopButton2.center.x = -40
            self.kaihouButton2.center.x = -40
        }, completion: {_ in
        })
    }
    
    @objc func openMenu(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.fukubukuroButton2.center.x = 50
            self.shopButton2.center.x = 50
            self.kaihouButton2.center.x = 50
        }, completion: {_ in
        })
        
        
    }
}
