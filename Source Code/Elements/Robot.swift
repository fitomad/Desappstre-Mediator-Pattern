//
//  Robot.swift
//
//  Created by Adolfo Vera Blasco on 18/9/18.
//  Copyright © 2018 Adolfo Vera. All rights reserved.
//

public class Robot
{
    /// Nombre del robot
    public var name: String
    /// Número de serie
    public let serialNumber: String
    /// La posición que ocupada
    public var position: Position?

    /// El manager que se encarga de 
    /// gestionar los movimiento en su 
    /// área de influencia
    public var manager: Manager?
    {
        didSet
        {
            if let manager = self.manager
            {
                manager.register(self)
            }
        }
    }

    /**
        Contruimos un nuevo robot
    */
    public init(named name : String)
    {
        self.name = name
        self.serialNumber = UUID().uuidString
    }
    
    /**
        Procesamos un cambio de posición a petición
        del robot.

        Le pasamos la nueva posición que queremos ocupar
        al `manager` para que se encargue de comprobar
        si es un movimiento válido.

        - Parameter movement: El movimiento que queremos realizar
    */
    public func changePosition(to movement: Position.Movement) -> Void
    {
        guard let manager = self.manager, var position = self.position else
        {
            return
        }
        
        var newPosition = position
        newPosition.change(to: movement)
        
        if manager.checkMovement(to: newPosition, from: self)
        {
            print("\(self.name) moves to \(newPosition)")
            self.position = newPosition
        }
        else
        {
            print("*** \(self.name) move not allowed ")
        }
    }
}

extension Robot: Moveable
{
    /**
        Un elemento nos solicita permiso para cambiar de posición

        - Parameters:
            - element: Quien solicita el cambio
            - position: Donde quiere ir
    */
    public func element(_ element: Robot, willMoveToPosition position: Position) -> Bool
    {
        if position == self.position
        {
            return false
        }

        return true
    }
}
