//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chavane Minto on 7/6/17.
//  Copyright © 2017 Chavane Minto. All rights reserved.
//

import UIKit
import AlamofireImage

protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {
    
    
    weak var delegate: ComposeViewControllerDelegate?

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var screenName: UILabel!
    
    @IBOutlet weak var tweetField: UITextView!
    
    let user = User.current!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.af_setImage(withURL: URL(string: user.imageURL)!)
        
        authorLabel.text = user.name
        
        screenName.text = user.screenName
    }

    @IBAction func onCancel(_ sender: Any) {
        
        tweetField = nil
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetField.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)
            }
        }
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
