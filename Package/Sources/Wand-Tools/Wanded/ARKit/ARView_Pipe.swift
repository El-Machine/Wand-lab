//
//  ARSession_Pipe.swift
//  Pipe
//
//  Created by Alex Kozin on 20.10.2022.
//

#if canImport(RealityKit)
import RealityKit

import Wand

@available(iOS 13.0, *)
extension ARView: Obtain {

    public 
    static func obtain(by wand: Wand?) -> Self {
        Self()
    }

}

#endif
