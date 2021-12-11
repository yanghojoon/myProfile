//
//  LinkViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/11.
//

import UIKit
import SafariServices

class LinkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpGithubButton(_ sender: UIButton) {
        let githubURL = NSURL(string: "https://github.com/yanghojoon")
        let githubSafariView: SFSafariViewController = SFSafariViewController(url: githubURL! as URL)
        
        self.present(githubSafariView, animated: true, completion: nil)
    }
    
    @IBAction func touchUpBlogButton(_ sender: UIButton) {
        let blogURL = NSURL(string: "https://ho8487.tistory.com/")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogURL! as URL)
        
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
    @IBAction func touchUpLinkedInButton(_ sender: UIButton) {
        let lindedInURL = NSURL(string: "https://www.linkedin.com/in/%ED%98%B8%EC%A4%80-%EC%96%91-91890b213/")
        let lindedInSafariView: SFSafariViewController = SFSafariViewController(url: lindedInURL! as URL)
        
        self.present(lindedInSafariView, animated: true, completion: nil)
    }
}
