import Aparatos.*

class Paciente {
	var edad
	var fortaleza
	var dolor
	const rutina = []
	
	method edad()=edad
	method fortaleza()=fortaleza
	method dolor()=dolor
	
	method puedeUsar(unAparato){
		return unAparato.puedeSerUsado(self)
	}
	
	method usar(unAparato){
		if(unAparato.puedeSerUsado(self) ){
			unAparato.usar(self)
		}else{
			self.error("No se puede usar el aparato")
		}
	}
	
	method disminuirDolor(unaCantidad){
		dolor = 0.max( dolor - unaCantidad)
	}
	
	method aumentarFortaleza(unaCantidad){
		fortaleza = 0.max(fortaleza + unaCantidad)
	}
	
	method puedeHacerLaRutina(){
		return rutina.all({aparato=>aparato.puedeSerUsado(self)})
	}
	
	method hacerRutina(){
		if(self.puedeHacerLaRutina()){
			 rutina.forEach({aparato=>self.usar(aparato)})
		}else{
			self.error("No se puede realizar la rutina")
		}
	}
	
}

class Resistente inherits Paciente{
	
	override method usar(unAparato){
		super(unAparato)
		self.aumentarFortaleza(1)
	}
	
}

class Caprichoso inherits Paciente{
	
	method hayAlgunoRojo(){
		return rutina.any({aparato=>aparato.color()=="rojo"})
	}
	
	override method puedeHacerLaRutina(){
		return super() and self.hayAlgunoRojo()
	}
	
	override method hacerRutina(){
		super()
		super()
	}
}

class RapidaRecuperacion inherits Paciente{
	override method hacerRutina(){
		super()
		self.disminuirDolor(recuperacion.valor())
	}
}

object recuperacion{
	var property valor = 3
	
}

