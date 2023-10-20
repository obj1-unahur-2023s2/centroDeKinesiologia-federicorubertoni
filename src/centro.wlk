import Personas.*
import Aparatos.*

object centro {
	
	const aparatos = []
	const pacientes = #{}
	
	method agregarPaciente(listaPacientes){pacientes.add(listaPacientes)}
	method agregarAparatos(listaAparatos){aparatos.addAll(listaAparatos)}
	
	method coloresDeAparato(){
		return aparatos.map({aparato=>aparato.color()}).asSet()
	}
	
	method pacientesMenoresDe8(){
		return pacientes.filter({paciente=>paciente.edad()<8})
	}
	
	method cantidadQueNoCumplen(){
		return pacientes.count({paciente=>not paciente.puedeHacerLaRutina()})
}
	method estaEnOptimasCondiciones(){
		return aparatos.all({aparato=>not aparato.necesitaMantenimiento()})
	}
	
	method estaOptimoConAny(){
		return not aparatos.any({aparato=>aparato.necesitaMantenimiento()})
	}
	
	method aparatosComplicados(){
		return aparatos.filter({aparato=>aparato.necesitaMantenimiento()})
	}
	
	method estaComplicada(){
		return self.aparatosComplicados().size() >= aparatos.size()/2
	}
	
	method visitaTecnica(){
		return self.aparatosComplicados().forEach({aparato=>aparato.hacerMantenimiento()})
	}
	
}
