//
//  ListProviderConfiguration.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/04.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

struct ListProvierConfiguration {
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    var tableView: UITableView?
    var service: Service!
    
    var rowHeight: CGFloat {
        get {
            return tableView?.rowHeight ?? 0
        }
        set {
            tableView?.rowHeight = newValue
        }
    }
    
    var estimatedRowHeight: CGFloat {
        get {
            return tableView?.estimatedRowHeight ?? 0
        }
        set {
            tableView?.estimatedRowHeight = newValue
        }
    }
}
