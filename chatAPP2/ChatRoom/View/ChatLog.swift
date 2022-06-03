//
//  ChatLog.swift
//  chatAPP2
//
//  Created by arshad on 5/30/22.
//

import UIKit

class ChatLog: UITableViewController {
    
    var arraydata = [ChatModel]()
    let textViewMaxHeight: CGFloat = 100
    var customInputView = CustomeViewForBottom()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpMenu()
        self.setUpForTableView()
        customInputView.frame = CGRect(x: 0, y: view.frame.size.height - 100, width: view.frame.size.width, height: 100)
        self.tableView.keyboardDismissMode = .onDrag
        customInputView.senderButton.addTarget(self, action: #selector(sendText), for: .touchUpInside)
        customInputView.messageTextView.delegate = self
        customInputView.messageTextView.isScrollEnabled = false
        textViewDidChange(customInputView.messageTextView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    //handling keyBoard
    override var inputAccessoryView: UIView?{
        get{
            return customInputView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @objc func sendText(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        let dateString = dateFormatter.string(from: Date())
        arraydata.append(ChatModel(message: customInputView.messageTextView.text!, time: dateString))
       
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        customInputView.messageTextView.text = ""
    }
}
extension ChatLog{
    
    func setUpForTableView(){
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 55
        self.tableView.allowsSelection = false
        self.tableView.separatorStyle = .none
        self.tableView.contentInset.bottom
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:"id")
        //self.tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.messageCellIdentifier)
        self.tableView.register(ChatSMSCell.chatSMSCellNib, forCellReuseIdentifier: ChatSMSCell.chatSMSCellID)
    }

    func setUpMenu(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(named: "more"), primaryAction: nil, menu: UIMenu(title: "", image: nil, identifier: nil, options: .displayInline,children: [
            UIAction(title: "Member", handler: { _ in
                print("Leave Member")
            }),
            UIAction(title: "Leave Group", handler: { _ in
                print("Leave Group")
            })
        ]))
    }
}

extension ChatLog{
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraydata.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatSMSCell.chatSMSCellID, for: indexPath) as! ChatSMSCell
        cell.messageTextLabel.text = arraydata[indexPath.row].message
        cell.MessageTimeLabel.text = arraydata[indexPath.row].time
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension ChatLog: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: customInputView.messageTextView.frame.size.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        customInputView.messageTextView.constraints.forEach { constrains in
            constrains.firstAttribute == .height
            constrains.constant = estimatedSize.height
            customInputView.bcViewHeight.constant = estimatedSize.height
            if constrains.constant >= 80 {
                constrains.constant = 80.0
                customInputView.bcViewHeight.constant = 80
                textView.isScrollEnabled = true
            }else{
                textView.isScrollEnabled = false
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if customInputView.messageTextView.textColor == UIColor.lightGray {
            customInputView.messageTextView.text = nil
            customInputView.messageTextView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if customInputView.messageTextView.text.isEmpty {
            customInputView.messageTextView.text = "Please enter your message"
            customInputView.messageTextView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            customInputView.messageTextView.resignFirstResponder()
        }
        return true
    }
}
