//
//  UITableViewExtension.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

extension UITableView {
    
    func showLoadingFooter(){
        let loadingFooter = UIActivityIndicatorView(style: .gray)
        loadingFooter.frame.size.height = 60
        loadingFooter.hidesWhenStopped = true
        loadingFooter.startAnimating()
        tableFooterView = loadingFooter
    }
    
    func showLoadingHeader(){
        let loadingFooter = UIActivityIndicatorView(style: .gray)
        loadingFooter.frame.size.height = 60
        loadingFooter.hidesWhenStopped = true
        loadingFooter.startAnimating()
        tableHeaderView = loadingFooter
    }
    
    func hideLoadingFooter(){
        let tableContentSufficentlyTall = (contentSize.height > frame.size.height)
        let atBottomOfTable = (contentOffset.y >= contentSize.height - frame.size.height)
        if atBottomOfTable && tableContentSufficentlyTall {
            UIView.animate(withDuration: 0.2, animations: {
                self.contentOffset.y = self.contentOffset.y - 60
            }, completion: { _ in
                self.tableFooterView = UIView()
            })
        } else {
            self.tableFooterView = UIView()
        }
    }
    
    func hideLoadingHeader(){
        let tableContentSufficentlyTall = (contentSize.height > frame.size.height)
        let atBottomOfTable = (contentOffset.y >= contentSize.height - frame.size.height)
        if atBottomOfTable && tableContentSufficentlyTall {
            UIView.animate(withDuration: 0.2, animations: {
                self.contentOffset.y = self.contentOffset.y - 60
            }, completion: { _ in
                self.tableHeaderView = UIView()
            })
        } else {
            self.tableHeaderView = UIView()
        }
    }
    
    func isLoadingFooterShowing() -> Bool {
        return tableFooterView is UIActivityIndicatorView
    }
    
    func reloadDataNoScroll() {
        let contentOffset = self.contentOffset
        self.reloadData()
        self.layoutIfNeeded()
        self.setContentOffset(contentOffset, animated: false)
    }
    
    func scrollToBottomUsingNumberOfRows(animated: Bool = true) {
        let section = self.numberOfSections
        if section > 0 {
            let row = self.numberOfRows(inSection: section - 1)
            if row > 0 {
                self.scrollToRow(at: IndexPath(row: row - 1, section: section - 1), at: .bottom, animated: animated)
            }
        }
    }

    func scrollToBottomUsingContentOffset(animated: Bool) {
        guard contentSize.height > frame.size.height else {
            return
        }
        
        let y = contentSize.height - frame.size.height
        if y < 0 { return }
        setContentOffset(CGPoint(x: 0, y: y), animated: animated)
    }
    
    func validateLayout() {
        let cachedOffset = contentOffset
        beginUpdates()
        endUpdates()
        layer.removeAllAnimations()
        setContentOffset(cachedOffset, animated: false)
    }
    
    func reloadRowsAtIndexPathsWithoutAnimation(_ indexPaths: [IndexPath]) {
        let cachedOffset = contentOffset
        reloadRows(at: indexPaths, with: .none)
        layer.removeAllAnimations()
        setContentOffset(cachedOffset, animated: false)
    }
    
    func reloadSectionsWithoutAnimation(_ sections: IndexSet) {
        let cachedOffset = contentOffset
        reloadSections(sections, with: .none)
        layer.removeAllAnimations()
        setContentOffset(cachedOffset, animated: false)
    }
    
    func reloadDataWithoutAnimation() {
        let cachedOffset = contentOffset
        reloadData()
        layer.removeAllAnimations()
        setContentOffset(cachedOffset, animated: false)
    }
    
    /**
     Calculates the total height of the tableView that is required if you ware to display all the sections, rows, footers, headers...
     */
    func contentHeight() -> CGFloat {
        var height = CGFloat(0)
        for sectionIndex in 0..<numberOfSections {
            height += rect(forSection: sectionIndex).size.height
        }
        return height
    }
    
    func removeSeparatorsOfEmptyCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func removeSeparatorsOfEmptyCellsAndLastCell() {
        tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 1)))
    }
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
      return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }

    func scrollToTop(animated: Bool) {
      let indexPath = IndexPath(row: 0, section: 0)
      if self.hasRowAtIndexPath(indexPath: indexPath) {
        self.scrollToRow(at: indexPath, at: .top, animated: animated)
      }
    }
    
    func setBottomInset(to value: CGFloat) {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
        self.contentInset = edgeInset
        self.scrollIndicatorInsets = edgeInset
    }
    
    //Variable-height UITableView tableHeaderView with autolayout
    func layoutTableHeaderView() {
        guard let headerView = self.tableHeaderView else { return }
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerWidth = headerView.bounds.size.width;
        let temporaryWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "[headerView(width)]", options: NSLayoutConstraint.FormatOptions(rawValue: UInt(0)), metrics: ["width": headerWidth], views: ["headerView": headerView])
        
        headerView.addConstraints(temporaryWidthConstraints)
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let height = headerSize.height
        var frame = headerView.frame
        
        frame.size.height = height
        headerView.frame = frame
        
        self.tableHeaderView = headerView
        
        headerView.removeConstraints(temporaryWidthConstraints)
        headerView.translatesAutoresizingMaskIntoConstraints = true
        
    }
}

protocol ReusableCell {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
    static var height: CGFloat { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var height: CGFloat {
        return 0.0
    }
}

// MARK: - Table View Registration and Dequeue
extension UITableView {
    
    public var removeEmptyCell: Bool {
        get { return false }
        set {
            tableFooterView = UIView()
        }
    }
    
    public var isJustContent: Bool {
        get { return false }
        set {
            allowsSelection = !newValue
            separatorStyle = .none
        }
    }
    
    func reloadRow(_ row: Int, section: Int) {
        let indexPathRow: Int = row
        let indexPosition = IndexPath(row: indexPathRow, section: section)
        self.beginUpdates()
        self.reloadRows(at: [indexPosition], with: .none)
        self.endUpdates()
    }
    /// Register a cell from external xib into a table instance.
    ///
    /// - Parameter _: cell class
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Dequeue a cell instance strongly typed.
    ///
    /// - Parameter indexPath: index path
    /// - Returns: instance
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
