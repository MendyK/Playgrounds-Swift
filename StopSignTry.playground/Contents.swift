//A stop sign

import UIKit

class Sign : UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect)
    {
        let ctx = UIGraphicsGetCurrentContext()

        let center = self.center
        let θ = M_PI_4
        let π = CGFloat(M_PI)
        ctx?.setLineWidth(30.0)
        UIColor.red.setFill()
        
        //Rotate
        //Make rotation happen about center of context
        let ctxCenter = CGPoint(x: rect.midX, y: rect.midY)
        ctx?.translateBy(x: ctxCenter.x, y: ctxCenter.y)
        ctx?.rotate(by: CGFloat(θ / 2))
        
        //Go back to where we started
        ctx?.translateBy(x: -ctxCenter.x, y: -ctxCenter.y)
        
        
        ctx?.move(to: CGPoint(x: (center.x - center.x * cos(π)), y: (center.y - center.y * sin(π))))
        for i in stride(from: -M_PI, to: M_PI, by: θ){
            
            //x = center * cos(i)
            //y = center * sin(i)
            let x = center.x - (center.x * cos(CGFloat(i)))
            let y = center.y - (center.y * sin(CGFloat(i)))
            
            ctx?.addLine(to: CGPoint(x: x, y: y))

        }
        ctx?.fillPath()
        ctx?.strokePath()
    }
}

let stopSign = Sign(frame: CGRect(x: 0, y: 0, width: 400, height: 400))





