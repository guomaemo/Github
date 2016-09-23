//
//  ViewController.swift
//  AVmusic
//
//  Created by macbook on 16/9/7.
//  Copyright © 2016年 郭志凯. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,AVAudioPlayerDelegate{
    
    var timer = NSTimer()
    var player = AVAudioPlayer()
    var progressMusic = UIProgressView()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.creatUI()
        self.creatAvplayer()
        
    }
    //布置UI界面
    func creatUI()
    {
        let tileLabel = UILabel(frame: CGRectMake(60,30,200,50))
        tileLabel.textAlignment = NSTextAlignment.Center
        tileLabel.font = UIFont.boldSystemFontOfSize(36)
        tileLabel.text = "简易播放器"
        tileLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(tileLabel)
        
        //开始按钮
        let starMusic = UIButton(frame: CGRectMake(120,80,80,80))
        starMusic.setTitle("开始", forState: UIControlState.Normal)
        starMusic.tintColor = UIColor .redColor()
        starMusic.addTarget(self, action: #selector(pressStar), forControlEvents: .TouchUpInside)
        self.view.addSubview(starMusic)
        
        //停止按钮
        let stopMusic = UIButton(frame: CGRectMake(120,160,80,80))
        stopMusic.setTitle("停止", forState: UIControlState.Normal)
        stopMusic.addTarget(self, action: #selector(pressStop), forControlEvents: .TouchUpInside)
        self.view.addSubview(stopMusic)
        
        //暂停按钮
        let pauseMusic = UIButton(frame: CGRectMake(120,240,80,80))
        pauseMusic.setTitle("暂停", forState: UIControlState.Normal)
        pauseMusic.addTarget(self, action: #selector(pressPause), forControlEvents: .TouchUpInside)
        self.view.addSubview(pauseMusic)
        
        //进度条
        progressMusic = UIProgressView(frame: CGRectMake(60,320,200,80))
        progressMusic.progress = 0
        self.view.addSubview(progressMusic)
        
        //调整声音
        let sliderVoice = UISlider(frame: CGRectMake(60,360,200,80))
        sliderVoice.maximumValue = 100.0
        sliderVoice.minimumValue = 0.0
        sliderVoice.setValue(50.0, animated: false)
        sliderVoice.addTarget(self, action: #selector(volumChange), forControlEvents: .ValueChanged)
        self.view.addSubview(sliderVoice)
        
        self.view.backgroundColor = UIColor.orangeColor()
    }
    
    func creatAvplayer()
    {
        let path = NSBundle.mainBundle().pathForResource("薛之谦 - 我好像在哪见过你", ofType:"mp3")
        let url = NSURL(fileURLWithPath: path!)
        
        player = try!AVAudioPlayer(contentsOfURL: url)
        player .prepareToPlay()
        player.numberOfLoops = -1
        player.volume = 0.1
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(updateT), userInfo: self, repeats: true)
    
    }
    
    func updateT()
    {
        progressMusic.progress = Float(player.currentTime/player.duration)
    }

    func pressStar()
    {
        print("开始")
        player.play()
    }
    
    func pressStop()
    {
        print("停止")
        player.stop()
    }
    
    func pressPause()
    {
        print("暂停")
        player.pause()
        player.currentTime = 0
    }
    func volumChange(slider:UISlider)
    {
        print(slider.value)
        player.volume = slider.value/100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

