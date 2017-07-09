//
//  ViewController.swift
//  FlappyBird
//
//  Created by 袁杰 on 2017/7/9.
//  Copyright © 2017年 VIPLimited. All rights reserved.
//

import UIKit

let G:Float = 9.8
let SCREEN_SIZE = UIScreen.main.bounds

class ViewController: UIViewController {
	var timer:Timer?
	var i:Int=0
	var timer2:Timer?
	var timer3:Timer?
	var bird:UIImageView?
	var t:Float=0.0
	var isDown:Bool = false
	var isGameOver:Bool = false
	override func viewDidLoad() {
		super.viewDidLoad()
		creatBackgroundView()
		creatWood()
		creatBird()
		creatTimer()
	}
	func creatBackgroundView(){
		let image = UIImage(named: "bg.jpg")
		let view1 = UIImageView(image: image)
		let view2 = UIImageView(image: image)
		view1.tag = 101
		view2.tag = 102
		view1.frame = CGRect(x: 0, y: 0, width: SCREEN_SIZE.width, height: SCREEN_SIZE.height)
		view2.frame = CGRect(x: SCREEN_SIZE.width, y: 0, width: SCREEN_SIZE.width+1, height: SCREEN_SIZE.height)
		self.view.addSubview(view1)
		self.view.addSubview(view2)
		let image2 = UIImage(named: "03.png")
		let view3 = UIImageView(frame: CGRect(x: 0, y: SCREEN_SIZE.height-100, width: SCREEN_SIZE.width, height: 100))
		let view4 = UIImageView(frame: CGRect(x: SCREEN_SIZE.width, y: SCREEN_SIZE.height-100, width: SCREEN_SIZE.width+1, height: 100))
		view3.tag = 103
		view4.tag = 104
		view3.image = image2
		view4.image = image2
		self.view.addSubview(view3)
		self.view.addSubview(view4)
	}
	func creatTimer(){
		timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(ViewController.appAction1), userInfo: nil, repeats: true)
		timer2 = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(ViewController.appAction2), userInfo: nil, repeats: true)
		timer3 = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(ViewController.birdMove), userInfo: nil, repeats: true)
	}
	func appAction1() {
		mainViewMove()
		isHitting()
	}
	func appAction2() {
		let view1 = view.viewWithTag(301)
		let view2 = view.viewWithTag(302)
		let view3 = view.viewWithTag(303)
		let view4 = view.viewWithTag(304)
		let view5 = view.viewWithTag(305)
		let view6 = view.viewWithTag(306)
		if view1!.frame.origin.x > -350 {
			var frame:CGRect = view1!.frame
			frame.origin.x -= 2
			view1?.frame = frame
			var frame2:CGRect = view2!.frame
			frame2.origin.x -= 2
			view2?.frame = frame2
		}else{
			var frame = view1?.frame
			frame?.origin.x = SCREEN_SIZE.width
			view1?.frame = frame!
			
			var frame2 = view2?.frame
			frame2?.origin.x = SCREEN_SIZE.width
			view2?.frame = frame2!
			self.appearWood(view1 as! UIImageView, view2: view2 as! UIImageView)
		}
		if view3!.frame.origin.x > -350{
			var frame:CGRect = view3!.frame
			frame.origin.x -= 2
			view3?.frame = frame
			
			var frame2:CGRect = view4!.frame
			frame2.origin.x -= 2
			view4?.frame = frame2
		}else{
			var frame:CGRect = view3!.frame
			frame.origin.x = SCREEN_SIZE.width
			view3?.frame = frame
			
			var frame2:CGRect = view4!.frame
			frame2.origin.x = SCREEN_SIZE.width
			view4?.frame = frame2
			self.appearWood(view3 as! UIImageView, view2: view4 as! UIImageView)
		}
		if view5!.frame.origin.x > -350 {
			var frame:CGRect = view5!.frame
			frame.origin.x -= 2
			view5?.frame = frame
			
			var frame2:CGRect = view6!.frame
			frame2.origin.x -= 2
			view6?.frame = frame2
		}else{
			var frame = view5!.frame
			frame.origin.x = SCREEN_SIZE.width
			view5!.frame = frame
			
			var frame2 = view6!.frame
			frame2.origin.x = SCREEN_SIZE.width
			view6!.frame = frame2
			self.appearWood(view5 as! UIImageView, view2: view6 as! UIImageView)
		}
	}
	func birdMove() {
		if !isDown{
			if bird!.frame.origin.y < SCREEN_SIZE.height - 100{
				var rant:CGRect = bird!.frame
				rant.origin.y += (CGFloat)(G*(t*t)/2)
				bird?.frame = rant
				t += 0.035
			}
		}else{
			if t < 0.24{
				var rant = bird?.frame
				rant?.origin.y -= 4.9-(CGFloat)(G*(t*t)/2)
				bird?.frame = rant!
				t += 0.035
			}else{
				isDown = false
			}
		}
	}
	func appearWood(_ view1:UIImageView,view2:UIImageView){
		let hight = arc4random()%222+30
		var rant1 = view1.frame
		var rant2 = view2.frame
		rant1.origin.y = (CGFloat)(-SCREEN_SIZE.height) + (CGFloat)(hight)
		rant2.origin.y = (CGFloat)(hight)+100.0
		view1.frame = rant1
		view2.frame = rant2
	}
	func mainViewMove() {
		i=i+1
		if i>100{
			i=1
		}
		let view1 = view.viewWithTag(101)
		let view2 = view.viewWithTag(102)
		let view3 = view.viewWithTag(103)
		let view4 = view.viewWithTag(104)
		
		if view1!.frame.origin.x > -SCREEN_SIZE.width{
			var frame = view1?.frame
			frame?.origin.x -= 1
			view1?.frame=frame!
		}else{
			var frame = view1?.frame
			frame?.origin.x = SCREEN_SIZE.width
			view1?.frame = frame!
		}
		if view2!.frame.origin.x > -SCREEN_SIZE.width {
			var frame = view2?.frame
			frame?.origin.x -= 1
			view2?.frame = frame!
		}else{
			var frame = view2?.frame
			frame?.origin.x = SCREEN_SIZE.width
			view2?.frame = frame!
		}
		if view3!.frame.origin.x > -SCREEN_SIZE.width{
			var frame = view3?.frame
			frame?.origin.x -= 2
			view3?.frame = frame!
		}else{
			var frame = view3?.frame
			frame?.origin.x = SCREEN_SIZE.width
			view3?.frame = frame!
		}
		if view4!.frame.origin.x > -SCREEN_SIZE.width{
			var frame = view4?.frame
			frame?.origin.x -= 2
			view4?.frame = frame!
		}else{
			var frame = view4?.frame
			frame?.origin.x = SCREEN_SIZE.width
			view4?.frame = frame!
		}
	}
	func isHitting() {
		let view1 = view.viewWithTag(301)
		let view2 = view.viewWithTag(302)
		let view3 = view.viewWithTag(303)
		let view4 = view.viewWithTag(304)
		let view5 = view.viewWithTag(305)
		let view6 = view.viewWithTag(306)
		if bird!.frame.intersects(view1!.frame)||bird!.frame.intersects(view2!.frame)||bird!.frame.intersects(view3!.frame)||bird!.frame.intersects(view4!.frame)||bird!.frame.intersects(view5!.frame)||bird!.frame.intersects(view6!.frame){
			timer!.fireDate = Date.distantFuture as Date
			timer2!.fireDate = Date.distantFuture as Date
			timer3!.fireDate = Date.distantFuture as Date
			bird?.stopAnimating()
			self.gameOver()
		}
	}
	func gameOver(){
		isGameOver = true
		let gameOver:UIImageView = UIImageView(frame: CGRect(x: 30, y: 100, width: SCREEN_SIZE.width-60, height: 60))
		gameOver.image = UIImage(named: "gameover2.png")
		gameOver.tag = 900
		view.addSubview(gameOver)
		
	}
	func creatWood() {
		let image:UIImage = UIImage(named: "04.png")!
		let image2:UIImage = UIImage(named: "05.png")!
		let view1:UIImageView = UIImageView(frame: CGRect(x: SCREEN_SIZE.width, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
		let view2:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
		view1.image=image
		view2.image=image2
		view1.tag=301
		view2.tag=302
		
		let view3:UIImageView = UIImageView(frame: CGRect(x: SCREEN_SIZE.width+200, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
		let view4:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+200, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
		view3.image = image
		view4.image = image2
		view3.tag = 303
		view4.tag = 304
		
		let view5:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+400, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
		let view6:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+400, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
		view5.image=image
		view6.image=image2
		view5.tag=305
		view6.tag=306
		
		let image0 = view.viewWithTag(103)
		view.insertSubview(view1, belowSubview: image0!)
		view.insertSubview(view2, belowSubview: image0!)
		view.insertSubview(view3, belowSubview: image0!)
		view.insertSubview(view4, belowSubview: image0!)
		view.insertSubview(view5, belowSubview: image0!)
		view.insertSubview(view6, belowSubview: image0!)
	}
	
	func creatBird() {
		let images:NSMutableArray = NSMutableArray()
		for j in 1 ..< 4 {
			let image = UIImage(named: NSString(format:"bird%d.png",j) as String)
			images.add(image!)
		}
		bird=UIImageView(frame: CGRect(x: 50, y: 200, width: 35, height: 35))
		bird!.animationImages=images as? [UIImage]
		bird?.animationRepeatCount=0
		bird?.animationDuration=0.3
		bird?.image=images[i] as? UIImage
		bird?.startAnimating()
		view.addSubview(bird!)
	}
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if isGameOver {
			isGameOver = false
			let im = view.viewWithTag(900)
			im?.removeFromSuperview()
			self.reloadGame()
		}else{
			isDown = true
			t = 0
		}
	}
	func reloadGame() {
		i = 0
		t = 0
		let view1 = view.viewWithTag(301)
		let view2=self.view.viewWithTag(302)
		let view3=self.view.viewWithTag(303)
		let view4=self.view.viewWithTag(304)
		let view5=self.view.viewWithTag(305)
		let view6=self.view.viewWithTag(306)
		view1!.frame=CGRect(x: SCREEN_SIZE.width, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
		view2!.frame=CGRect(x: SCREEN_SIZE.width, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
		view3!.frame=CGRect(x: SCREEN_SIZE.width+200, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
		view4!.frame=CGRect(x: SCREEN_SIZE.width+200, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
		view5!.frame=CGRect(x: SCREEN_SIZE.width+400, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
		view6!.frame=CGRect(x: SCREEN_SIZE.width+400, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
		bird?.frame=CGRect(x: 50, y: 200, width: 35, height: 35)
		timer!.fireDate=Date.distantPast as Date
		timer2!.fireDate=Date.distantPast as Date
		timer3!.fireDate=Date.distantPast as Date
		bird?.startAnimating()
	}

}

