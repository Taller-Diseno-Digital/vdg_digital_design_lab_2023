module tb_fsm();
    logic clk, rst, btn_izquierda, btn_derecha, btn_abajo, btn_arriba;
    logic [2:0] movement;

    fsm #(.width(4)) dut1(clk, rst, btn_izquierda, btn_derecha, btn_abajo, btn_arriba, movement);

    initial begin
        clk = 1'b0;
        rst = 1'b0;
        btn_izquierda = 1'b0;
        btn_derecha = 1'b0;
        btn_arriba = 1'b0;
        btn_abajo = 1'b0 ;
		movement = 3'b000;
		#100;
		  
        btn_izquierda = 1'b1;
        btn_derecha = 1'b1;
        btn_arriba = 1'b1;
        btn_abajo = 1'b1 ;
        #50;
		assert (movement == 3'b000) 
        else   $error("Caso de inicio");
		  

        btn_izquierda = 1'b0;
        #50;
		assert (movement == 3'b001) 
        else   $error("Caso izquierda");

        
        btn_derecha = 1'b0;
        #50;
		assert (movement == 3'b010) 
        else   $error("Caso derecha");
		  

        btn_arriba = 1'b0;
        #50;
		assert (movement == 3'b011) 
        else   $error("Caso arriba");

        rst = 1'b1;
        #50;
		assert (movement == 3'b000) 
        else   $error("Reset");

        rst = 1'b0;
        btn_abajo = 1'b0 ;
        #50;
		assert (movement == 3'b100) 
        else   $error("Caso abajo");

    end

endmodule