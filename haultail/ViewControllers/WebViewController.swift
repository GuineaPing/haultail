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
    @IBOutlet weak var labelStamp: UILabel!
    
    var textDate: String = ""
    var textTitle: String = ""
    var imageUrl: String = ""
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.initSwipe()
        initContent()
    }
    
    // MARK: - init
    
    func initContent() {
        self.title = Settings.title
        self.labelStamp.text = Settings.stamp
        let htmlImage = "<p style=\"text-align: center;\"><img src=\(imageUrl)></p>"
        let htmlZoom = "<meta name=\"viewport\" content=\"width=device-width, shrink-to-fit=YES\"> "
        let htmlDate = "<h3><span style=\"font-weight: 200;color: #333333;\">\(textDate)</span></h3>\r\n"
        let htmlTitle = "<h2><span style=\"font-weight: 400;\"><b>\(textTitle)</b></span></h1>\r\n"
        let html = "<div style=\"margin-left:8%;margin-top:15px;margin-right:8%;\">" + htmlImage + htmlDate + htmlTitle + htmlZoom + content + "</div>"
        webView.loadHTMLString(html, baseURL: nil)
    }

}

 
