//
//  ViewController.swift
//  AHFMSearchVC
//
//  Created by ivsall2012 on 09/06/2017.
//  Copyright (c) 2017 ivsall2012. All rights reserved.
//

import UIKit
import AHServiceRouter
import AHFMKeywordVCManager
import AHFMBottomPlayerManager
import AHFMSearchVCManager
import AHFMSearchVCService
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        AHFMKeywordVCManager.activate()
        AHFMBottomPlayerManager.activate()
        AHFMSearchVCManager.activate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let data = AHServiceRouter.doTask(AHFMSearchVCService.service, taskName: AHFMSearchVCService.taskCreateVC, userInfo: [:], completion: nil) else {
            return
        }
        
        guard let vc = data[AHFMSearchVCService.keyGetVC] as? UIViewController else {
            return
        }
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

