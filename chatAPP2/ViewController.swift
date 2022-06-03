//
//  ViewController.swift
//  chatAPP2
//
//  Created by arshad on 5/30/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveChatScreen(_ sender: UIButton) {
        
        //let vc = UIViewController(nibName: "ChatLog", bundle: nil)
        let vc = ChatLog.loadFromNib()
        vc.title = "Chat Room Name Here"
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

