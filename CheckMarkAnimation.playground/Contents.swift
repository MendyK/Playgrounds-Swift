//: Playground - noun: a place where people can play

import UIKit

class MKIndicatorView: UIView
{
    lazy var checkmarkShapeLayer: CAShapeLayer = {
        
        let ourFrame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(10, 10, 10, 10))
        
        let checkmarkPath = UIBezierPath()
        checkmarkPath.move(to: CGPoint(x: 0, y: 0.6 * ourFrame.height))
        checkmarkPath.addLine(to: CGPoint(x: 0.3 * ourFrame.width, y: ourFrame.height))
        checkmarkPath.addLine(to: CGPoint(x: ourFrame.width, y: 0))
        let layer         = CAShapeLayer()
        layer.frame       = ourFrame
        layer.path        = checkmarkPath.cgPath
        layer.fillMode    = kCAFillModeForwards
        layer.lineCap     = kCALineCapRound
        layer.lineJoin    = kCALineJoinRound
        layer.fillColor   = nil
        layer.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).cgColor
        layer.lineWidth   = 3.0
        return layer
    }()
    
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        layer.addSublayer(checkmarkShapeLayer)
        
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(checkmarkShapeLayer)
    }
    
    fileprivate func animateWithDuration(_ duration: CFTimeInterval)
    {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0.0
        animation.toValue = 1.0
        self.checkmarkShapeLayer.add(animation, forKey: "strokeEnd")
    }
}


let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
let indicatorHeight: CGFloat = 50
let xPosition = view.bounds.width / 2 - indicatorHeight / 2
let yPosition = view.bounds.height / 2 - indicatorHeight / 2
let checkMarkView = MKIndicatorView(frame: CGRect(x: xPosition,
                                                  y: yPosition,
                                                  width: indicatorHeight,
                                                  height:indicatorHeight))

let blurLayer = CALayer()
blurLayer.opacity = 0.5
blurLayer.backgroundColor = UIColor.black.cgColor
if let blurFilter = CIFilter(name: "CIGaussianBlur") {
    blurFilter.setDefaults()
    blurLayer.backgroundFilters = [blurFilter]
}
checkMarkView.layer.insertSublayer(blurLayer, above: checkMarkView.checkmarkShapeLayer)
checkMarkView.layer.zPosition = 1
checkMarkView.animateWithDuration(0.3)

