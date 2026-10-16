class Nave {
	var property velocidad = 0
	
	method recibirAmenaza()

	method propulsar() {
	  velocidad = (velocidad + 20000).min(300000)
	}

	method prepararViaje() {
	  velocidad = (velocidad + 15000).min(300000)
	}

	method encuentroConEnemigo()
}


class NaveDeCarga inherits Nave{

	var property carga = 0

	method sobrecargada() = carga > 100000

	method excedidaDeVelocidad() = velocidad > 100000

	override method recibirAmenaza() {
		carga = 0
	}
	
	method enFalta() = self.sobrecargada() and self.excedidaDeVelocidad()
	
	method acercamientoDeControl() {
		if (self.enFalta()) {
			self.recibirAmenaza()
		}
	}

	override method encuentroConEnemigo() {
	  self.recibirAmenaza()
	  self.propulsar()
	}
}

class NaveDePasajeros inherits Nave{

	var property alarma = false
	const cantidadDePasajeros = 0

	method tripulacion() = cantidadDePasajeros + 4

	method velocidadMaximaPermitida() = 300000 / self.tripulacion() - if (cantidadDePasajeros > 100) 200 else 0

	method estaEnPeligro() = velocidad > self.velocidadMaximaPermitida() or alarma

	override method recibirAmenaza() {
		alarma = true
	}

	override method encuentroConEnemigo() {
	  self.recibirAmenaza()
	  self.propulsar()
	}
}

class NaveDeCombate inherits Nave{
	var property modo = reposo
	const property mensajesEmitidos = []

	method emitirMensaje(mensaje) {
		mensajesEmitidos.add(mensaje)
	}
	
	method ultimoMensaje() = mensajesEmitidos.last()

	method estaInvisible() = velocidad < 10000 and modo.invisible()

	override method recibirAmenaza() {
		modo.recibirAmenaza(self)
	}

	override method prepararViaje() {
	  super()
	  modo.prepararViaje(self)
	}

	override method encuentroConEnemigo() {
	  self.recibirAmenaza()
	}
}

object reposo {

	method invisible() = false

	method recibirAmenaza(nave) {
		nave.emitirMensaje("¡RETIRADA!")
	}

	method prepararViaje(nave) {
		nave.emitirMensaje("Saliendo en misión")
		nave.modo(ataque)
	}

}

object ataque {

	method invisible() = true

	method recibirAmenaza(nave) {
		nave.emitirMensaje("Enemigo encontrado")
	}

	method prepararViaje(nave) {
		nave.emitirMensaje("Volviendo a la base")
	}

}

class NaveResiduosRadioctivas inherits NaveDeCarga {
	var property selladaAlVacio = false
	
	override method recibirAmenaza() {
	  self.reducirVelocidad()
	}

	override method prepararViaje() {
	  super() // utilizo super para indicar que usare lo que tenga el mensaje original en la super clase
	  self.cerrarseAlVacio()
	}

	method reducirVelocidad() {
	  velocidad = 0
	}

	method cerrarseAlVacio() {
	  selladaAlVacio = true
	}

	override method encuentroConEnemigo() {
	  self.recibirAmenaza()
	  self.propulsar()
	}
}


