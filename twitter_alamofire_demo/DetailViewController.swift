//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chavane Minto on 7/7/17.
//  Copyright © 2017 Chavane Minto. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var RTLabel: UILabel!
    
    @IBOutlet weak var favLabel: UILabel!
    
    @IBOutlet weak var RTButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    var tweet: Tweet!


    override func viewDidLoad() {
        super.viewDidLoad()

        if let tweet = tweet {
            profileImage.af_setImage(withURL: URL(string: tweet.user.imageURL)!)
            
            authorLabel.text = tweet.user.name
            
            screenNameLabel.text = "@\(tweet.user.screenName)"
            
            tweetLabel.text = tweet.text
            
            timestampLabel.text = tweet.createdAtString
            
            if (tweet.retweetCount == 0)
            {
                RTLabel.text = " "
            } else {
                RTLabel.text = String(tweet.retweetCount)
            }
            
            if (tweet.favoriteCount == 0)
            {
                favLabel.text = " "
            } else {
                favLabel.text = String(tweet.favoriteCount)
            }
            
            if (tweet.retweeted == true)
            {
                RTButton.isSelected = true
            } else {
                RTButton.isSelected = false
            }
            
            if (tweet.favorited == true)
            {
                favButton.isSelected = true
            } else {
                favButton.isSelected = false
            }

        }
    }
    
    @IBAction func didFav(_ sender: Any) {
        if (favButton.isSelected != true) {
            
            favButton.isSelected = true
            tweet.favorited = true
            tweet.favoriteCount += 1
            self.favLabel.text = String(tweet.favoriteCount)
            
            //APIManager Request from Cell
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        } else if (favButton.isSelected == true) {
            favButton.isSelected = false
            tweet.favorited = false
            tweet.favoriteCount -= 1
            self.favLabel.text = String(tweet.favoriteCount)
            
            //APIManager Request from Cell
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    
    @IBAction func didRT(_ sender: Any) {
        if (RTButton.isSelected != true) {
            
            RTButton.isSelected = true
            tweet.retweeted = true
            tweet.retweetCount += 1
            self.RTLabel.text = String(tweet.retweetCount)
            
            //APIManager Request from Cell
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        } else if (RTButton.isSelected == true) {
            RTButton.isSelected = false
            tweet.retweeted = false
            tweet.retweetCount -= 1
            self.RTLabel.text = String(tweet.retweetCount)
            
            //APIManager Request from Cell
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
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
