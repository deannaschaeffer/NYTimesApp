//
//  ArticleTableViewCell.swift
//  dns66_final
//
//  Created by Deanna Schaeffer on 5/6/20.
//  Copyright © 2020 Deanna Schaeffer. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    let headlineLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { 
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        headlineLabel.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(headlineLabel)
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headlineLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        headlineLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        headlineLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        headlineLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
