//
//  CustomeViewForBottom.swift
//  chatAPP2
//
//  Created by arshad on 6/2/22.
//

import UIKit

class CustomeViewForBottom: UIView {

    @IBOutlet weak var bcViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var backGroundView: UIView!{
        didSet{
            self.backGroundView.layer.cornerRadius = 20
            self.backGroundView.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
            self.backGroundView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var messageTextView: UITextView!{
        didSet{
            self.messageTextView.text = "Please enter your message"
            self.messageTextView.textColor = UIColor.lightGray
        }
    }
    @IBOutlet weak var senderButton: UIButton!{
        didSet{
            self.senderButton.layer.cornerRadius = self.senderButton.frame.width * 0.5
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commit()
    }
    
    func commit(){
        let view = Bundle.main.loadNibNamed("CustomeViewForBottom", owner: self, options: nil)![0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
}
