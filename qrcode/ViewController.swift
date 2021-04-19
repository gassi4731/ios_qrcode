//
//  ViewController.swift
//  qrcode
//
//  Created by Yo Higashida on 2021/04/19.
//

import UIKit

class ViewController: UIViewController {
    // 定義
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var qrImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton() {
        qrImageView.image = QRCode
    }
    
    // QRコード生成
    private var QRCode: UIImage? {
        // 何も入力されていない場合は、処理を中断する
        guard let url = urlTextField.text else {
            return nil
        }
        // URLをデータ型に変換
        let data = url.data(using: .utf8)!
        
        // QRコードをCIFilterで生成
        // エラー修正レベル（inputCorrectionLevel）は、L→M→Q→Hの順で高くなり細かくなる。
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "L"])!
        let image = UIImage(ciImage: qr.outputImage!)
        return image
    }
}
