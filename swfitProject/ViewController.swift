//
//  ViewController.swift
//  swfitProject
//
//  Created by 柯浩然 on 2017/11/21.
//  Copyright © 2017年 柯浩然. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    lazy var tableView : UITableView = {
        
        let table = UITableView()
        
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        return table
        
    }()
    private var dataSource = [String]()
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        view.addSubview(tableView)
        self.dataSource = lyric.components(separatedBy: ",")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        let cells = tableView.visibleCells
        for (index, cell) in cells.enumerated() {
            
            cell.frame.origin.y = self.tableView.frame.size.height
            UIView.animate(withDuration: 1, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.frame.origin.y = 0;
            }, completion: nil)
           
        }
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.dataSource.count
        //test commit
        //还是不懂
        //可以成功吗
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "swiftProject")
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        let gradient = CAGradientLayer()
        gradient.frame = bgView.frame
        let lowerColor = UIColor(red: 1, green: CGFloat(indexPath.row * 20) / 255.0, blue: CGFloat(indexPath.row * 20) / 255.0, alpha: 1).cgColor
        let upperColor = UIColor(red: 1, green: CGFloat(indexPath.row * 20 + 10)/255.0, blue: CGFloat(indexPath.row * 20 + 10) / 255.0, alpha: 1).cgColor

        gradient.colors = [upperColor,lowerColor]
        bgView.layer.addSublayer(gradient)
        cell.addSubview(bgView)
        cell.sendSubview(toBack: bgView)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


