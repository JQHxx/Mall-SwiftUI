//
//  TestTableView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/4.
//

import Foundation
import UIKit

class TestTableView: UITableView {
    
    private var datas: [String] = []
    private var cellAction: ((String) -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ datas: [String], _ cellAction: ((String) -> Void)? = nil) -> TestTableView {
        self.datas = datas
        self.cellAction = cellAction
        self.reloadData()
        return self
    }
    
    private func setupUI() {
        self.separatorStyle = .none
        //self.delegate = self
        self.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension TestTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ID")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ID")
        }
        let str = datas[indexPath.row]
        cell?.textLabel?.text = str
        return cell!
        
    }
    
}

// MARK: - UITableViewDataSource
extension TestTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let str = datas[indexPath.row]
//        if let _ = cellAction {
//            cellAction!(str)
//        }
//    }
    
}
