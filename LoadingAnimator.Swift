//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//

import UIKit

enum style {
    
    case Box
    case Triangle
    case Oval
    
}

final class LoadingAnimator: NSObject {
    
    private(set) var duration:CFTimeInterval!
    private(set) var animateStyle:style
    private(set) var screenSize = UIScreen.main.bounds.size
    private(set) var view:UIView!
    private var blackView:UIView!
    
    private var ovalShape:CAShapeLayer!
    private var rectShape:CAShapeLayer!
    private var triangleShape:CAShapeLayer!
    
    private var animationFlag:Int = 0
    
    init(duration:CFTimeInterval,animateStyle:style,view:UIView) {
        
        self.duration = duration
        self.animateStyle = animateStyle
        self.view = view
        
    }
 
    //MARK: BOX
    private func createBoxAnimation() {
        
        let rectPath = UIBezierPath(rect: CGRect(x: blackView.center.x - 15, y: blackView.center.y - 30, width: 30, height: 30))
        let rectPathFinal = UIBezierPath(rect: CGRect(x: blackView.center.x - 50, y: blackView.center.y - 100, width: 100, height: 100))
        
        rectShape = CAShapeLayer()
        rectShape.path = rectPath.cgPath
        rectShape.strokeColor = UIColor.black.cgColor
        rectShape.fillColor = UIColor.lightGray.cgColor
        rectShape.lineWidth = 9
        
        view.layer.addSublayer(rectShape)
        
        let rectAnimation = CABasicAnimation(keyPath: "path")
        rectAnimation.duration = self.duration
        rectAnimation.fromValue = rectPath.cgPath
        rectAnimation.toValue = rectPathFinal.cgPath
        rectAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rectAnimation.isRemovedOnCompletion = false
        rectAnimation.repeatCount = Float.infinity
        rectAnimation.autoreverses = true
        
        rectShape.add(rectAnimation, forKey: "boxAnimation")

    }
    
    //MARK: Triangle
    
    private let trianglePath:UIBezierPath = {
        
        let tpath = UIBezierPath()
        tpath.move(to: CGPoint(x: 80, y: 80))
        tpath.addLine(to: CGPoint(x: 40, y: 0))
        tpath.addLine(to: CGPoint(x: 0, y: 80))
        tpath.close()
        
        return tpath
        
    }()
    
    private func createTriangleAnimation(){
        
        triangleShape = CAShapeLayer()
        triangleShape.path = trianglePath.cgPath
        triangleShape.position = CGPoint(x: blackView.center.x - 40, y: blackView.center.y - 80)
        triangleShape.fillColor = UIColor.lightGray.cgColor
        triangleShape.strokeColor = UIColor.black.cgColor
        triangleShape.lineWidth = 10
        
        view.layer.addSublayer(triangleShape)
        
        let triangleAnimation = CABasicAnimation(keyPath: "transform.rotation")
        triangleAnimation.duration = self.duration
        triangleAnimation.fromValue = 0.0
        triangleAnimation.fillMode = kCAFillModeForwards
        triangleAnimation.toValue = Float.pi * 2
        triangleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        triangleAnimation.isRemovedOnCompletion = false
        triangleAnimation.repeatCount = Float.infinity
        triangleAnimation.autoreverses = true
        triangleAnimation.isAdditive = true
        
        triangleShape.add(triangleAnimation, forKey: "triangleAnimation")
        
    }
    
    //MARK: OVAL
    
    private func createOvalAnimation(){
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: blackView.center.x - 35, y: blackView.center.y - 70, width: 70, height: 70))
        
        ovalShape = CAShapeLayer()
        ovalShape.path = ovalPath.cgPath
        ovalShape.fillColor = UIColor.white.cgColor
        
        view.layer.addSublayer(ovalShape)
        
        let ovalAnimation = CABasicAnimation(keyPath: "opacity")
        ovalAnimation.duration = self.duration
        ovalAnimation.fromValue = 0.0
        ovalAnimation.toValue = 1.0
        ovalAnimation.fillMode = kCAFillModeForwards
        ovalAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ovalAnimation.isRemovedOnCompletion = false
        ovalAnimation.repeatCount = Float.infinity
        ovalAnimation.autoreverses = true
        
        ovalShape.add(ovalAnimation, forKey: "ovalAnimation")
        
    }
    
     private func addBlackScreen() {
        
        self.blackView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenSize.width, height: screenSize.height)))
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0.8
        view.addSubview(blackView)
        
    }
    
    func startAnimation(){
        
       
            addBlackScreen()
            
            if animateStyle == .Box {
                
                createBoxAnimation()
                
            } else if animateStyle == .Triangle {
                
                createTriangleAnimation()
                
            } else if animateStyle == .Oval {
                
                createOvalAnimation()
                
            }
        
    }
    
    func stopAnimation(){
        
        blackView.removeFromSuperview()
        
        if animateStyle == .Box {
   
            rectShape.removeAllAnimations()
            rectShape.removeFromSuperlayer()
            
        } else if animateStyle == .Triangle {
            
            triangleShape.removeAllAnimations()
            triangleShape.removeFromSuperlayer()
            
        } else if animateStyle == .Oval {
            
            ovalShape.removeAllAnimations()
            ovalShape.removeFromSuperlayer()
            
        }
    }
    
}//
