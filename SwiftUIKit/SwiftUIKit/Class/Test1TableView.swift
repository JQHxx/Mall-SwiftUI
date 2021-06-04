//
//  Test1TableView.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/4.
//

import Foundation
import SwiftUI
import UIKit
import InterfaceKit
import SnapKit

struct CSTableView<T: View>: View {
    
    private var controllers : [UIHostingController<T>]
    
    
    init(_ views : [T]) {
        self.controllers = views.map { UIHostingController(rootView: $0)}
    }
    
    var body: some View {
        Test1TableView.init(controllers)
    }
    
}

struct Test1TableView: UIViewRepresentable {
    
    private var datas: [UIViewController]
    init(_ datas: [UIViewController]) {
        self.datas = datas
    }
    func updateUIView(_ uiView: UITableView, context: Context) {
        //uiView.reloadData()
    }

    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: Test1TableView
        init(_ parent: Test1TableView) {
            self.parent = parent
            super.init()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.datas.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ID")
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ID")
            }
            let VC = parent.datas[indexPath.row]
            //cell?.textLabel?.text = str
            cell?.contentView.addSubview(VC.view)
            VC.view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            return cell!
        }
        
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
        
    }
}
