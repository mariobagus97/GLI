//
//  EmptyResultView.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

class EmptyResultViewBuilder {
    
    private var emptyView = EmptySearchView()
    private var tableView: UITableView?
    
    @discardableResult
    func withKeywordBoldTitle(_ title: String?) -> EmptyResultViewBuilder {
        if let query = title {
            if query.isEmpty {
                emptyView.querySearchWording.text = "Mohon maaf, hasil pencarian Anda tidak ditemukan."
            } else {
                emptyView.querySearchWording.text = "error"
            }
            
        } else {
            emptyView.querySearchWording.text = "Mohon maaf, hasil pencarian Anda tidak ditemukan."
        }
        return self
    }
    
    @discardableResult
    func withDefaultTitle(_ title: String?) -> EmptyResultViewBuilder {
        if let query = title {
            if query.isEmpty {
                emptyView.querySearchWording.text = "Mohon maaf, hasil pencarian Anda tidak ditemukan."
            } else {
                emptyView.querySearchWording.text = query
            }
        } else {
            emptyView.querySearchWording.text = "Mohon maaf, hasil pencarian Anda tidak ditemukan."
        }
        return self
    }
    
    @discardableResult
    func withDefaultHeadTitle(_ title: String?) -> EmptyResultViewBuilder {
        if let query = title {
            if !query.isEmpty {
                emptyView.lbTitle.isHidden = false
                emptyView.lbTitle.text = query
            }
        }
        return self
    }
    
    @discardableResult
    func withImage(_ image: String?) -> EmptyResultViewBuilder {
        if let img = image {
            emptyView.imageLogo.image = UIImage(named: img)
        }
        return self
    }
    	
    @discardableResult
    func withSpecialDeals() -> EmptyResultViewBuilder {
        tableView = UITableView()
        emptyView.calculateHeight()
        tableView?.tableHeaderView = emptyView
        tableView?.separatorStyle = .none
        tableView?.allowsSelection = false
        tableView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let nibSpecialDeals = UINib(nibName: "CellSectionProduct", bundle: nil)
        tableView?.register(nibSpecialDeals, forCellReuseIdentifier: "CellSectionProductSpecial")
        return self
    }
    
    @discardableResult
    func setButtonTitle(_ buttonTitle: String?) -> EmptyResultViewBuilder {
        if let title = buttonTitle {
            emptyView.btnReloadResult.setTitle(title, for: .normal)
            emptyView.btnActionBottom.setTitle(title, for: .normal)
            emptyView.btnReloadResult.layoutIfNeeded()
            emptyView.btnActionBottom.layoutIfNeeded()
        }
        return self
    }
    
    @discardableResult
    func hideEmptyInfo(_ hide: Bool = false) -> EmptyResultViewBuilder {
        emptyView.emptyInfo.isHidden = hide
        return self
    }
    
    @discardableResult
    func setBackgroundColor(_ color: UIColor = .white) -> EmptyResultViewBuilder {
        emptyView.containerView.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setEmptyInfoTextColor(_ color: UIColor = .gray) -> EmptyResultViewBuilder {
        emptyView.lbTips.textColor = color
        return self
    }
    
    func setEmptyInfoTextWithAttribute() -> EmptyResultViewBuilder {
        emptyView.lbTips.text = "error" //attributedText = combinedString
        return self
    }
     
    @discardableResult
    func setEmptyInfoBgColor(_ color: UIColor = .gray) -> EmptyResultViewBuilder {
        emptyView.emptyInfo.backgroundColor = color
        return self
    }
    
    @discardableResult
    // dont call this if you disable reload button
    func enableButtonReload(_ enable: Bool = false, delegate: EmptySearchViewDelegate?) -> EmptyResultViewBuilder {
        emptyView.btnReloadResult.isHidden = !enable
        emptyView.delegate = delegate
        return self
    }
    
    @discardableResult
    //Reload button for bottom position option
    func enableBottomButton(_ enable: Bool = false, delegate: EmptySearchViewDelegate?) -> EmptyResultViewBuilder {
        emptyView.btnActionBottom.isHidden = !enable
        emptyView.delegate = delegate
        return self
    }
    
    func setHeaderTitleFont(font: UIFont) -> EmptyResultViewBuilder {
        emptyView.lbTitle.font = font
        return self
    }
    
    func setTitleFont(font: UIFont) -> EmptyResultViewBuilder {
        emptyView.querySearchWording.font = font
        return self
    }
    
    func disableQuerySearch() -> EmptyResultViewBuilder {
        emptyView.querySearchWording.isHidden = true
        return self
    }
    
    func setCenterMargin(const: CGFloat) -> EmptyResultViewBuilder {
        emptyView.stackViewCenterConstraint.constant = const
        return self
    }
    
    func build() -> EmptySearchView {
        return emptyView
    }
    
    func buildTable(parent: UIView) -> UITableView? {
        tableView?.frame.size = parent.frame.size
        if let view = tableView {
            parent.addSubview(view)
        }
        return tableView
    }
    
    @discardableResult
    func setButtonFont(_ font: UIFont?) -> EmptyResultViewBuilder {
        if let font = font {
            emptyView.btnReloadResult.titleLabel?.font = font
            emptyView.btnActionBottom.titleLabel?.font = font
            emptyView.btnReloadResult.layoutIfNeeded()
            emptyView.btnActionBottom.layoutIfNeeded()
        }
        return self
    }
    
}
