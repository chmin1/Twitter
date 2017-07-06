//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var RTLabel: UILabel!
    
    @IBOutlet weak var favLabel: UILabel!
    
    @IBOutlet weak var RTButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            profileImage.af_setImage(withURL: URL(string: tweet.user.imageURL)!)
            
            authorLabel.text = tweet.user.name
            
            screenNameLabel.text = "@\(tweet.user.screenName)"
            
            tweetTextLabel.text = tweet.text
            
            timeStampLabel.text = tweet.createdAtString
            
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
        }
    }
    
    @IBAction func didTapFavorite(_ sender: Any) {
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
    
    
    @IBAction func didTapRT(_ sender: Any) {
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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
