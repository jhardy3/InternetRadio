//
//  StationController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 4/27/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation


// Add Station Streams to this array
let STATIONS_ARRAY = [
    
    ("KSFO 560 AM", "http://10423.live.streamtheworld.com:3690/KSFOAM_SC", UIImage(named: "KSFO")!, "San Francisco Hot Talk Radio"),
    ("KUFO 970 AM", "http://65.19.131.171/alphaportland-kufoamaac-ibc1?session-id=1128215199", UIImage(named: "Freedom970")!, "Freedom 970"),
    ("Red State Radio A", "http://fire.wavestreamer.com:8841", UIImage(named: "RedStateRadio")!, "Conservative Network"),
    ("Red State Radio B", "http://majestic.wavestreamer.com:2418", UIImage(named: "RedStateRadio")!, "Conservative Network"),
    ("KCAA California", "http://stream.kcaastreaming.com:8000/kcaa.mp3", UIImage(named: "KCAACalifornia")!, "Keeping California Aware"),
    ("iCRN - Liberty", "http://ca.radioboss.fm:8328/live", UIImage(named: "iCRN")!, "Conservative Radio Network"),
    ("iCRN - Justice", "http://ca2.radioboss.fm:8061/stream", UIImage(named: "iCRN")!, "Conservative radio Network"),
    ("KIXW - Talk 960", "http://54.81.244.228/eldorado-kixwamaac-ibc2?session-id=624764968&source=TuneIn", UIImage(named: "Talk960")!, "The High Desert's Talk Station"),
    ("NewsTalk 1180", "http://65.19.131.132/agmedia28-kernamaac-32?session-id=1219782653", UIImage(named: "Kern")!, "Kern Radio"),
    ("KMOX 1120", "http://4533.live.streamtheworld.com/KMOXAMDIALUP_SC", UIImage(named: "KMOX")!, "St. Louis KMOX"),
    ("GCN", "http://gcnplayer.gcnlive.com/channel1-hi.mp3", UIImage(named: "GCN")!, "Channel One"),
    ("GCN", "http://gcnplayer.gcnlive.com:80/channel2-hi.mp3", UIImage(named: "GCN")!, "Channel Two"),
    ("GCN", "http://ice01.gcnlive.com/channel3-lo.mp3", UIImage(named: "GCN")!, "Channel Three"),
    ("GCN", "http://tunein.com/radio/GCN-Live-4-s45477/", UIImage(named: "GCN")!, "Channel Four"),
    ("GCN", "http://gcnplayer.gcnlive.com:80/channel2-hi.mp3", UIImage(named: "GCN")!, "Channel Five")
    
//    ("WWB-AM", "http://1.ice1.firststreaming.com/wwba_am.mp3", UIImage(named: "Beck")!),
    // Savage 6-7
    
    // Specifics
//    ("The Glenn Beck Program", "http://15233.live.streamtheworld.com:3690/KSSZFM_SC", UIImage(named: "Beck")!),
//    ("The Michael Savage Show", "http://13753.live.streamtheworld.com:3690/WKZOAM_SC", UIImage(named: "Savage")!),
//    ("The Sean Hannity Show", "http://streaming.cmgdigital.com/atl750/atl750-tunein.mp3", UIImage(named: "Hannity")!),
//    ("The Mark Levin Show", "http://www.ophanim.net:9640", UIImage(named: "Levin")!),
//    ("The Savage Nation", "http://icy3.abacast.com/southerncomm-wwnramaac-64", UIImage(named: "Savage")!)
    
]

let SHOWS_ARRAY = [
    
    ("Laura Ingraham","Talk 960","http://54.81.244.228/eldorado-kixwamaac-ibc2?session-id=624764968&source=TuneIn", 6, 9, false, UIImage(named: "Ingraham")!),
    ("Rush Limbaugh","Talk 960","http://54.81.244.228/eldorado-kixwamaac-ibc2?session-id=624764968&source=TuneIn", 9, 12, false, UIImage(named: "Limbaugh")!),
    ("Laura Ingraham","Freedom 970","http://65.19.131.171/alphaportland-kufoamaac-ibc1?session-id=1128215199", 9, 12, false, UIImage(named: "Ingraham")!),
    ("Glenn Beck","KSFO 560","http://10423.live.streamtheworld.com:3690/KSFOAM_SC", 9, 12, false, UIImage(named: "Beck")!),
    ("Rush Limbaugh","KMOX 1120","http://4533.live.streamtheworld.com/KMOXAMDIALUP_SC", 11, 14, false, UIImage(named: "Limbaugh")!),
    ("Sean Hannity","Freedom 970","http://65.19.131.171/alphaportland-kufoamaac-ibc1?session-id=1128215199", 12, 15, false, UIImage(named: "Hannity")!),
    ("Sean Hannity","Sean Hannity Show","http://streaming.cmgdigital.com/atl750/atl750-tunein.mp3", 13, 16, false, UIImage(named: "Hannity")!),
    ("Michael Savage","KSFO 560","http://10423.live.streamtheworld.com:3690/KSFOAM_SC", 13, 16, false, UIImage(named: "Savage")!),
    ("Mark Reardon","KMOX 1120","http://4533.live.streamtheworld.com/KMOXAMDIALUP_SC", 14, 16, false, UIImage(named: "Reardon")!),
    ("Mark Levin","Freedom 970","http://65.19.131.171/alphaportland-kufoamaac-ibc1?session-id=1128215199", 15, 18, false, UIImage(named: "Levin")!),
    ("Joe Pags","Talk 960","http://54.81.244.228/eldorado-kixwamaac-ibc2?session-id=624764968&source=TuneIn", 15, 18, false, UIImage(named: "Pags")!),
    ("Alex Jones","Talk 960","http://54.81.244.228/eldorado-kixwamaac-ibc2?session-id=624764968&source=TuneIn", 18, 22, false, UIImage(named: "Jones")!),
    ("Sean Hannity","KSFO 560","http://10423.live.streamtheworld.com:3690/KSFOAM_SC", 19, 22, false, UIImage(named: "Hannity")!),
    ("Dave Ramsey","Kern","http://65.19.131.132/agmedia28-kernamaac-32?session-id=1219782653", 18, 22, false, UIImage(named: "Ramsey")!),
    ("Mark Levin","KSFO 560","http://10423.live.streamtheworld.com:3690/KSFOAM_SC", 16, 19, false, UIImage(named: "Levin")!)
    
]

class StationController {
    
    // MARK: - Class Properties
    
    static let sharedController = StationController()
    
    var audioPlayer: AVPlayer?
    
    var stations = [Station]()
    var shows = [Show]()
    
    // MARK: - Class Initialization
    
    init() {
        for station in STATIONS_ARRAY {
            stations.append(Station(stationStream: station.1, stationName: station.0, stationImage: station.2, stationDetail: station.3))
        }
        
        for show in SHOWS_ARRAY {
            shows.append(Show(startTime: show.3, endTime: show.4, hostName: show.0, showStation: show.1, streamURL: show.2, weekend: show.5, hostImage: show.6))
        }
    }
    
    // MARK: - Class Functions
    
    func stationSelected(station: Station) {
        
        let stationStream = station.stationStream
        guard let url = NSURL(string: stationStream) else { return }
        let audioPlayer = AVPlayer(URL: url)
        
        self.audioPlayer = audioPlayer
        
        audioPlayer.volume = 1.0
        audioPlayer.play()
    }
    
    func showIsValid(show: Show) -> Bool {
        
        let endTime = show.endTime
        let startTime = show.startTime
        let onWeekend = show.weekend
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let hour = calendar?.component(NSCalendarUnit.Hour, fromDate: NSDate())
        
        if onWeekend && isTheWeekend() {
            return (startTime <= hour) && (endTime >= hour)
        } else if !isTheWeekend() && !onWeekend {
            return (startTime <= hour) && (endTime > hour)
        } else {
            return false
        }
        
    }
    
    func isTheWeekend() -> Bool {
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        guard let currentWeekday = calendar?.component(NSCalendarUnit.Weekday, fromDate: NSDate()) else { return false }
        
        if (currentWeekday == 7) || (currentWeekday == 1) {
            return true
        } else {
            return false
        }
    }
    
    func showSelected(show: Show) {
        
        let stationStream = show.streamURL
        guard let url = NSURL(string: stationStream) else { return }
        let audioPlayer = AVPlayer(URL: url)
        
        self.audioPlayer = audioPlayer
        
        audioPlayer.volume = 1.0
        audioPlayer.play()
    }
    
    func stationPaused() {
        if let audioPlayer = audioPlayer {
            audioPlayer.pause()
        }
    }
    
    func stationStarted() {
        if let audioPlayer = audioPlayer {
            audioPlayer.play()
        }
    }
    
    func audioVolumeChanged(volumeFloat: Float) {
        self.audioPlayer?.volume = volumeFloat
    }
}

