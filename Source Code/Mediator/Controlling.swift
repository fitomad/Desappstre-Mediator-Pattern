//
//  Controlling.swift
//
//  Created by Adolfo Vera Blasco on 18/9/18.
//  Copyright © 2018 Adolfo Vera. All rights reserved.
//

public protocol Controlling
{
    associatedtype Element

    /// Todos los elementos que hay en el sistema
    var elements: [Element]? { get }

    /**
        Damos de alta un nuevo elemento
    */
    func register(_ element: Element) -> Void

    /**
        Damos de bajo un elemento
    */
    func unregister(_ element: Element) -> Void 

    /**
        Da respuesta a la petición de un elemento de
        moverse a una nueva posición.

        Le pregunta a los elementos de `elements` si alguno
        está ocupando esa posición.

        - Parameters:
            - position: La posición que se quiere ocupar
            - element: Quien la quiere ocupar
        - Returns: Si el movimiento es válido
    */
    func checkMovement(to position: Position, from element: Element) -> Bool
}