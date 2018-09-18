//
//  Moveable.swift
//
//  Created by Adolfo Vera Blasco on 18/9/18.
//  Copyright © 2018 Adolfo Vera. All rights reserved.
//

public protocol Moveable
{
    associatedtype Element
    
    // Nombre del elemento
    var name: String { get }
    
    /**
        Informa de la intención de otro elemento moverse a una 
        nueva posición.

        Cada elemento debe comprobar si está ocupando la posición 
        que el otro elemento quiere ocupar.

        - Parameters:
            - element: El elemento que quiere moverse
            - position: La nueva posición que quiere ocupar
        - Returns: Si puede moverse a la nueva posición o no
    */
    func element(_ element: Element, willMoveToPosition position: Position) -> Bool
}