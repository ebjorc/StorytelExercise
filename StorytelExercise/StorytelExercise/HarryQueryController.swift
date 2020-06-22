//
//  ViewController.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-05-30.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit
import SDWebImage

private let headerIdentifier = "HarryQueryHeader"
private let cellIdentifier = "HarryQueryCell"
private let apiURL = "https://api.storytel.net/search?query=harry&page="

class HarryQueryViewController: UIViewController {
    
    var tableView = UITableView(frame: .zero, style: .grouped)
    var harryBooks: [BookModel] = []
    var harryBooksImages: [UIImage] = []
    var nextPageToken = "10"
    var totalHarryBooks = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        overrideUserInterfaceStyle = .light
        
        // fetch the 10 first books
        fetch()
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        
        // set delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        // set row heights
        tableView.rowHeight = 120
        
        // register cells
        tableView.register(HarryBookCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // register header
        tableView.register(HarryQueryHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        
        // set constraints
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func fetchBooks(apiURL: String, completion: @escaping (Result<BookModelQuery, Error>) -> ()){
        if let url = URL(string: apiURL){
            URLSession.shared.dataTask(with: url) {data, response, err in
                if let err = err{
                    completion(.failure(err))
                    // return
                }
                if let data = data {
                    do {
                        let bookModelQuery = try JSONDecoder().decode(BookModelQuery.self, from: data)
                        completion(.success(bookModelQuery))
                    }
                    catch let jsonErr {
                        completion(.failure(jsonErr))
                    }
                }
            }.resume()
        }
    }
    
    func fetch(){
        fetchBooks(apiURL: apiURL + nextPageToken) { (res) in
            switch res {
            case .success(let bookModelQuery):
                self.harryBooks += bookModelQuery.items
                self.nextPageToken = bookModelQuery.nextPageToken
                print(self.nextPageToken)
                self.totalHarryBooks = bookModelQuery.totalCount
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err):
                print("Error:", err)
            }
        }
    }
}

extension HarryQueryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        harryBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! HarryBookCell
        cell.bookTitle = harryBooks[indexPath.row].title
        cell.authors = harryBooks[indexPath.row].authors
        cell.narrators = harryBooks[indexPath.row].narrators
        cell.bookImageView.sd_setImage(with: URL(string: harryBooks[indexPath.row].cover.url), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
        
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   headerIdentifier) as! HarryQueryHeader
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == harryBooks.count - 1 {
            // Load more
            if harryBooks.count < totalHarryBooks {
                let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
                spinner.startAnimating()
                tableView.tableFooterView = spinner
                tableView.tableFooterView?.isHidden = false
                fetch()
            }
        }
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
       
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom!).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight!).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
