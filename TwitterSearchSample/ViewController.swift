//
//  ViewController.swift
//  TwitterSearchSample
//
//  Created by Admin on 15/02/2017.
//  Copyright © 2017 Tel-Ran. All rights reserved.
//

import UIKit
import TwitterSearch

class ViewController: UIViewController {
    
    @IBOutlet weak var searchString: UITextField!
    
    @IBAction func showButton(_ sender: Any) {
        guard searchString.text != nil && searchString.text?.trimmingCharacters(in: .whitespaces) != "" else {
            let alert = UIAlertController(title: "Error", message: "You cant serch for an empty string", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel , handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        TwitterSearch.Api.getTweetsArray(searchPhrase: searchString.text!){status,tweetsArray,error in
            if status{
                self.performSegue(withIdentifier: "showTableView", sender: tweetsArray)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TweetsTableViewController
        vc.tweets = sender as! [String]!
    }

}

