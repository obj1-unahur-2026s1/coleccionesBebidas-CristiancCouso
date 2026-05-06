object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {
  const nutrientes = [3,8,5,10,7]
  method rendimientoQueOtorga(dosisConsumida) = nutrientes.sum() * (dosisConsumida / 1000)
  method agregarNutrientes(unNutriente) {
    nutrientes.add(unNutriente)
  }
}

object aguaSaborizada {
  var  otraBebida = terere
  method cambiarOtraBebida(nuevaBebida) {otraBebida = nuevaBebida}
  method rendimientoQueOtorga(dosisConsumida) =  1 +  otraBebida.rendimientoQueOtorga(dosisConsumida/4) 
}

object coctel {
  const bebidas = []
  method rendimientoQueOtorga(dosisConsumida) {
    return bebidas.map({r => r.rendimientoQueOtorga(self.dosisFragmentada(dosisConsumida))}).fold(1,{acum,item => acum * item})
  }
  method dosisFragmentada(dosisConsumida) = dosisConsumida / bebidas.size()

  method agregarBebida(unaBebida) {
    bebidas.add(unaBebida)
  }

}
