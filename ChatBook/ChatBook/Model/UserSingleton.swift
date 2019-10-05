//
//  File.swift
//  ChatBook
//
//  Created by Hakan Albay on 5.10.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var kullanıcıadı = ""
    
    private init(){
        
    }
    
    
}
