//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Sweda Thiyagarajan on 18/12/2022.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
        
        setup()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM?.noOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM?.noOfRows(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleVM = self.articleListVM?.articleAtIndex(index: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("no article found")
        }
        
        cell.titleLabel?.text = articleVM?.title
        cell.descriptionLabel?.text = articleVM?.description
        return cell
    }
}

extension NewsListTableViewController {
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c523095f85f74916b466da42d5b66a9a")
        if let url = url {
            WebServices().getArticles(url: url) { articles  in
                if let articles = articles {
                    self.articleListVM = ArticleListModel(articleList: articles)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }

        }
    }

}
