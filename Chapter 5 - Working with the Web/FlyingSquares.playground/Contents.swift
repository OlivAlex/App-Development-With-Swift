//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let liveViewFrame  = CGRect(x: 0, y: 0, width: 500, height: 500)
let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let liveView = UIView(frame: liveViewFrame)
let square = UIView(frame: smallFrame)

liveView.backgroundColor = .white
square.backgroundColor = .purple
liveView.addSubview(square)
PlaygroundPage.current.liveView = liveView

UIView.animate(withDuration: 3.0, animations: {
    square.backgroundColor = .orange
    square.frame = CGRect(x: 200, y: 150, width: 100, height: 100)
}) { (_) in
    UIView.animate(withDuration: 3.0) {
        square.backgroundColor = .purple
        square.frame = smallFrame
    }
}