//
//  FacebookLoginServices.swift
//  myFit
//
//  Created by Winston Maragh on 9/18/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import SwiftyJSON
import FBSDKLoginKit


class FacebookLoginService {
    private init() {}
    static let shared = FacebookLoginService()
    
    public class func getFBUserData(completion: @escaping () -> Void) {
        
        if FBSDKAccessToken.current() != nil {
            let request = FBSDKGraphRequest(graphPath: "me", parameters: ["Field" :
                "name, email, picture.type(normal) "])!
            request.start(completionHandler: { (connection, result, error) in
                if error == nil {
                    let json = JSON(result!)
                    completion()
                }
            })
        }
    }
}
