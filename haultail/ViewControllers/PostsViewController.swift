//
//  ViewController.swift
//  haultail
//
//  Created by Eugene Lysenko on 04.08.2021.
//

import UIKit
import Alamofire

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var activityIndicator: UIActivityIndicatorView!
    
    var data: [PostDisplayable] = []
    var currentIndex: Int = 0
    var currentStart: Int = 0
    var step: Int = Settings.postStep
    var isLoading: Bool = false
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initControls()
    }
    
    // MARK: - init
    
    func initControls() {
        self.title = Settings.title
        loadData()
    }
    
    // MARK: - load indicator
    
    func showIndicator() {
        
        activityIndicator = UIActivityIndicatorView(frame:CGRect(x: 100, y: 100, width: 100, height: 100)) as UIActivityIndicatorView
        self.activityIndicator.style = UIActivityIndicatorView.Style.large
        self.activityIndicator.center = self.view.center;
        self.navigationController?.view.addSubview(activityIndicator)
        self.tableView?.bringSubviewToFront(activityIndicator)
        self.activityIndicator.startAnimating();
    }
    
    func hideIndicator() {
        activityIndicator.removeFromSuperview();
    }
    
    // MARK: - data
    
    func posts(completionHandler: @escaping([Post]) -> Void) {
        let url = "\(Settings.baseUrl)/posts/\(step)/\(currentStart)"
        // print("T ' \(step) \(currentStart)")
        AF.request(url, method: .get, encoding:  URLEncoding.queryString).validate()
            .responseDecodable(of: [Post].self) { response in
                guard let posts = response.value else { return }
                completionHandler(posts)
            }
    }
    
    func loadData() {
        if(isLoading) {
            return
        }
        showIndicator()
        isLoading = true
        posts() { posts in
            if (self.currentStart == 0) {
                self.data = posts
            } else {
                self.data.append(contentsOf: posts)
            }
            self.tableView.reloadData()
            self.hideIndicator()
            self.isLoading = false
        }
    }
    
    func loadMoreData() {
        if (isLoading) {
            return
        }
        if (currentStart  >= data.count) {
            return
        }
        currentStart += step
        loadData()
    }

}

// MARK: - table data source
extension PostsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "cellPostItem", for: indexPath) as! PostTableViewCell
        let item = data[indexPath.row]
        cell.labelTitle.text = item.labelTitle
        cell.labelDate.text = item.labelDate
        cell.oddCell(odd: indexPath.row % 2 == 0)
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showBrowser") {
            let item: PostDisplayable = data[selectedRow]
            guard let vc = segue.destination as? WebViewController else {
              return
            }
            vc.titleText = item.labelTitle
            vc.content = item.labelContent
        }
    }
    
}

// MARK: - table delegate

extension PostsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedRow = indexPath.row
        return indexPath
    }
    
}

// MARK: - load more data on scroll

extension PostsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (data.count == 0) {
            return
        }
        let visibleRows: Array = tableView.indexPathsForVisibleRows!
        var maxRow: Int = 0;
        for indexPath:IndexPath in visibleRows {
            if (indexPath.row > maxRow) {
                maxRow = indexPath.row
            }
        }
        currentIndex = min(maxRow + 1, data.count)
        if (maxRow >= data.count - step) {
            loadMoreData()
        }
        
    }
}