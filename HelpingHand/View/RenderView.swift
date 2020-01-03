//
//
//  RenderView.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/18/19
//

//  The MIT License (MIT)
//
//  Copyright (c) 2015 didierbrun
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

class RenderView: UIView {
    
    var pointsToDraw:[Int] = [] {
        didSet {
            self.setNeedsDisplay()
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.clear(self.bounds)
        context!.setLineWidth(10.0)
        
        if pointsToDraw.count > 4 {
            
            context?.move(to: CGPoint(x: CGFloat(pointsToDraw[0]), y: CGFloat(pointsToDraw[1])))
            
            for i in 2..<pointsToDraw.count {
                if i % 2 == 0 {
                    context?.addLine(to: CGPoint(x: CGFloat(pointsToDraw[i]), y: CGFloat(pointsToDraw[i + 1])))
                }
            }
        }
        
        // Draw
        context!.strokePath();
    }
}
