//
//  EmptySearchView.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit

protocol EmptySearchViewDelegate: class {
    func didReloadResult()
}

class EmptySearchView: UIView {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var querySearchWording: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var btnReloadResult: UIButton!
    @IBOutlet weak var emptyInfo: UIView!
    @IBOutlet weak var lbTips: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var btnActionBottom: UIButton!
    
    @IBOutlet weak var stackViewCenterConstraint: NSLayoutConstraint!
    
    var delegate: EmptySearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    @IBAction func didReloadResult(_ sender: UIButton) {
        self.delegate?.didReloadResult()
    }
    
    // TODO: - please fix the code so we can remove swiftlint:disable
    // swiftlint:disable force_cast
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func calculateHeight() {
        var padding: CGFloat = 0
        var height: CGFloat = 0
        stackView.subviews.forEach({ view in
            if !view.isHidden {
                height += view.height
            } else {
                padding += stackView.spacing
            }
        })
        self.frame.size = CGSize(width: self.frame.width, height: height + padding)
    }
}
