//
//  NewsCell.swift
//  NewsApp
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    // MARK: - Properties
    var articleToDisplay: Article? {
        didSet {
            newsImageView.image = nil
            newsLabel.text = ""
            newsImageView.alpha = 0
            newsLabel.alpha = 0
            configureCell()
        }
    }
    
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        anchorElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper
    func anchorElements() {
        addSubview(newsLabel)
        newsLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10)
        newsLabel.setDimensions(width: widthAnchor, wMultiplier: 0.60)
        
        addSubview(newsImageView)
        newsImageView.anchor(top: topAnchor, left: newsLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 10)
    }
    
    func configureCell() {
        guard let article = articleToDisplay else { return }
        newsLabel.text = article.title
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.newsLabel.alpha = 1
        }, completion: nil)
        
        guard article.urlToImage != nil else { return }
        let urlString = article.urlToImage!
        
        if let imageData = CacheManager.retrieveData(urlString) {
            newsImageView.image = UIImage(data: imageData)
            
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                self.newsImageView.alpha = 1
            }, completion: nil)
            
            return
        }
        
        if let url = URL(string: urlString) {
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil && data != nil {
                    
                    CacheManager.saveData(urlString, data!)
                    
                    if self.articleToDisplay!.urlToImage == urlString {
                        
                        DispatchQueue.main.async {
                            self.newsImageView.image = UIImage(data: data!)
                            
                            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                                self.newsImageView.alpha = 1
                            }, completion: nil)
                        }
                        
                    }
                    
                }
                
            }
            
            dataTask.resume()
            
        }
    }
}
