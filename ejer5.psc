Algoritmo ejer5
	Repetir
	Escribir "Escriba la opcion deseada"
	Escribir "a) Para sumar dos numeros"
	Escribir "b) Para obtener el promedio de 5 numeros"
	Escribir "c) Para obtener el area de un triangulo"
	Escribir "d) Para obtener la raiz cubica de un numero"
    Escribir "e) Para finalizar el codigo"
	leer opcio
	Segun opcio Hacer
		"a":
			Escribir "Sumar dos numeros"
			Escribir "Ingresa dos numeros"
			Leer c1
			Leer c2
			suma=c1+c2
			Escribir "El resultado de la suma es:"
			Escribir suma 
			
		"b":
			Escribir "Promediar 5 numeros"
			Escribir "Ingresa 5 numeros"
			Mientras (i<=4)
				Leer prom
				resultado=resultado+prom
				i=i+1
			FinMientras
			Escribir "El promedio es"
			resul=resultado/5
			Escribir resul
		"c":
			Escribir "Sacar el area del triangulo"
			Escribir "Ingresa la altura"
			Leer alto
			Escribir "Ingresa la base"
			Leer base
			Escribir "El area del triangulo es"
			triangulo=(alto+base)/2
			Escribir triangulo
		"d":
			Escribir "Obtener la raiz cubica de un numero"
		    Escribir "Ingrese el numero para obtener su raiz"
			Leer ra
			rapo=ra^(1/3)
			Escribir "La raiz es"
			Escribir rapo
		"e":
			e=0
			f=e+1
		De Otro Modo:
			Escribir "ingrese una opcion valida"
	Fin Segun
Hasta Que (f==1)


FinAlgoritmo
