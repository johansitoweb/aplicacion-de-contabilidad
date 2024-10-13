require 'tk'  

# Variables para mantener el total de ingresos, gastos y saldo  
total_ingresos = 0  
total_gastos = 0  

# Crear la ventana principal  
root = TkRoot.new {  
  title "Aplicación de Contabilidad"  
  minsize(400, 300)  
}  

# Etiquetas y campos de entrada  
TkLabel.new(root) do  
  text "Concepto:"  
  pack { padx 15; pady 5 }  
end  

concepto_entry = TkEntry.new(root)  
concepto_entry.pack { padx 15; pady 5 }  

TkLabel.new(root) do  
  text "Cantidad:"  
  pack { padx 15; pady 5 }  
end  

cantidad_entry = TkEntry.new(root)  
cantidad_entry.pack { padx 15; pady 5 }  

# Función para manejar el registro de ingresos y gastos  
def registrar(tipo, concepto, cantidad, total_ingresos, total_gastos)  
  cantidad = cantidad.to_f  
  if tipo == "Ingreso"  
    total_ingresos += cantidad  
  elsif tipo == "Gasto"  
    total_gastos += cantidad  
  end  
  [total_ingresos, total_gastos]  
end  

# Botón para registrar ingreso  
TkButton.new(root) do  
  text "Registrar Ingreso"  
  command do  
    concepto = concepto_entry.get  
    cantidad = cantidad_entry.get  
    if !concepto.empty? && !cantidad.empty?  
      total_ingresos, total_gastos = registrar("Ingreso", concepto, cantidad, total_ingresos, total_gastos)  
      update_totals(total_ingresos, total_gastos)  
      concepto_entry.delete(0, 'end')  
      cantidad_entry.delete(0, 'end')  
    else  
      Tk.messageBox(message: "Por favor, complete todos los campos.")  
    end  
  end  
  pack { padx 15; pady 10 }  
end  

# Botón para registrar gasto  
TkButton.new(root) do  
  text "Registrar Gasto"  
  command do  
    concepto = concepto_entry.get  
    cantidad = cantidad_entry.get  
    if !concepto.empty? && !cantidad.empty?  
      total_ingresos, total_gastos = registrar("Gasto", concepto, cantidad, total_ingresos, total_gastos)  
      update_totals(total_ingresos, total_gastos)  
      concepto_entry.delete(0, 'end')  
      cantidad_entry.delete(0, 'end')  
    else  
      Tk.messageBox(message: "Por favor, complete todos los campos.")  
    end  
  end  
  pack { padx 15; pady 10 }  
end  

# Etiquetas para mostrar los totales  
totales_label = TkLabel.new(root) do  
  text "Ingresos: $0\nGastos: $0\nSaldo: $0"  
  pack { padx 15; pady 20 }  
end  

# Función para actualizar los totales en la interfaz  
def update_totals(total_ingresos, total_gastos)  
  saldo = total_ingresos - total_gastos  
  totales_label.text = "Ingresos: $#{total_ingresos}\nGastos: $#{total_gastos}\nSaldo: $#{saldo}"  
end  

# Iniciar el bucle principal de la aplicación  
Tk.mainloop