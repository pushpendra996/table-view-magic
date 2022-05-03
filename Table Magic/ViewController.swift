//
//  ViewController.swift
//  Table Magic
//
//  Created by Pushpendra Saini on 03/05/22.
//

import UIKit
enum MyControllerCellType : Int, CaseIterable {
    case caution = 0, categories = 1, detail = 2, action = 3
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var myList : [String] = [String]()
    private var tempList : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        
        for i in 0...10 {
            self.myList.append("Category Name \(i + 1)")
        }
        self.tempList.append(contentsOf: self.myList)
    }


    private func setTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "CautionCell", bundle: nil), forCellReuseIdentifier: "CautionCell")
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        self.tableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        self.tableView.register(UINib(nibName: "ActionCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
        
        self.tableView.separatorStyle = .none
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MyControllerCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case MyControllerCellType.caution.rawValue:
            return 1
        case MyControllerCellType.categories.rawValue:
            return self.tempList.count
        case MyControllerCellType.detail.rawValue:
            if self.tempList.count <= 1 {
                return 1
            } else  {
                return 0
            }
        case MyControllerCellType.action.rawValue:
            if self.tempList.count <= 1 {
                return 1
            } else  {
                return 0
            }
        default:
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case MyControllerCellType.caution.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CautionCell", for: indexPath) as! CautionCell
            cell.selectionStyle = .none
            return cell
        case MyControllerCellType.categories.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.selectionStyle = .none
            cell.lbTitle.text = self.tempList[indexPath.row]
            return cell
        case MyControllerCellType.detail.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
            cell.selectionStyle = .none
            return cell
        case MyControllerCellType.action.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case MyControllerCellType.categories.rawValue:
            if self.tempList.count <= 1 {
                self.tempList = self.myList
            } else {
                self.tempList.removeAll()
                self.tempList.append(self.myList[indexPath.row])
            }
            self.tableView.beginUpdates()
            self.tableView.reloadSections([MyControllerCellType.categories.rawValue, MyControllerCellType.detail.rawValue, MyControllerCellType.action.rawValue], with: .automatic)
            self.tableView.endUpdates()
        default:
            break
        }
       
    }
}
