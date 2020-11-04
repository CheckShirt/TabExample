//
//  RestaurantCell.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/03.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

final class RestaurantCell: UITableViewCell {
    
    public var actionFavorite: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setOpaqueBackground()
        logoImageView.image = nil
        restTitleLabel.text = nil
        restRatingLabel.text = nil
        ownerReplyLabel.text = nil
    }
    
    @IBAction private func touchFavorite(_ sender: Any) {
        favoriteButton.isSelected = !favoriteButton.isSelected
        actionFavorite?(favoriteButton.isSelected)
    }
    
    func configureView(_ item: CellPresentable, isFavoriate: Bool) {
        if let url = item.restaurantLogo { logoImageView.setImage(url) }
        
        favoriteButton.isSelected = isFavoriate
        restTitleLabel.text = item.restaurantTitle
        restRatingLabel.text = item.restaurantAvg
        restReviewCount.text = item.restaurantReviewCount
        ownerReplyLabel.text = item.restaurantownerReplyCount
        ownerReplyView.isHidden = item.isHiddenOwnerReply
        pickupBadge.isHidden = item.isHiddenAvailablePickup
        phoneOrderBadge.isHidden = item.isHiddenPhoneOrderAvaliable
        yogiPaymentBadge.isHidden = item.isHiddenYogiPayment
        offlinePaymentBadge.isHidden = item.isHiddenOfflinePayment
        expressBadge.isHidden = item.isHiddenExpresssBadge
    }
    
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var expressBadge: UIImageView!
    @IBOutlet private weak var ownerReplyView: UIStackView!
    @IBOutlet private weak var restTitleLabel: UILabel!
    @IBOutlet private weak var restRatingLabel: UILabel!
    @IBOutlet private weak var restReviewCount: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var ownerReplyLabel: UILabel!
    @IBOutlet private weak var phoneOrderBadge: UILabel!
    @IBOutlet private weak var yogiPaymentBadge: UILabel!
    @IBOutlet private weak var offlinePaymentBadge: UILabel!
    @IBOutlet private weak var pickupBadge: UILabel!
}
