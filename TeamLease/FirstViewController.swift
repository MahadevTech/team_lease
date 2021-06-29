//
//  FirstViewController.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,tableCellWithIDActionDelegate,passfav{
    
    
    
    
    @IBOutlet weak var tblEmployee: UITableView!
    
    var vm_employee = vm_Employee()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TeamLease"
        
        tblEmployee.delegate = self
        tblEmployee.dataSource = self
        cfg.myfav = getStruct(cfg.favKey)
        setBackgroundLabel()
        SecondViewController.delegate = self
        
        getEmployee()
    }
    override func viewWillAppear(_ animated: Bool) {
        vm_employee.updateAddToFav()
    }
    
//  MARK: Initalization
    func setBackgroundLabel(){
        vm_employee.lbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        vm_employee.lbl.text = "Loading..."
        vm_employee.lbl.textColor = UIColor.white
        vm_employee.lbl.textAlignment = .center
        vm_employee.lbl.numberOfLines = 3
        self.tblEmployee.backgroundView = vm_employee.lbl
    }
    
    func getEmployee(){
        vm_employee.callEmployee(){ [self] (data, error) in
            tblEmployee.reloadData()
        }
    }
    
    
    func action2(_ type: String, data: model_emp) {
        let index = data.index!
        
        if type == "fav"{
            var msg: String = "\(data.name) Successfully "
            vm_employee.empData[index].fav = !vm_employee.empData[index].fav

            if !vm_employee.empData[index].fav{
                cfg.myfav.removeAll { model in
                    model.id == vm_employee.empData[index].id
                }
                msg += "Removed from Favorite"
            }else{
                msg += "Added from Favorite"
                cfg.myfav.append(data)
            }
            saveStruct(cfg.myfav, Key: cfg.favKey)
            let indexPath = IndexPath(row: index, section: 0)
            tblEmployee.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            alertDialog(msg,viewController: self)

        }
    }
    
//    MARK: Add to Fav trigger
    func action(_ type: String, id: Int) {
        if type == "fav"{
            var msg: String = "\(vm_employee.empData[id].name) Successfully "
            vm_employee.empData[id].fav = !vm_employee.empData[id].fav

            if !vm_employee.empData[id].fav{
                cfg.myfav.removeAll { model in
                    model.id == vm_employee.empData[id].id
                }
                msg += "Removed from Favorite"
            }else{
                msg += "Added from Favorite"
                cfg.myfav.append(vm_employee.empData[id])
            }
            saveStruct(cfg.myfav, Key: cfg.favKey)
            alertDialog(msg,viewController: self)
        
        }
        
    }
    
   
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm_employee.empData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm_employee.empData[indexPath.row].index = indexPath.row
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "secondvc") as! SecondViewController
        nextViewController.detailData = vm_employee.empData[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FirstCell = self.tblEmployee.dequeueReusableCell(withIdentifier:"firstcell") as! FirstCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.populateData(vm_employee.empData[indexPath.row], index: indexPath.row)
        return cell
    }
    
    
    
    
    
}
class FirstCell : UITableViewCell{
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblWeb: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var addFavButton: UIButton!
    
    @IBOutlet weak var imgFav: UIImageView!
    
    var delegate : tableCellWithIDActionDelegate? = nil
    
    
    override class func awakeFromNib() {
    }
    func populateData(_ data : model_emp, index : Int){
        addFavButton.tag = index
        lblName.text = data.name as? String ?? ""
        lblPhone.text = data.phone as? String ?? ""
        lblCompanyName.text = data.company?.name as? String ?? ""
        lblWeb.text = data.website as? String ?? ""
        if data.fav{
            imgFav.image = UIImage(named: "fav_active")
        }else{
            imgFav.image = UIImage(named: "fav")
        }
        
    }
    
    @IBAction func btnFavAction(_ sender: UIButton) {
        if imgFav.tag == 1 {
            imgFav.image = UIImage(named: "fav")
            imgFav.tag = 0
        }
        else {
            imgFav.image = UIImage(named: "fav_active")
            imgFav.tag = 1
        }
        delegate?.action("fav", id: sender.tag)
    }
}

