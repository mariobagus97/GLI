//
//  SourcesNewsViewController.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit
import RxSwift
import RxCocoa
import SkeletonView

class SourcesNewsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = Dependency().resolve(SourcesNewsViewModel.self)
   
    
    var category: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SourceTableViewCell", bundle: nil), forCellReuseIdentifier: "SourceTableViewCell")
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        viewModel.state
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { state in
                switch state {
                case .loading:
                    print("loading")
                    self.tableView.showAnimatedSkeleton()
                case.finished:
                    self.tableView.hideSkeleton()
                    print("finished")
                    self.tableView.reloadData()
                case.failed:
                    self.tableView.hideSkeleton()
                    if ((self.viewModel.dataSource?.count ?? 0) == 0) {
                        self.setEmptyDataView(empty: true)
                    } else {
                        self.setEmptyDataView(empty: false)
                    }
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        guard let category = self.category else { return }
        viewModel.getSourceList(category: category)
    }
    
    private func setEmptyDataView(empty: Bool) {
        if empty {
            let emptyView = EmptyResultViewBuilder()
                .withImage("noResult")
                .withDefaultTitle("Mohon maaf, terjadi kesalahan pada server kami. Mohon coba kembali")
                .hideEmptyInfo(true)
                .enableButtonReload(true, delegate: self)
                .setButtonTitle("Coba Lagi")
                .setBackgroundColor()
                .build()
            tableView.backgroundView = emptyView
            self.view.isUserInteractionEnabled = true
        } else {
            tableView.backgroundView = nil
        }
    }
}

extension SourcesNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = viewModel.dataSource?[indexPath.row] {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SourceTableViewCell") as? SourceTableViewCell {
                cell.configureCell(source: model)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sourceId = viewModel.dataSource?[indexPath.row].id else { return }
        let vc = NewsListWireframe.makeNewsListViewController(sourceId: sourceId)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: EmptySearchViewDelegate
extension SourcesNewsViewController: EmptySearchViewDelegate {
    func didReloadResult() {
        self.viewModel.getSourceList(category: self.category ?? "")
    }
}

extension SourcesNewsViewController: SkeletonTableViewDataSource {
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "NewsTableViewCell"
    }
}
