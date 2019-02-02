import UIKit

// Variables
var str = "Hello, playground"
var numeroString:String = ""

// Constantes
let dummyNum:Int = 3
let digitoStr = "5"
let url:String = "https://www.google.com"

// Optional ----> tipo?
let digitoNum:Int? = Int(digitoStr)
print(digitoNum)
print(dummyNum)

// unwrapping ----> optinal!
let digitoNumUnWrapped = digitoNum!

// INTERFACES = PROTOCOL
protocol Imprimir {
    
    var dato:String { get set }
    func imprimirValores()
    
}

// Struct vs Class
struct Edificio: Imprimir {
    var dato: String = ""
    
    func imprimirValores() {
        print(dato)
    }

    var edad:Int = 0
    var direccion:String = ""
    
    func imprimirDireccion() {
        print(direccion)
    }
    
    mutating func aumentarEdad() {
        edad += 1
    }
}

var flat = Edificio()
flat.direccion = "Av. Republica de Panama 3591 piso 5"


@objc(PersonaNatural)
open class Persona:NSObject {
    
    var edad:Int = 0
    var direccion:String = ""
    
    private func imprimirDireccion() {
        print(direccion)
    }
    
    open func aumentarEdad() {
        edad += 1
    }
}

class Alumno:Persona, Imprimir {
    
    var dato: String = "" {
        willSet {
            print("Antiguo: \(dato)")
            print("Nuevo: \(newValue)")
        }
        didSet {
            print("Antiguo: \(oldValue)")
            print("Nuevo: \(dato)")
        }
    }
    
    // JAVA
//public void SetValue(String value)
//{
//    // willSet
//    this.value = value;
//    // didSet
//}
    
    func imprimirValores() {
        print(dato)
    }
    
    override func aumentarEdad() {
        edad += 2
    }
}

var estudante = Alumno()
estudante.direccion = "Av ABC 123"
estudante.aumentarEdad()
print(estudante.edad)

estudante.dato = "E3"

// IF LET
//    if valor == nil {
//        return -1
//    } else {
//        return valor!
//    }

func castPostive(str:String) -> Int {
    if let realValue = Int(str) {
        return realValue
    }
    return -1
}

func castPostive2(str:String) -> Int {
    guard let realValue = Int(str) else {
        return -1
    }
    return realValue
}

/// LIST and FOR
let a = 3
let range = a..<5
for i in range {
    print(i)
}

let nombres:[String] = []
let apellidos = [String]()

// Objective-C id   = Swift AnyObject
let elements:[Any] = ["2", 3, 4.5]
let str2 = elements[0] as? String

for x in elements {
    print(x)
}

// Dictionary
let di:[String:Any] = ["nombre":"Arturo",
                       "edad":30]
let nombreDic:Any? = di["nombre"]
let nombre2 = nombreDic as? String ?? ""
print(nombre2)

// ENUM
enum Operacion:String { //Enum RAW VALUE
    
    case suma = "+"
    case resta = "-"
    case multiplicacion = "x"
    case division = "/"
    
    func operar(numeroA a:Int,
                numeroB b:Int) -> Int {
        switch self {
        case .suma:
            return a + b
        case .resta:
            return a - b
        case .multiplicacion:
            return a * b
        case .division:
            return a / b
        }
    }
}

let op2 = Operacion.suma
let op:Operacion = .suma
print(op.rawValue)

let op3 = Operacion(rawValue: "-")
let r = op2.operar(numeroA: 5, numeroB: 3)
print(r)

enum Multiplos {
    
    case multiplicacion(Int, Int)
    case cuadrado(Int)
    case cubo(Int)
    
}

let mp = Multiplos.cubo(4)
let pm2 = Multiplos.multiplicacion(5, 6)

switch mp {
case .multiplicacion(let a, let b):
    print(a * b)
case .cuadrado(let x):
    print(x * x)
case .cubo(let z):
    print(z * z * z)
}
