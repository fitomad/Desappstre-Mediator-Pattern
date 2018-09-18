//
//  main.swift
//
//  Created by Adolfo Vera Blasco on 18/9/18.
//  Copyright © 2018 Adolfo Vera. All rights reserved.
//

var manager = Manager()

var r2d2 = manager.makeRobot(named: "R2-D2")
var c3po = manager.makeRobot(named: "C3-PO")


r2d2.changePosition(to: .left)
c3po.changePosition(to: .right)

r2d2.changePosition(to: .forward)
c3po.changePosition(to: .forward)

r2d2.changePosition(to: .right)
c3po.changePosition(to: .left) // Vas a chocar, R2-D2 está en esa posición