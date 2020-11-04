//
//  ListProvider.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/03.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

protocol ListProviderDelegate: class {
    
    func didStartLoading()
    
    func didFinishLoading(_ isEmpty: Bool)
}

final class ListProvider {
    
    weak var delegate: ListProviderDelegate?
    
    init(configuration: ListProvierConfiguration) {
        self.tableView = configuration.tableView
        self.service = configuration.service
        self.tableView.dataSource = dataSource
    }
    
    func fetch() {
        self._isLoading = true
        delegate?.didStartLoading()
        service.reload(page) { [weak self] (sections) in
            self?.sections = sections
            DispatchQueue.main.async {
                self?._isLoading = false
                self?.delegate?.didFinishLoading(sections.count == 0 ? true : false)
            }
        } failure: { (error) in
            Logger.debug(error.localizedDescription)
        }
    }
    
    func willDisplay(forRowAt indexPath: IndexPath) {
        if indexPath.section == sections.count-1,
           indexPath.row == (sections[safe: indexPath.section]?.restaurants.count ?? 0)-1,
           _isLoading == false {
            if self.page < 3 { self.page+=1 } else { return }
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.8) {
                self.fetch()
            }
        }
    }
    
    func viewForHeader(section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 50))
        
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = self.sections[safe: section]?.sectionType.rawValue
        view.addSubview(label)
        view.backgroundColor = .white
        return view
    }
    
    private var sections: [RestaurantGroup] = [] {
        didSet {
            dataSource.sections = sections
        }
    }
    
    private var sectionHeaders: [SectionType] = []
    private var page: Int = 1
    private var service: Service!
    private var tableView: UITableView!
    private var _isLoading: Bool = false
    
    private lazy var dataSource = ListDataSource()
}
