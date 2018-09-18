//
//  Position.swift
//
//  Created by Adolfo Vera Blasco on 18/9/18.
//  Copyright © 2018 Adolfo Vera. All rights reserved.
//

public struct Position
{
    /**
        Movimiento permitidos que implican
        un cambio de posición.
    */
    public enum Movement
    {
        // Adelante
        case forward
        // Atrás
        case backward
        // Izquierda
        case left
        // Derecha
        case right
        // Subir
        case up
        // Bajar
        case down
    }
    
    // Posición el eje X
    public var x: Int
    // Posición el eje Y
    public var y: Int
    // Posición el el eje Z
    public var floor: Int
    
    /**
        Cambia los valores de los ejes en función 
        del movimiento solicitado.

        - Parameter movement: Hacia donde nos queremos mover
    */
    public mutating func change(to movement: Movement) -> Void
    {
        switch movement
        {
            case .forward:
                self.x += 1
            case .backward:
                self.x -= 1
            case .left:
                self.y -= 1
            case .right:
                self.y += 1
            case .up:
                self.floor += 1
            case .down:
                self.floor -= 1
        }
    }
}

extension Position: Equatable
{
    /**
        Comprueba si dos posiciones son iguales
    */  
    public static func ==(lhs: Position, rhs: Position) -> Bool
    {
        //print(lhs)
        //print(rhs)
        if lhs.floor == rhs.floor
        {
            if (lhs.x == rhs.x) && (lhs.y == rhs.y)
            {
                return true
            }
        }

        return false
    }

    /**
        Comprueba si dos posiciones son distintas
    */
    public static func !=(lhs: Position, rhs: Position) -> Bool
    {
        return !(lhs == rhs)
    }
}
