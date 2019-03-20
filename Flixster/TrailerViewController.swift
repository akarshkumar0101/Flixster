//
//  TrailerViewController.swift
//  Flixster
//
//  Created by Akarsh Kumar on 3/19/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    
    @IBOutlet weak var webkitView: WKWebView!
    
    var movie: [String:Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        
        let movieID = movie["id"]!
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=\(apiKey)&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let data = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let results = data["results"] as! NSArray
                let result = results[0] as! [String: Any]
                let key = (result["key"] as! String!)
                
                let url = "https://www.youtube.com/watch?v=\(key!)"
                
                let myURL = URL(string: url)
                let myRequest = URLRequest(url: myURL!)
                self.webkitView.load(myRequest)
                
            }
        }
        task.resume()
        
        
        
        
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func backClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
