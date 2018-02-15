#	ELIAS GASPAR ARELLANO	IS704205
#	FIBONACCI
.data

.text
##################	Main		##################
main:
	addi $v0, $zero, 0		# Variable de retorno
	addi $a0, $zero, 6		# Parámetro con N
	jal fibonacci			
	addi $s0, $v0, 0		# Rescato valor regresado

	j exit
##################	End Main	##################
##################	Functions	##################
fibonacci:
	addi $sp, $sp, -8		# Guardar en el stack
	sw $ra, 0($sp)			# Dirección para regresar
	sw $a0, 4($sp)			# Versión de N

	slti $t0, $a0, 2		# N < 2
	bne $t0, 1, else
	add $v0, $v0, $a0		# Regresa N junto con los valores de retorno acumulados
	j return
	
else:
	addi $a0, $a0, -1		# Decremento N
	jal fibonacci			# Fibonacci N-1
	addi $a0, $a0, 1		# Le regreso el 1 que le resté
	
	addi $a0, $a0, -2		# Decremento N
	jal fibonacci			# Fibonacci N-2
	
return:
	lw $ra, 0($sp)			# Rescatar dirección para regresar
	lw $a0, 4($sp)			# Rescatar la versión de N
	addi $sp, $sp, 8		# Regresar el stack
	jr $ra
##################	End Functions	##################	
exit: