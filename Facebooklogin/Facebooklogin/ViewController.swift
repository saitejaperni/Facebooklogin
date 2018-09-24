//
//  ViewController.swift
//  Facebooklogin
//
//  Created by Nevexa Digital on 20/09/18.
//  Copyright © 2018 pratice. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKShareKit
class ViewController: UIViewController {
    
    @IBOutlet weak var emailname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
            let loginButton = FBSDKLoginButton()
            // Optional: Place the button in the center of your view.
            loginButton.center = view.center
            view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
        /*if (FBSDKAccessToken.current() != nil) {
            // User is logged in, do work such as go to next view controller.
            print("already logged in")
        }*/
            NotificationCenter.default.addObserver(forName: NSNotification.Name.FBSDKAccessTokenDidChange, object: nil, queue: OperationQueue.main, using: { notification in
                if notification.userInfo?[FBSDKAccessTokenDidChangeUserID] != nil {
                    // Handle user change
                }
            })
            
           /* FBSDKProfile.loadCurrentProfile(completion: { profile, error in
                if profile != nil {
                    if let aName = profile?.firstName {
                        print("Hello, \(aName)!")
                    }
                }
            })*/
            FBSDKProfile.enableUpdates(onAccessTokenChange: true)
            NotificationCenter.default.addObserver(forName: NSNotification.Name.FBSDKProfileDidChange, object: nil, queue: OperationQueue.main, using: { notification in
                if (FBSDKProfile.current() != nil) {
                    // Update for new user profile
                }
            })
        // Extend the code sample from 6a. Add Facebook Login to Your Code
        // Add to your viewDidLoad method:
        loginButton.readPermissions = ["public_profile", "email"]
            let profilePictureView = FBSDKProfilePictureView()
        profilePictureView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        //profilePictureView.profileID = FBSDKAccessToken.current().userID()
        view.addSubview(profilePictureView)
        
    
        
        
            
            

}
}
