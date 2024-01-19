//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = "⚡️FlashChat"
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil) , forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages () {
       
        tableView.reloadData()
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapShot, error) in
            if let error = error {
                print(error)
            } else {
                if let documents = querySnapShot?.documents{
                    self.messages = []

                    for doc in documents {
                        let data = doc.data()
                        if let sender = data[K.FStore.senderField] as? String, let message = data[K.FStore.bodyField] as? String {
                            let msg = Message(sender: sender, body: message)
                            self.messages.append(msg)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
        
    @IBAction func sendPressed(_ sender: UIButton) {
        if let sender = Auth.auth().currentUser?.email, let message = messageTextfield.text {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: sender,                                K.FStore.bodyField: message,
                K.FStore.dateField: Date().timeIntervalSince1970], completion:  { (error) in
                if let e = error {
                    print(e)
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                    
                    print("Saved daata")
                }
            })
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

//MARK: - Table view
extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath ) as! MessageCell
        let message = messages[indexPath.row]
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
            cell.label.text = message.body
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.text = message.body
        }
        
        return cell
    }
}


