//
//  Manager.swift
//
//  Created by Adolfo Vera Blasco on 18/9/18.
//  Copyright © 2018 Adolfo Vera. All rights reserved.
//

public class Manager
{
    /// Los elementos que nos toca controlar
    public var elements: [Robot]?

    /**
        Nos preparamos para registrar nuevos elementos
    */
    public init()
    {
        self.elements = [Robot]()
    }

    //
    // MARK: - Helper Methos
    //

    /**
        Construimos un nuevo robot
    */
    public func makeRobot(named name: String) -> Robot
    {
        var robot = Robot(named: name)
        
        robot.position = Position(x: 0, y: 0, floor: 0)
        robot.manager = self
        
        
        return robot
    }
}

extension Manager: Controlling
{
    /**
        Damos de alta un robot que pasa a estar
        bajo nuestro control
    */
    public func register(_ element: Robot) -> Void
    {
        self.elements?.append(element)
    }

    /**
        Damos de baja un robot. 
    */
    public func unregister(_ element: Robot) -> Void 
    {
        self.elements?.remove(at: 0)
    }

    /**
        Comprobamos si el cambio de posición que nos pide
        unos de nuestros robots está permitido.

        - Parameters:
            - position: La nueva posición 
            - element: Quien la pide
        - Returns: Si es un movimiento válido
    */
    public func checkMovement(to position: Position, from element: Robot) -> Bool
    {
        guard let elements = self.elements else
        {
            return false
        }
        
        let elementsCount = elements.filter({ $0.position == position }).count

        
        return (elementsCount == 0)
    }
}