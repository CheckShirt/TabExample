//
//  FirstViewController.swift
//  Coding-Test
//
//  Created by Masher Shin on 8/2/20.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNotification()
        configureProvider()
        
        provider.fetch()
    }
    
    private func configureTableView() {
        tableView.register(for: RestaurantCell.self)
        tableView.delegate = self
    }
    
    private func configureNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(load),
                                               name: .removeFavorite,
                                               object: nil)
    }
    
    private func configureProvider() {
        var configuration = ListProvierConfiguration(tableView: tableView)
        configuration.rowHeight = UITableView.automaticDimension
        configuration.service = ListService()
        provider = ListProvider(configuration: configuration)
        provider.delegate = self
    }        
    
    @objc
    private func load() {
        tableView.reloadData()
    }
    
    private var provider: ListProvider!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
}

extension FirstViewController: ListProviderDelegate {
    
    func didStartLoading() {
        DispatchQueue.main.async {
            self.activityIndicatorView.isHidden = false
            self.activityIndicatorView.startAnimating()
        }
    }
    
    func didFinishLoading(_ isEmpty: Bool) {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension FirstViewController: UITableViewDelegate {
    
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
