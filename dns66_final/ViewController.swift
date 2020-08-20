//
//  ViewController.swift
//  dns66_final
//
//  Created by Deanna Schaeffer on 5/5/20.
//  Copyright © 2020 Deanna Schaeffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    var tableView = UITableView()
    let articleCellIdentifier = "ArticleCell"
    let cellHeight: CGFloat = 50
    var searchController: UISearchController!
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Articles"

        view.addSubview(tableView)
            
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: articleCellIdentifier)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
            
        searchController.dimsBackgroundDuringPresentation = false
            
        searchController.searchBar.placeholder = "Search by Keyword"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
            
        definesPresentationContext = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleCellIdentifier, for: indexPath) as! ArticleTableViewCell
        
        cell.headlineLabel.text = articles[indexPath.row].headline.print_headline
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let vc = DetailViewController(article: article, num: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                NetworkManager.getArticle(fromHeadline: searchText) { (articles) in
                    self.articles = articles
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            else {
                self.articles = []
                self.tableView.reloadData()
            }
        }
    }
    
}

