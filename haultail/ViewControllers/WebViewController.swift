//
//  WebViewController.swift
//  haultail
//
//  Created by Eugene Lysenko on 04.08.2021.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var titleText: String = ""
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.initSwipe()
        initContent()
    }
    
    // MARK: - init
    
    func initContent() {
        webView.loadHTMLString("<meta name=\"viewport\" content=\"width=device-width, shrink-to-fit=YES\"> " + content, baseURL: nil)
    }

}
