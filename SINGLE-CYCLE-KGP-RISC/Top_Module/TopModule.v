`timescale 1ns / 1ps
`default_nettype none


// The top module for a 32 bit RISC processor
module TopModule( input wire clk, 
				  input wire rst, 
				  output reg [31:0] instruction_bit,
				  output wire [31:0] alu_result_bit,
						output wire jump_offset_bit, 
						sign_flag,
						 output wire [31:0] pc,
						 output wire [31:0] high,
						 output wire pc_bit, 
						 output wire mult_flag,
						 output reg [3:0] o1 ,
						 output wire [4:0] o2,
						  output reg Branch1,
						   regWrite1,
						    MemWrite1,
						    MemRead1);//Variables declared as output only for trial means
//	wire [31:0] pc = 32'b0;
	wire [31:0] instruction;
	wire [31:0] alu_result;
	wire[25:0] jump_offset;
	//assign instruction_bit = instruction[0];
	assign pc_bit = pc[0];
	assign jump_offset_bit = jump_offset[0];
	
	always @(*)
	begin
		instruction_bit <= instruction;
		o1 <= alu_control;
		Branch1 <= Branch;
		regWrite1 <= regWrite; 
		MemWrite1 <= MemWrite;
		MemRead1 <= MemRead; 
	end

		reg [2:0] ifid;
	wire [31:0] inst;

	always@(negedge rst)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	wire [5:0] opcode; // The opcode
	wire [4:0] reg_addr_1, reg_addr_2, shift_amount; // Buses to the register Bank
	wire [10:0] opcode_ext; // The extended opcode
	ControlUnit CU (.opcode(opcode),.opcode_ext(opcode_ext),.clk(clk),.rst(rst),.alu_control(alu_control),
					 .Branch(Branch),.regWrite(regWrite),.MemRead(MemRead),.MemWrite(MemWrite),.ALU_src(ALU_src),.regWrite_select(regWrite_select),
					 .const_src(const_src),.reg_data(reg_data),.reg_to_pc(reg_to_pc),.mult_flag(mult_flag));
	reg [2:0] fetch_possible;
	wire [4:0] rom_address;
	BranchL BL(.clk(clk),.rst(rst),.opcode(opcode),.offset_in(offset),.rs_value(alu_result),.zflag_ff(zero_flag),
				  .cflag_ff(carry_flag),.oflag_ff(overflow_flag),.sflag_ff(sign_flag),.branch(branch_success),.offset_out(jump_offset)); // The branch logic module which essentialssy defines the offset
					// and sets the branch_success flag.
	assign rom_address = pc[6:2];
	reg [2:0] ifid;
	wire [31:0] inst;
	wire [20:0] immediate_const; // The immediate constant for the addi, subi and compi instructions
	always@(negedge clk)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	wire [25:0] offset; // The offset for the jump instructions
	InstructionDecoder ID(.instruction(instruction),.opcode(opcode), .reg_addr_1(reg_addr_1),.reg_addr_2(reg_addr_2),.shift_amount(shift_amount),
									.opcode_ext(opcode_ext),.immediate_const(immediate_const),.offset(offset)); // The instruction decoder to break down the instructions into smaller opcodes
	wire [3:0] alu_control; // The control signal to the ALU
	wire Branch, regWrite, MemWrite,MemRead,ALU_src,const_src,reg_data,reg_to_pc,regWrite_select; // The control signal form the control unit
	wire zero_flag, carry_flag,overflow_flag; // The flags from the ALU
		always@(clk or rst)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	InstructionFetch IF(.pc(pc),.instruction(instruction),.clk(clk),.rst(rst)); // THe instruction fetch module contains the bram instance to read the instructions
	always@(negedge clk)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	
	// The control unit module
	DataPath DP (.clk(clk),.rst(rst),.mult_flag(mult_flag),.regWriteEnable(regWrite),.regAddr_1(reg_addr_1),.regAddr_2(reg_addr_2),.shift_amount(shift_amount), 
					 .npc(pc),.reg_to_pc(reg_to_pc), .regWrite_select(regWrite_select),
					 .MemRead(MemRead),.MemWrite(MemWrite),.alu_control(alu_control),.ALU_src(ALU_src),.const_src(const_src),.reg_data(reg_data),
					 .immediate_const(immediate_const),.alu_result(alu_result),.zero_flag(zero_flag),.carry_flag(carry_flag),
					 .sign_flag(sign_flag),.overflow_flag(overflow_flag),.write_address(o2),.mult_high(high)); 
	always@(clk or rst)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	//Almost the entire data path is declared in this one module

	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	
	wire branch_success; //A wire set as a flag in the branch logic module telling the program counter whether to branch or not.
	PC_next PCN(.clk(clk),.rst(rst),.offset(jump_offset),.branch(branch_success),.pc(pc)); // The program counter module
	always@(clk or rst)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	
	
	
	assign alu_result_bit = alu_result;
	always @(*)
	begin
		instruction_bit <= instruction;
		o1 <= alu_control;
		Branch1 <= Branch;
		regWrite1 <= regWrite; 
		MemWrite1 <= MemWrite;
		MemRead1 <= MemRead; 
	end
endmodule
