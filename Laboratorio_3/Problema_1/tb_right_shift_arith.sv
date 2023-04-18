module tb_right_shift_arith();
	
		parameter width = 4;
		
		logic [width-1 : 0] in_data, out_data;

		right_shift_arith #(.width(4)) right_shift(in_data, out_data);
		
		initial begin
			in_data = 4'b1010;
			#40
			assert (out_data === 4'b1101);
			$display("Arithmetical right shift passed");
		end
		
endmodule