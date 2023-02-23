//
//  NewsListViewController.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit
import RxSwift
import RxCocoa
import SkeletonView

class NewsListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = Dependency().resolve(NewsListViewModel.self)
    lazy var searchBar = UISearchBar()
    
    var sourceId: String?
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.sizeToFit()
        searchBar.placeholder = "Search title article"
        let rightBarButtonItem = UIBarButtonItem(customView: searchBar)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        self.tableView.register(UINib(nibName: "LoadingTableViewCell", bundle: nil), forCellReuseIdentifier: "LoadingTableViewCell")
        
        searchBar.rx.text
            .orEmpty
            .subscribe(onNext: { query in
                if query.isEmpty { return }
                self.viewModel.dataSource?.removeAll()
                self.viewModel.page = 0
                self.viewModel.getSearchArticle(sourceId: self.sourceId ?? "" , value: query)
            })
            .disposed(by: disposeBag)
        
        viewModel.state
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { state in
                switch state {
                case .loading:
                    print("loading")
                    if !self.isLoading {
                        self.tableView.showAnimatedSkeleton()
                    }
                case.finished:
                    if !self.isLoading {
                        self.tableView.hideSkeleton()
                    }
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
        viewModel.getNews(sourceId: self.sourceId ?? "")
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

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // Return the amount of items
            return viewModel.dataSource?.count ?? 0
        } else if section == 1 {
            // Return the Loading cell
            return 1
        } else {
            // Return nothing
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let model = viewModel.dataSource?[indexPath.row] {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell {
                    cell.configureWithCellModel(article: model)
                    return cell
                }
            }
        } else {
            print(indexPath.section)
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingTableViewCell", for: indexPath) as! LoadingTableViewCell
            cell.loadingIndicatorView.startAnimating()
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let dataSource = viewModel.dataSource else { return  }
        if indexPath.row == dataSource.count - 1, !isLoading, let total = viewModel.totalResults, dataSource.count < total {
            loadMoreData()
        }
    }
    
    func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().asyncAfter(deadline: .now()) {
                self.viewModel.getNews(sourceId: self.sourceId ?? "")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.dataSource?[indexPath.row] else { return }
        let vc = WebViewController()
        vc.url = model.url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: EmptySearchViewDelegate
extension NewsListViewController: EmptySearchViewDelegate {
    func didReloadResult() {
        self.viewModel.getNews(isLoadMore: false, sourceId: self.sourceId ?? "")
    }
}

extension NewsListViewController: SkeletonTableViewDataSource {

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
