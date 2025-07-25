AS_flags= --32 -gstabs

LD_flags= -m elf_i386

BIN_DIR = bin
OBJ_DIR = obj
SRC_DIR = src


asm: create_obj_dir create_bin_dir asm.o funz_1_op_testo.o funz_2_op_testo.o funz_3_op_testo.o funz_4_op_testo.o funz_5_op_testo.o funz_6_op_testo.o funz_7_op_testo.o funz_7_op_alt_testo.o funz_8_op_menu_testo.o funz_8_op_testo.o funz_8_op_alt_testo.o funz_1_op.o funz_2_op.o funz_3_op.o funz_4_op.o funz_5_op.o funz_6_op.o funz_7_op.o funz_8_op.o tab_funz.o punt.o int2str.o str2int.o newline.o pulizia.o
	ld $(LD_flags) -o $(BIN_DIR)/asm $(OBJ_DIR)/asm.o $(OBJ_DIR)/funz_1_op_testo.o $(OBJ_DIR)/funz_2_op_testo.o $(OBJ_DIR)/funz_3_op_testo.o $(OBJ_DIR)/funz_4_op_testo.o $(OBJ_DIR)/funz_5_op_testo.o $(OBJ_DIR)/funz_6_op_testo.o $(OBJ_DIR)/funz_7_op_testo.o $(OBJ_DIR)/funz_7_op_alt_testo.o $(OBJ_DIR)/funz_8_op_menu_testo.o $(OBJ_DIR)/funz_8_op_testo.o $(OBJ_DIR)/funz_8_op_alt_testo.o $(OBJ_DIR)/funz_1_op.o $(OBJ_DIR)/funz_2_op.o $(OBJ_DIR)/funz_3_op.o $(OBJ_DIR)/funz_4_op.o $(OBJ_DIR)/funz_5_op.o $(OBJ_DIR)/funz_6_op.o $(OBJ_DIR)/funz_7_op.o $(OBJ_DIR)/funz_8_op.o $(OBJ_DIR)/tab_funz.o $(OBJ_DIR)/punt.o $(OBJ_DIR)/str2int.o $(OBJ_DIR)/int2str.o $(OBJ_DIR)/newline.o $(OBJ_DIR)/pulizia.o

create_obj_dir:
	mkdir -p $(OBJ_DIR)

create_bin_dir:
	mkdir -p $(BIN_DIR)

asm.o:
	as $(AS_flags) -o $(OBJ_DIR)/asm.o $(SRC_DIR)/asm.s
  
funz_1_op.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_1_op.o $(SRC_DIR)/Opzione_1_funz.s
	
funz_2_op.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_2_op.o $(SRC_DIR)/Opzione_2_funz.s
	 
funz_3_op.o: 
	as $(AS_flags) -o $(OBJ_DIR)/funz_3_op.o $(SRC_DIR)/Opzione_3_funz.s
 
funz_4_op.o: 
	as $(AS_flags) -o $(OBJ_DIR)/funz_4_op.o $(SRC_DIR)/Opzione_4_funz.s
	 
funz_5_op.o: 
	as $(AS_flags) -o $(OBJ_DIR)/funz_5_op.o $(SRC_DIR)/Opzione_5_funz.s
		 
funz_6_op.o: 
	as $(AS_flags) -o $(OBJ_DIR)/funz_6_op.o $(SRC_DIR)/Opzione_6_funz.s
			 
funz_7_op.o: 
	as $(AS_flags) -o $(OBJ_DIR)/funz_7_op.o $(SRC_DIR)/Opzione_7_funz.s
	 
funz_8_op.o: 
	as $(AS_flags) -o $(OBJ_DIR)/funz_8_op.o $(SRC_DIR)/Opzione_8_funz.s
	
funz_1_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_1_op_testo.o $(SRC_DIR)/Opzione_1_testo_funz.s
	
funz_2_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_2_op_testo.o $(SRC_DIR)/Opzione_2_testo_funz.s

funz_3_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_3_op_testo.o $(SRC_DIR)/Opzione_3_testo_funz.s

funz_4_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_4_op_testo.o $(SRC_DIR)/Opzione_4_testo_funz.s
	
funz_5_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_5_op_testo.o $(SRC_DIR)/Opzione_5_testo_funz.s

funz_6_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_6_op_testo.o $(SRC_DIR)/Opzione_6_testo_funz.s

funz_7_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_7_op_testo.o $(SRC_DIR)/Opzione_7_testo_funz.s
	
funz_7_op_alt_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_7_op_alt_testo.o $(SRC_DIR)/Opzione_7_testo_alternativa_funz.s

funz_8_op_alt_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_8_op_alt_testo.o $(SRC_DIR)/Opzione_8_testo_alternativa_funz.s

funz_8_op_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_8_op_testo.o $(SRC_DIR)/Opzione_8_testo_funz.s
		
funz_8_op_menu_testo.o:
	as $(AS_flags) -o $(OBJ_DIR)/funz_8_op_menu_testo.o $(SRC_DIR)/Opzione_8_testo_menu_funz.s

tab_funz.o:
	as $(AS_flags) -o $(OBJ_DIR)/tab_funz.o $(SRC_DIR)/Tab_funz.s

punt.o:
	as $(AS_flags) -o $(OBJ_DIR)/punt.o $(SRC_DIR)/punt.s

int2str.o:
	as $(AS_flags) -o $(OBJ_DIR)/int2str.o $(SRC_DIR)/int_to_str_funz.s

str2int.o:
	as $(AS_flags) -o $(OBJ_DIR)/str2int.o $(SRC_DIR)/str_to_int_funz.s

newline.o:
	as $(AS_flags) -o $(OBJ_DIR)/newline.o $(SRC_DIR)/New_line_funz.s
	
pulizia.o:
	as $(AS_flags) -o $(OBJ_DIR)/pulizia.o $(SRC_DIR)/pulizia.s

clean:
	rm $(OBJ_DIR)/*.o $(BIN_DIR)/asm

