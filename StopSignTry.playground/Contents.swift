//An attempt at a stop sign using UIBezierPath

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
        let ssPath = UIBezierPath(rect:self.bounds)
        let center = self.center
        let θ = M_PI_4
        let π = CGFloat(M_PI)
        
        ssPath.lineWidth = 30.0

        ssPath.move(to: CGPoint(x: (center.x - center.x * cos(π)),
                                y: (center.y - center.y * sin(π))))

        for i in stride(from: -M_PI, to: M_PI, by: θ){
            
            //x = center * cos(i)
            //y = center * sin(i)
            let x = center.x - (center.x * cos(CGFloat(i)))
            let y = center.y - (center.y * sin(CGFloat(i)))
            ssPath.addLine(to: CGPoint(x: x, y: y))
            

        }
        ssPath.close()
        UIColor.white.setFill()
        ssPath.fill()
        ssPath.stroke()
    }
}


let stopSign = Sign(frame: CGRect(x: 0, y: 0, width: 400, height: 400))






