//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chavane Minto on 7/6/17.
//  Copyright © 2017 Chavane Minto. All rights reserved.
//

import UIKit
import AlamofireImage

class ComposeViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var screenName: UILabel!
    
    @IBOutlet weak var tweetField: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.af_setImage(withURL: URL(string: user.imageURL)!)
        
        authorLabel.text = user.name
        
        screenName.text = user.screenName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
