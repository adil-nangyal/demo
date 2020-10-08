//
//  ViewController.swift
//  demohamaya
//
//  Created by SDS on 07/10/2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var clicked: Bool?
    let data :[(title : String , text : String , image : UIImage )] = [(
                                                                   title : "label1 " , text : " text1" , image : UIImage(named: "smallimage") ?? UIImage() )]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI(){
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(UINib(nibName: "spreadTableViewCell", bundle: .main), forCellReuseIdentifier: "spreadTableViewCell")
        self.tableview.register(UINib(nibName: "SinglelineTVC", bundle: .main), forCellReuseIdentifier: "SinglelineTVC")
        setNaviationBarWithSideBtn(isHome: true)
    }
    
    func setNaviationBarWithSideBtn(isHome : Bool) -> Void {
       // self.navigationController?.navigationBar.barTintColor = Color.theme
        let btn0 = UIButton(type: .custom)
        btn0.setImage(UIImage(named: "Ammaicon"), for: .normal)
        btn0.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn0.addTarget(self, action: #selector(self.chatWithAmnaBtnClicked), for: .touchUpInside)
       let item0 = UIBarButtonItem(customView: btn0)
        self.navigationItem.setRightBarButtonItems([item0], animated: false)

    }
    @objc func chatWithAmnaBtnClicked() -> Void {
        print ("clicked")
        if (clicked == true) {
            clicked = false
            print ("clicked1")
        
            tableview.reloadSections(IndexSet(integer: 0), with: UITableView.RowAnimation.top)
            // self.dismiss(animated: true, completion: nil)
         
        }
        else
        {
            print ("clicked2")
            clicked = true
            tableview.reloadSections(IndexSet(integer: 0), with: UITableView.RowAnimation.top)
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        clicked = false
    }
}
extension ViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       
        if (clicked == false) {
            print("again")
            guard let cell1 = tableview.dequeueReusableCell(withIdentifier: "spreadTableViewCell") as? spreadTableViewCell
            else {fatalError("Cell Not Found") }
            return cell1
            
        }
        else {
            print("again1")
             guard let cell2 = tableview.dequeueReusableCell(withIdentifier: "SinglelineTVC") as? SinglelineTVC else {
                 fatalError("Cell Not Found")}
            return cell2
   
        }
    }
    
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (clicked == true) {
            return 440
        }
        else{
            return 111
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

}




