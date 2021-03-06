// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//                                 Copyright (C) 2008-2015 by Ryuji Fuchikami
//                                 http://ryuz.my.coocan.jp/
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// syncronous reset generator
module jelly_reset
		#(
			parameter	IN_LOW_ACTIVE  = 0,
			parameter	OUT_LOW_ACTIVE = 0,
			parameter	INPUT_REGS     = 2,
			parameter	COUNTER_WIDTH  = 0,
			parameter	COUNTER_VALUE  = {COUNTER_WIDTH{1'b1}},
			parameter	INSERT_BUFG    = 0
		)
		(
			input	wire	clk,
			input	wire	in_reset,		// asyncrnous reset
			output	wire	out_reset		// syncrnous reset
		);
	
	wire	input_reset = IN_LOW_ACTIVE ? ~in_reset : in_reset;
	
	
	// input REGS (remove metastable)
	wire	in_regs_reset;
	generate
	if ( INPUT_REGS > 0 ) begin
		reg		[INPUT_REGS-1:0]	reg_in_reset;
		always @(posedge clk or posedge input_reset) begin
			if ( input_reset ) begin
				reg_in_reset <= {INPUT_REGS{1'b1}};
			end
			else begin
				reg_in_reset <= (reg_in_reset >> 1);
			end
		end
		assign in_regs_reset = reg_in_reset[0];
	end
	else begin
		assign in_regs_reset = input_reset;
	end
	endgenerate
	
	
	// counter
	wire	counter_reset;
	generate
	if ( COUNTER_WIDTH > 0 ) begin
		reg		[COUNTER_WIDTH-1:0]	reg_counter;
		always @(posedge clk or posedge in_regs_reset) begin
			if ( in_regs_reset ) begin
				reg_counter <= COUNTER_VALUE;
			end
			else begin
				if ( reg_counter > 0 ) begin
					reg_counter <= reg_counter - 1'b1;
				end
			end
		end
		assign counter_reset = (reg_counter == 0);
	end
	else begin
		assign counter_reset = in_regs_reset;
	end
	endgenerate
	
	
	// syncrnous reset
	reg		reg_reset;
	always @(posedge clk or posedge counter_reset) begin
		if ( counter_reset ) begin
			reg_reset <= OUT_LOW_ACTIVE ? 1'b0 : 1'b1;
		end
		else begin
			reg_reset <= OUT_LOW_ACTIVE ? 1'b1 : 1'b0;
		end
	end
	
	
	// insert BUFG
	generate
	if ( INSERT_BUFG ) begin
		BUFG	i_bufg	(.I(reg_reset), .O(out_reset));
	end
	else begin
		assign out_reset = reg_reset;
	end
	endgenerate
	
	
endmodule


`default_nettype wire


// end of file
