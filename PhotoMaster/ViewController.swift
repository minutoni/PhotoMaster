//
//  ViewController.swift
//  PhotoMaster
//
//  Created by 所　紀彦 on 2019/04/10.
//  Copyright © 2019年 所　紀彦. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    //写真表示用ImageView
    @IBOutlet var photoImageView : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    
    //カメラボタンを押した時に呼ばれる
    @IBAction func onTappedCameraButton() {
        presentPickerController(sourceType: .camera)
    }
    
    //アルバムwを押した時に呼ばれるメソッド
    @IBAction func onTappedAlbumButton(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    //カメラ、アルバムの呼び出しメソッド(カメラorアルバムのソースタイプが引数
    func presentPickerController(sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker,animated:true,completion: nil)
        }
    }
    
    //写真が選択された時に呼び出されるメソッド
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]) {
        self.dismiss(animated: true,completion: nil)
        
        //画像を出力
        photoImageView.image = info[.originalImage]as? UIImage
    }


}

