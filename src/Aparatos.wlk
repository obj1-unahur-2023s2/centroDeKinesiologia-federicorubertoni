import Personas.*

class Aparato {
	var property color = "blanco"
	
	method puedeSerUsado(unPaciente) = true
	method usar(unPaciente)
	method necesitaMantenimiento()
	method hacerMantenimiento()
	
}

class Magneto inherits Aparato{
	var imantacion = 800
	
	override method puedeSerUsado(unPaciente){
		return true
	}
	
	override method usar(unPaciente){
		unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
		self.disminuirImantacion()
	}
	
	method disminuirImantacion(){
		imantacion = 0.max(imantacion - 1)
	}
	
	override method necesitaMantenimiento(){
		return imantacion < 100
	}
	
	override method hacerMantenimiento(){
		imantacion+=500
	}
	
}

class Bicicleta inherits Aparato{
	var aceitePerdido=0
	var tornillosDesajustados=0
	
	override method puedeSerUsado(unPaciente){
		return unPaciente.edad()>8
	}
	
	override method usar(unPaciente){
		
	if(unPaciente.dolor()>30){
		self.aflojarTornillos()
		if(unPaciente.edad().between(30,50)){
			self.perderAceite()
		}
	}
		
		unPaciente.disminuirDolor(4)
		unPaciente.aumentarFortaleza(3)
	}
		
	method aflojarTornillos(){
		tornillosDesajustados += 1
	}
	
	method perderAceite(){
		aceitePerdido += 1
	}
	
	override method necesitaMantenimiento(){
		return tornillosDesajustados >= 10 or aceitePerdido >= 5
	}
	
	override method hacerMantenimiento(){
		aceitePerdido = 0
		tornillosDesajustados = 0
	}

	
}

class Minitramp inherits Aparato{
	
	override method puedeSerUsado(unPaciente){
		return unPaciente.dolor()<20
	}
	
	override method usar(unPaciente){
		unPaciente.aumentarFortaleza(unPaciente.edad()*0.1)
	}
	
	override method necesitaMantenimiento(){return false}
	
	override method hacerMantenimiento(){}
	
}
