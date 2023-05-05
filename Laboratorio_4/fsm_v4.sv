module fsm_v4(

    input   logic          clk,  

    input   logic          rst,  

    input   logic          btn_izquierda,  

    input   logic          btn_derecha,  

    input   logic          btn_abajo,  

    input   logic          btn_arriba,  
	 
	 input	logic				flag,

    output  logic  [2: 0]  movement,
	 output logic [2:0] estado_s); 

                                // 0         1          2        3      4			5				6		7
    typedef enum logic [ 2 : 0 ] {inicio, izquierda, derecha, arriba, abajo, perdioGano, espera, control} statetype;

    statetype estado, estado_sig;
	 
	 //logic pressed_bottom;

	
    always_ff @(posedge clk or posedge rst) begin

        if (rst)  estado = inicio;

        else         estado = estado_sig;

    end

    always_comb begin
	 

        case (estado)


            inicio: begin
				
					 //pressed_bottom = 0;

                if (!btn_izquierda)    estado_sig = izquierda;

                else if(!btn_derecha)    estado_sig = derecha;

                else if(!btn_arriba)     estado_sig = arriba;
                
                else if(!btn_abajo)     estado_sig = abajo;
                
                else          estado_sig = inicio;

            end
       

            izquierda: begin 
				
					 if (flag) estado_sig = perdioGano;
					 
					 else if(!btn_izquierda) begin
						//pressed_bottom = 1;
						estado_sig = izquierda;
					 end

                else          estado_sig = control;

            end
				
            derecha: begin
					 
					 if (flag) estado_sig = perdioGano;
					 
					 else if(!btn_derecha) begin
						//pressed_bottom = 1;
						estado_sig = derecha;
					 end

                else          estado_sig = control;

            end
				
            arriba: begin		 
					 
					 if (flag) estado_sig = perdioGano;
					 
					 else if(!btn_arriba) begin
						//pressed_bottom = 1;
						estado_sig = arriba;
					 end

                else          estado_sig = control;

            end
				
            abajo: begin
				
					 if (flag) estado_sig = perdioGano;
					 
					 else if(!btn_abajo) begin
						//pressed_bottom = 1;
						estado_sig = abajo;
					 end

                else          estado_sig = control;

            end
				
            perdioGano: begin
					 estado_sig = perdioGano;

            end
				
            espera: begin
				
				
					 if (flag)	estado_sig = perdioGano;

                else if (btn_izquierda & btn_derecha & btn_arriba & btn_abajo)    estado_sig = control;
                
                else          estado_sig = espera;

            end
				
            control: begin
				
					 //pressed_bottom = 0;
				
					 if (flag)	estado_sig = perdioGano;

                else if (!btn_izquierda)    estado_sig = izquierda;

                else if(!btn_derecha)    estado_sig = derecha;

                else if(!btn_arriba)     estado_sig = arriba;
                
                else if(!btn_abajo)     estado_sig = abajo;
                
                else          estado_sig = control;
            end
				
        endcase
    end
	/*
	assign movement = (estado == izquierda) ? 3'b001  : 
            (estado == derecha) ? 3'b010 : 
            (estado == arriba) ? 3'b0011 : 
            (estado == abajo) ? 3'b100 : 
				(estado == perdioGano) ? 3'b101 : 
				(estado == espera) ? 3'b110 :
				(estado == control) ? 3'b111 :
            3'b000; 
		*/
	//assign movement = (pressed_bottom == 1) ? 3'b110 : estado
	assign movement = estado;
	
	assign estado_s = estado_sig;
	 
	 endmodule