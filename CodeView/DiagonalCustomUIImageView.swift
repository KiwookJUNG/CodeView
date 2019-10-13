//
//  DiagonalCustomUIImageView.swift
//  CodeView
//
//  Created by 정기욱 on 2019/10/13.
//  Copyright © 2019 kiwook. All rights reserved.
//

import UIKit

class DiagonalCustomUIImageView: UIImageView {
    
    
    override func layoutSubviews() {
        // 그려질때 코드가 실행되는 부분
        makeMask()
    }

    // 대각선으로 잘린 네모를 그린다
    // bezier path로 그린다.
    
    // path -> layer화 시킨다
    
    // layer -> masking 한다
    
    // Bezier Path로 그린다.
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - 50))
        path.close()
        
        return path
    }

    func pathToLayer() -> CAShapeLayer{
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
}
