//
//  WechatDemoListViewController.swift
//  WechatDemo
//
//  Created by chaoyang805 on 16/5/30.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class WechatDemoListViewController: RCConversationListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "最近联系"
        
        setDisplayConversationTypes([
            RCConversationType.ConversationType_APPSERVICE.rawValue,
            RCConversationType.ConversationType_PRIVATE.rawValue,
            RCConversationType.ConversationType_GROUP.rawValue,
            RCConversationType.ConversationType_SYSTEM.rawValue,
            RCConversationType.ConversationType_CHATROOM.rawValue,
            RCConversationType.ConversationType_DISCUSSION.rawValue,
            RCConversationType.ConversationType_PUSHSERVICE.rawValue,
            RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
            RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
            ])
        setCollectionConversationType([
            RCConversationType.ConversationType_GROUP.rawValue,
            RCConversationType.ConversationType_DISCUSSION.rawValue
            ])
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        self.hidesBottomBarWhenPushed = true
        setTabBarVisible(true, animated: true, completion: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        let chatViewController = RCConversationViewController(conversationType: model.conversationType, targetId: model.targetId)
        chatViewController.title = model.conversationTitle
        setTabBarVisible(false, animated: true, completion: nil)
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    override func willDisplayConversationTableCell(cell: RCConversationBaseCell!, atIndexPath indexPath: NSIndexPath!) {
        NSLog("cell's frame:\(cell.frame)")
    }

    
}
