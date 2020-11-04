//
//  ListService.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/03.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//


class ListService: Service {
    
    typealias SuccessHandler = ([RestaurantGroup]) -> Void
    typealias FailHandler = (Error) -> Void
    
    func reload(_ page: Int,
                success: @escaping SuccessHandler,
                failure: @escaping FailHandler) {
        adater.fetch(RestaurantForm.restaurants(page: page)) { (result: Response) in
            switch result {
            case .success(let restaurants):
                let group = Dictionary(grouping: restaurants) { (rest) -> SectionType in
                    return SectionType(rawValue: rest.sectionTitle ?? "") ?? .enrolled
                }
                
                self.sections.append(contentsOf: group.map ({
                    RestaurantGroup(sectionType: $0.key, restaurants: $0.value)
                }))
                
                self.sections.sort { (lhs, rhs) -> Bool in
                    return lhs.sectionType > rhs.sectionType
                }
                
                success(self.sections)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    private var sections: [RestaurantGroup] = []
    private let adater = Adapter()
    
    private typealias Response = Result<[Restaurant], Error>
}
