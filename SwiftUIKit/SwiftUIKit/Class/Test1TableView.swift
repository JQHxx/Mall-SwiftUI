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
        Text("122")
        //Test1TableView.init(controllers)
    }
    
}

struct Test1TableView: UIViewRepresentable {
    
    private var datas: [String]
    init(_ datas: [String]) {
        self.datas = datas
    }
    func updateUIView(_ uiView: UITableView, context: Context) {
        //uiView.reloadData()
    }

    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ID")
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
            let str = self.parent.datas[indexPath.row]
            cell?.textLabel?.text = str
            return cell!
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let destination = HomeView()
            let host = UIHostingController(rootView: destination)
            host.modalPresentationStyle = .fullScreen
            let controller = UIApplication.shared.windows[0].rootViewController as? MyHontingController
            controller?.present(host, animated: true, completion: nil)
        }
        
    }
}

struct Test1TableViewCell: UIViewRepresentable {
    func updateUIView(_ uiView: UITableViewCell, context: Context) {
        //uiView.reloadData()
    }

    func makeUIView(context: Context) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        return tableViewCell
    }
}
