
`timescale 1ns / 1ps
`default_nettype none


module tb_ram_accumulator();
	localparam RATE    = 1000.0/200.0;
	
	initial begin
		$dumpfile("tb_ram_accumulator.vcd");
		$dumpvars(0, tb_ram_accumulator);
		
//		#100000;
//			$finish;
	end
	
	reg		clk = 1'b1;
	always #(RATE/2.0)	clk = ~clk;
	
	reg		reset = 1'b1;
	initial #(RATE*100.5)	reset = 1'b0;
	
	parameter	ADDR_WIDTH   = 3;
	parameter	DATA_WIDTH   = 8;
	parameter	MEM_SIZE     = (1 << ADDR_WIDTH);
	
	integer		i;
	reg		[DATA_WIDTH-1:0]	mem_exp		[0:MEM_SIZE-1];
	initial begin
		for ( i = 0; i < MEM_SIZE; i = i+1 ) begin
			mem_exp[i] = 0;
		end
	end
	
	
	reg		[ADDR_WIDTH-1:0]	acc_addr;
	reg		[DATA_WIDTH-1:0]	acc_data;
	reg		[0:0]				acc_operation;
	reg							acc_valid;
	
	reg		[ADDR_WIDTH-1:0]	exp_addr;
	reg		[DATA_WIDTH-1:0]	exp_prev;
	reg		[DATA_WIDTH-1:0]	exp_data;
	reg							exp_valid;
	
	always @(posedge clk) begin
		if ( reset ) begin
			acc_valid <= 1'b0;
		end
		else begin
			acc_addr      <= {$random};
			acc_data      <= {$random};
			acc_operation <= {$random};
			acc_valid     <= {$random};
			
			// exp
			exp_valid = acc_valid;
			if ( acc_valid ) begin
				exp_prev = mem_exp[acc_addr];
				if ( acc_operation == 1'b0 ) begin
					mem_exp[acc_addr] = mem_exp[acc_addr] + acc_data;
				end
				else begin
					mem_exp[acc_addr] = mem_exp[acc_addr] - acc_data;
				end
				exp_addr = acc_addr;
				exp_data = mem_exp[acc_addr];
			end
		end
	end
	
	reg							mem_en   = 0;
	reg							mem_we   = 0;
	reg		[ADDR_WIDTH-1:0]	mem_addr = 0;
	reg		[DATA_WIDTH-1:0]	mem_din  = 0;
	wire	[DATA_WIDTH-1:0]	mem_dout;
	
	jelly_ram_accumulator
			#(
				.ADDR_WIDTH		(ADDR_WIDTH),
				.DATA_WIDTH		(DATA_WIDTH),
				.MEM_SIZE		(MEM_SIZE),
				
				.FILLMEM		(1),
				.FILLMEM_DATA	(0)
			)
		i_ram_accumulator
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(1'b1),
				
				.acc_addr		(acc_addr),
				.acc_data		(acc_data),
				.acc_operation	(acc_operation),
				.acc_valid		(acc_valid),
				
				.mem_en			(mem_en),
				.mem_we			(mem_we),
				.mem_addr		(mem_addr),
				.mem_din		(mem_din),
				.mem_dout		(mem_dout)
			);
	
	initial begin
		#100000;
		@(negedge clk)
			mem_en = 1'b1;
		@(negedge clk)
		@(negedge clk)
		
		for ( i = 0; i < MEM_SIZE; i = i+1 ) begin
			$display("exp[%h]:%h", i, mem_exp[i]);
		end
		
		for ( i = 0; i < MEM_SIZE; i = i+1 ) begin
			@(negedge clk)
			mem_addr = mem_addr + 1;
			$display("mem:%h", mem_dout);
		end
		@(negedge clk)
			$display("mem:%h", mem_dout);
		@(negedge clk)
			$display("mem:%h", mem_dout);
		@(negedge clk)
			$display("mem:%h", mem_dout);
		
		$finish;
	end
	
	
endmodule


`default_nettype wire


// end of file