module register_file_tb();

	logic clk;
	logic rst;
	logic [3:0] RA1, RA2, RA3;
	logic [31:0] WD3, R15, RD1, RD2;
	logic WE3;
	
	register_file register_file_inst(clk, rst, RA1, RA2, RA3, WD3, R15, WE3, RD1, RD2);
	
	always begin
	
		clk = 1; #50; clk = 0; #50;
	
	end
	
	initial begin
		
		
		clk = 1;
		rst = 1;
		
		#50
		
		rst = 0;
		
		RA1 = 4'b0000;
		RA2 = 4'b0001;
		RA3 = 4'b1010;
		WD3 = 32'h13650;
		R15 = 32'h00000;
		WE3 = 1'b0;
		
		#50
		
		RA1 = 4'b0000;
		RA2 = 4'b0001;
		RA3 = 4'b1010;
		WD3 = 32'h13650;
		R15 = 32'h00000;
		WE3 = 1'b1;
		
		#50
		
		RA1 = 4'b1010;
		RA2 = 4'b0001;
		RA3 = 4'b1010;
		WD3 = 32'h13650;
		R15 = 32'h00000;
		WE3 = 1'b0;
		
	
	end
	

endmodule