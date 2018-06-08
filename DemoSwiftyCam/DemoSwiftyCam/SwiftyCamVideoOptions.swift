//
//  SwiftyCamOptions.swift
//  DemoSwiftyCam
//
//  Created by Chris Campos on 6/8/18.
//  Copyright © 2018 Cappsule. All rights reserved.
//

import Foundation
import AVFoundation

class SwiftyCamVideoOptions {
    
    public struct videoFormat {
        public var format : AVCaptureDeviceFormat!
        public var frameRateRange : AVFrameRateRange!
        
        public var minFrameRate : Float64 {
            get { return frameRateRange.minFrameRate }
        }
        
        public var maxFrameRate : Float64 {
            get { return frameRateRange.maxFrameRate }
        }
        
        public var minFrameDuration : CMTime {
            get { return frameRateRange.minFrameDuration }
        }
        public var maxFrameDuration : CMTime {
            get {return frameRateRange.maxFrameDuration }
        }
        
        init( format: AVCaptureDevice.Format ) {
            self.format = format
            
            // set frameRateRange - will look into seeing what exact is in videoSupportedFrameRateRanges
            let _frameRateRanges = format.videoSupportedFrameRateRanges[0] as! [AVFrameRateRange]
            self.frameRateRange = _frameRateRanges[0]
        }

    }
    
    public func getAllFormats(device: AVCaptureDevice) -> [videoFormat]{
    
        // this grabs the device formats as an [Any] array
        let formats = device.formats;
        
        var _out = [videoFormat]()
        
        // iterate through each
        for item in formats! {
            // cast item into their various parts to parse the maxFrameRate
            let newFormat = item as! AVCaptureDevice.Format
            let newVideoFormat = videoFormat(format: newFormat)

            _out.append(newVideoFormat)

        }
        return _out
    }
}
