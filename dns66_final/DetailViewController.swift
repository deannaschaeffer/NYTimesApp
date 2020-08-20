//
//  DetailViewController.swift
//  dns66_final
//
//  Created by Deanna Schaeffer on 5/6/20.
//  Copyright © 2020 Deanna Schaeffer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var article: Article?
    var num: Int?
    
    var headline: UILabel!
    var snippet: UITextView!
    var link: UITextView!
    var image: UIImageView!
    
    init(article: Article?, num: Int?) {
        super.init(nibName: nil, bundle: nil)
        
        self.article = article
        self.num = num
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
        headline = UILabel()
        headline.translatesAutoresizingMaskIntoConstraints = false
        headline.text = article!.headline.print_headline
        headline.textAlignment = .center
        headline.font = UIFont.boldSystemFont(ofSize: 18)
        headline.lineBreakMode = .byWordWrapping
        headline.numberOfLines = 0
        view.addSubview(headline)
        
        snippet = UITextView()
        snippet.translatesAutoresizingMaskIntoConstraints = false
        snippet.text = article!.snippet
        snippet.isEditable = false
        snippet.textAlignment = .center
        snippet.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(snippet)
        
        link = UITextView()
        link.translatesAutoresizingMaskIntoConstraints = false
        link.text = article!.web_url
        link.textAlignment = .center
        link.isEditable = false
        link.dataDetectorTypes = UIDataDetectorTypes.all
        link.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(link)
        
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        if article!.multimedia.count > 0 {
            let imageurl = "http://static01.nyt.com/" + article!.multimedia[0].url
            NetworkManager.getImage(imageURL: imageurl) { image in
                DispatchQueue.main.async {
                    self.image.image = image
                }
            }
        }
        view.addSubview(image)
        
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headline.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15), headline.centerXAnchor.constraint(equalTo: view.centerXAnchor), headline.heightAnchor.constraint(equalToConstant: 50), headline.widthAnchor.constraint(equalToConstant: 350)
        ])
            
        NSLayoutConstraint.activate([
            snippet.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 15), snippet.centerXAnchor.constraint(equalTo: view.centerXAnchor), snippet.heightAnchor.constraint(equalToConstant: 150), snippet.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: snippet.bottomAnchor, constant: 15), image.centerXAnchor.constraint(equalTo: view.centerXAnchor), image.heightAnchor.constraint(equalToConstant: 200), image.widthAnchor.constraint(equalToConstant: 300)
        ])
            
        NSLayoutConstraint.activate([
             link.centerXAnchor.constraint(equalTo: view.centerXAnchor), link.widthAnchor.constraint(equalToConstant: 350), link.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 15), link.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}
