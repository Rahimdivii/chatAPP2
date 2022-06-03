//
//  ChatSMSCell.swift
//  chatAPP2
//
//  Created by arshad on 6/2/22.
//

import UIKit

class ChatSMSCell: UITableViewCell {
    
    static let chatSMSCellID = "ChatSMSCell"
    static let chatSMSCellNib = UINib(nibName: "ChatSMSCell", bundle: nil)
    
    @IBOutlet weak var messageTextLabel:PadddingLabel!{
        didSet{
            self.messageTextLabel.layer.cornerRadius = 20
           // self.messageTextLabel.roundCorners([.topLeft,.topRight], radius: 15)
            self.messageTextLabel.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var MessageTimeLabel:UILabel!
    @IBOutlet weak var senderImage:UIImageView!{
        didSet{
            self.senderImage.layer.cornerRadius = self.senderImage.frame.width * 0.5
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
