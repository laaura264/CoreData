//
//  ViewController.swift
//  CoreData
//
//  Created by Laura Arranz on 05/02/2019.
//  Copyright © 2019 Laura Arranz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let context = context {
            //Crear un objeto y guardarlo
            let person = Person(context: context) //Pasarle el contexto que se ha obtenido en el appDelegate (didFinishLaunchingWithOptions)
            person.firstname = "Nadie"
            person.lastname = "Zaragoza"
            person.phone = 999001122
            
            do {
                //Cosas que pueden fallar
                try context.save()
            } catch {
                print("Error guardando en Core Data")
            }
            
            //Hacer una consulta para recuperar todas las personas que hay en BBDD
            let request : NSFetchRequest<Person> = Person.fetchRequest() //Petición para recuperar las personas que hay en la BBDD
            /*let predicate = NSPredicate(format: "nombre = 'Miguel'")
            request.predicate = predicate*/
            
            //Select que ordene por lastname
            let sortDescriptor =  NSSortDescriptor(key: "lastname", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            
            do {
               //Devuelve un array de objetos de tipo person
                let people = try context.fetch(request)
                for person in people {
                    print("Nombres: ",person.firstname)
                }
            } catch {
                print("Error consultando en Core Data")
            }
            
            //Borrar el objeto
            do {
                context.delete(person)
                print("Nombres borrados: ",person.firstname)
            } catch{
                print("Error al borrar el registro")
            }
        
        } else {
            print ("No hay contexto")
        }
    }

    

}

