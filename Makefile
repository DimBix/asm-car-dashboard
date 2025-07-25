AS_flags= --32 -gstabs

LD_flags= -m elf_i386

	
asm: asm.o funz_1_op_testo.o funz_2_op_testo.o funz_3_op_testo.o funz_4_op_testo.o funz_5_op_testo.o funz_6_op_testo.o funz_7_op_testo.o funz_7_op_alt_testo.o funz_8_op_menu_testo.o funz_8_op_testo.o funz_8_op_alt_testo.o funz_1_op.o funz_2_op.o funz_3_op.o funz_4_op.o funz_5_op.o funz_6_op.o funz_7_op.o funz_8_op.o tab_funz.o punt.o int2str.o str2int.o newline.o pulizia.o
	ld $(LD_flags) -o bin/asm obj/asm.o obj/funz_1_op_testo.o obj/funz_2_op_testo.o obj/funz_3_op_testo.o obj/funz_4_op_testo.o obj/funz_5_op_testo.o obj/funz_6_op_testo.o obj/funz_7_op_testo.o obj/funz_7_op_alt_testo.o obj/funz_8_op_menu_testo.o obj/funz_8_op_testo.o obj/funz_8_op_alt_testo.o obj/funz_1_op.o obj/funz_2_op.o obj/funz_3_op.o obj/funz_4_op.o obj/funz_5_op.o obj/funz_6_op.o obj/funz_7_op.o obj/funz_8_op.o obj/tab_funz.o obj/punt.o obj/str2int.o obj/int2str.o obj/newline.o obj/pulizia.o

asm.o:
	as $(AS_flags) -o obj/asm.o src/asm.s
  
funz_1_op.o:
	as $(AS_flags) -o obj/funz_1_op.o src/Opzione_1_funz.s
	
funz_2_op.o:
	as $(AS_flags) -o obj/funz_2_op.o src/Opzione_2_funz.s
	
funz_3_op.o:
	as $(AS_flags) -o obj/funz_3_op.o src/Opzione_3_funz.s

funz_4_op.o:
	as $(AS_flags) -o obj/funz_4_op.o src/Opzione_4_funz.s
	
funz_5_op.o:
	as $(AS_flags) -o obj/funz_5_op.o src/Opzione_5_funz.s
		
funz_6_op.o:
	as $(AS_flags) -o obj/funz_6_op.o src/Opzione_6_funz.s
			
funz_7_op.o:
	as $(AS_flags) -o obj/funz_7_op.o src/Opzione_7_funz.s
	
funz_8_op.o:
	as $(AS_flags) -o obj/funz_8_op.o src/Opzione_8_funz.s
	
funz_1_op_testo.o:
	as $(AS_flags) -o obj/funz_1_op_testo.o src/Opzione_1_testo_funz.s
	
funz_2_op_testo.o:
	as $(AS_flags) -o obj/funz_2_op_testo.o src/Opzione_2_testo_funz.s
	
funz_3_op_testo.o:
	as $(AS_flags) -o obj/funz_3_op_testo.o src/Opzione_3_testo_funz.s
	
funz_4_op_testo.o:
	as $(AS_flags) -o obj/funz_4_op_testo.o src/Opzione_4_testo_funz.s
	
funz_5_op_testo.o:
	as $(AS_flags) -o obj/funz_5_op_testo.o src/Opzione_5_testo_funz.s
		
funz_6_op_testo.o:
	as $(AS_flags) -o obj/funz_6_op_testo.o src/Opzione_6_testo_funz.s

funz_7_op_testo.o:
	as $(AS_flags) -o obj/funz_7_op_testo.o src/Opzione_7_testo_funz.s
	
funz_7_op_alt_testo.o:
	as $(AS_flags) -o obj/funz_7_op_alt_testo.o src/Opzione_7_testo_alternativa_funz.s
		
funz_8_op_alt_testo.o:
	as $(AS_flags) -o obj/funz_8_op_alt_testo.o src/Opzione_8_testo_alternativa_funz.s
	
funz_8_op_testo.o:
	as $(AS_flags) -o obj/funz_8_op_testo.o src/Opzione_8_testo_funz.s
		
funz_8_op_menu_testo.o:
	as $(AS_flags) -o obj/funz_8_op_menu_testo.o src/Opzione_8_testo_menu_funz.s
	
tab_funz.o:
	as $(AS_flags) -o obj/tab_funz.o src/Tab_funz.s
	
punt.o:
	as $(AS_flags) -o obj/punt.o src/punt.s

int2str.o:
	as $(AS_flags) -o obj/int2str.o src/int_to_str_funz.s
	
str2int.o:
	as $(AS_flags) -o obj/str2int.o src/str_to_int_funz.s
	
newline.o:
	as $(AS_flags) -o obj/newline.o src/New_line_funz.s
	
pulizia.o:
	as $(AS_flags) -o obj/pulizia.o src/pulizia.s
	
clean:
	rm obj/*.o bin/asm

