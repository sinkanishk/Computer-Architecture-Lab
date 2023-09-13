`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

// The main datapath module
module DataPath( input wire clk, 
					  input wire rst,
					  input wire mult_flag, 
					  input wire regWriteEnable,
					  input wire[4:0] regAddr_1,
					  input wire[4:0] regAddr_2,
					  input wire [4:0] shift_amount,
					  input wire [31:0] npc,
					  input wire reg_to_pc,
					  input wire regWrite_select,
					  input wire MemRead,
					  input wire MemWrite,
					  input wire [3:0] alu_control,
					  input wire ALU_src,
					  input wire const_src,
					  input wire reg_data,
					  input wire [20:0] immediate_const,
					  output wire [31:0] alu_result,
					  output wire zero_flag, 
					  output wire carry_flag,
					  output wire sign_flag, 
					  output wire [31:0] mult_high,
					  output wire overflow_flag,
					  output wire[4:0] write_address);

// const_src is the flag that is given to the second MUX to the ALU's input. It selects between the constant input and the output ftom the MUX that selects register data and shift amount
	wire[2:0] data_unit1;
	wire[2:0] data_unit2;
// reg_to_pc is the flag that selects which offset is being used to go for the branch. Used explicitly for function calls and return

// reg_data selects the source from which data is about to be eritten to the registers.

	wire[31:0] memDataOut;// the output from the Data memory
	wire[2:0] data_unit3;
	wire[31:0] alu_result_temp; // a temporary input to the muxs and is the alu's result
	wire[2:0] data_unit4;
	wire[31:0] regWriteData, regReadData_1, regReadData_2; // Register Bank and Data Memory data Buses
	wire[2:0] data_unit5;
	wire[31:0] regWriteData_temp;   // output of mux from alu/ data memory -> reg bank
	
	wire [4:0] enable_pin;
	assign enable_pin=regWriteAddr;
	// The data memory module
	Data_memory dm(.clk(clk), .rst(rst),.address(alu_result_temp),.data_in(regReadData_2),.MemRead(MemRead),
						.MemWrite(MemWrite),.data_out(memDataOut));
	
	//Some muxes in the datapath 
	Mux_32b_2x1 reg_input(.a(memDataOut),.b(alu_result_temp),.select(reg_data),.out(regWriteData_temp));
	wire [4:0] enable_pin2;
	assign enable_pin2=regWriteAddr;
	Mux_32b_2x1 regBank_pc_input(.a(regWriteData_temp),.b(npc),.select(reg_to_pc),.out(regWriteData));

	wire [4:0] reg_Addr_1_final; // the fianl input to the register bank and the output of a MUX
	assign alu_result = alu_result_temp;
	Mux_5b_2x1 regBank_addr_input (.a(regAddr_1),.b(5'b11111),.select(reg_to_pc),.out(reg_Addr_1_final));
	
	//Declaration of the reister BAnk
	wire [4:0] regWriteAddr;
	wire [4:0] enable_pin3;
	assign enable_pin3=regWriteAddr;
	assign write_address =  regWriteAddr;
	assign mult_high= high;
	Mux_5b_2x1 regWriteAddr_select (.a(regAddr_1),.b(regAddr_2),.select(regWrite_select),.out(regWriteAddr));
	RegisterBank RB(.clk(clk),.mult_flag(mult_flag),.rst(rst),.regWriteEnable(regWriteEnable),.regWriteData(regWriteData), .regWriteAddr(regWriteAddr),
					 .regAddr_1(reg_Addr_1_final),.high(high),.regAddr_2(regAddr_2),.regReadData_1(regReadData_1),.regReadData_2(regReadData_2));
	
	
	wire [31:0] alu_input_2, alu_const_input;
	wire [31:0] high;
	//MUXes controlling the ALU's datapath
	Mux_32b_2x1 alu_constant (.a({{11{immediate_const[20]}},immediate_const}),.b({27'b0,shift_amount}),.select(const_src),.out(alu_const_input)); 
	wire [4:0] enable_pin4;
	assign enable_pin4=regWriteAddr;
	// const_src - from control unit to select whether the alu input is shift amount or immediate constant
	Mux_32b_2x1 alu_input_mux(.a(regReadData_2),.b(alu_const_input),.select(ALU_src),.out(alu_input_2));
	
	// The ALU
	ALU_modified ALU(.inp1(regReadData_1),.inp2(alu_input_2),.control(alu_control),.out(alu_result_temp),.zero_flag(zero_flag),
				.carry_flag(carry_flag),.high(high),.sign_flag(sign_flag),.overflow_flag(overflow_flag));
	
	wire [4:0] enable_pin5;
	assign enable_pin5=regWriteAddr;

	// Assigning the ouput of the MUX to the ALU result
	
	
endmodule
