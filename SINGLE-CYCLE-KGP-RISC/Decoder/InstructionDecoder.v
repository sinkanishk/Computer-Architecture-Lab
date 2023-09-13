`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////

// A very simple module that splits the 32-bit addresse into various parts
module InstructionDecoder( input wire[31:0] instruction,
								output wire [5:0] opcode, 
								output wire [4:0] reg_addr_1,
								output wire [4:0] reg_addr_2,
									output wire [4:0] shift_amount,
									 output wire [10:0] opcode_ext,
									output wire [20:0] immediate_const,
									 output wire [25:0] offset);
								
   assign reg_addr_2 = instruction[20:16];			// the address of the secondary register
   assign shift_amount = instruction[15:11]; 		// the shift amount in case of shift instructions

    reg [2:0] fetch_possible;
	wire [4:0] rom_address;
	assign offset = instruction[25:0];				// the offset for unconditional branch
	reg [2:0] ifid;
	wire [31:0] inst;
	assign opcode_ext = instruction[10:0]; 		    // the opcode extension for arithmetic instructions
	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	assign immediate_const = instruction[20:0];	    // the immediate integer constant for load ,store, addi, subi, compi instructions
	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end

	assign opcode = instruction[31:26]; 			// the main opcode
	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	assign reg_addr_1 = instruction[25:21]; 		// the address of the final register



endmodule
