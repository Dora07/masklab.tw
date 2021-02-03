import UIKit

class SecondViewController: UIViewController
{   //金牛獻瑞數量
    @IBOutlet weak var GoldenOxLabel: UILabel!
    //花開富貴數量
    @IBOutlet weak var BloomLabel: UILabel!
   //迎春接福數量
    @IBOutlet weak var SpringLabel: UILabel!
    //花顏富貴數量
    @IBOutlet weak var masklabLabel: UILabel!
    //總額價格
    @IBOutlet weak var AllLabel: UILabel!
    
    //Stepper
    
    //金牛獻瑞
    @IBOutlet weak var GoldenOxStepper: UIStepper!
    //花開富貴
    @IBOutlet weak var BloomStepper: UIStepper!
    //迎春接福數量
    @IBOutlet weak var SpringStepper: UIStepper!
    //花顏富貴新春禮包
    @IBOutlet weak var masklabStepper: UIStepper!
    
    //商品數量歸零
    
    //金牛獻瑞
    var GoldenOxMask :Int = 0
    //花開富貴
    var BloomMask : Int = 0
    //迎春接福
    var SpringMask :Int = 0
    //花顏富貴
    var maskLabAll:Int = 0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    @IBAction func BuyMaskAction(_ sender: UIStepper)
    {
        //Stepper取得購買數量
        //金牛獻瑞
        GoldenOxMask = Int(GoldenOxStepper.value)
        //花開富貴
        BloomMask = Int(BloomStepper.value)
        //迎春接福
        SpringMask = Int(SpringStepper.value)
        //花顏富貴
        maskLabAll = Int(masklabStepper.value)
        
        //Stepper取得購買數量顯示在label
        //金牛獻瑞
        GoldenOxLabel.text = "\(GoldenOxMask)"
        //花開富貴
        BloomLabel.text = "\(BloomMask)"
        //迎春接福
        SpringLabel.text = "\(SpringMask)"
        //花顏富貴
        masklabLabel.text = "\(maskLabAll)"
        
        totoalPrize()
    }
    
    //計算總價
    
    func totoalPrize()
    {
        let total = 349 * (GoldenOxMask + BloomMask + SpringMask) + 320 * maskLabAll
        AllLabel .text = "\(total)"
    }
    
    //清除按鈕
    @IBAction func clear(_ sender: UIButton)
    {   //Stepper取得購買數量歸零
        GoldenOxStepper.value = 0
        BloomStepper.value = 0
        SpringStepper.value = 0
        masklabStepper.value = 0
        //Stepper取得購買數量顯示在label歸零
        GoldenOxLabel.text = "0"
        BloomLabel.text = "0"
        SpringLabel.text = "0"
        masklabLabel.text = "0"
        AllLabel.text = "0"
        
    }
    
    //跳出視窗
    @IBAction func Sure(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "確定購買", message: "購買價格為\( AllLabel.text!)", preferredStyle: .alert)
        //取消選項
        alert.addAction(UIAlertAction(title: "取消", style: .default, handler: nil))
        //確定選項
        alert.addAction(UIAlertAction(title: "確定", style: .destructive, handler: { action in
            //點了確定後要做的事
            print("購買成功")
        }))
                self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
