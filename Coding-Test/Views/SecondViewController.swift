//
//  SecondViewController.swift
//  Coding-Test
//
//  Created by Masher Shin on 8/2/20.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var configuration = ListProvierConfiguration(tableView: tableView)
        configuration.rowHeight = UITableView.automaticDimension
        configuration.service = FavoriteService()
    
        
        provider = ListProvider(configuration: configuration)
        provider.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "찜"
        tableView.register(for: RestaurantCell.self)
        tableView.delegate = self
        load()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(load), name: .addFavorite, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(load), name: .removeFavorite, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
    }
    
    @objc
    func load() {
        provider.fetch()
    }
    
    private var provider: ListProvider!
}

extension SecondViewController: ListProviderDelegate {
    
    func didStartLoading() {
        
    }
    
    func didFinishLoading(_ isEmpty: Bool) {
        if isEmpty == true {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
            tableView.reloadData()
        }
    }
}

extension SecondViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return provider.viewForHeader(section: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        provider.willDisplay(forRowAt: indexPath)
    }
}

