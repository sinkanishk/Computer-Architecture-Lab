`timescale 1ns / 1ps
//ALU: To perform arithmetic and shift operations

module ALU_modified(
    input wire [31:0] inp1,
    input wire [31:0] inp2,
    input wire [3:0] control,
     output reg [31:0] out,
	 output reg [31:0] high,
	 output reg carry_flag,
	 output reg zero_flag,
	 output reg sign_flag,
	 output reg overflow_flag
    );

reg c31,c32;
reg  [31:0] a;
reg  [31:0] b;
reg  [31:0] signed_a;
reg  [31:0] signed_b;
wire cout;
wire [31:0] sum_out;
wire carry_in;
wire [63:0] product;
wire [63:0] signed_product;
assign carry_in=0;

hybrid_adder H0(a,b,carry_in,sum_out,cout);
Left_Shift LEFT(a,b,product);
booth_multiplier B_M(signed_a,signed_b,signed_product);

always @(*)
	begin
		
		carry_flag = 0;// Setting all flags to zero initially
		zero_flag = 0;
		sign_flag =0;
		overflow_flag = 0;



		case(control) 
						4'b0000: begin		//add
									a={1'b0,inp1[30:0]};
									b={1'b0,inp2[30:0]};
									out=sum_out;
									c31=out[31];
									{c32,out[31]}=inp1[31]+inp2[31]+c31;
									overflow_flag=c31^c32;
									carry_flag=c32;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end 
						4'b1010:	begin 	//mult    
									signed_a=inp1;
									signed_b=inp2;
									high=signed_product[63:32];
									out=signed_product[31:0];
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=high[31];
									end 
						4'b1011:	begin	//multu	    
									a=inp1;
									b=inp2;
									out=product[31:0];
									high=product[63:32];
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=1'b0;
									end
						4'b0001:	begin		//2's complement
									out=~inp2+1;
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end
						4'b0010:	begin 	//and
									out=inp1&inp2;
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end 
						4'b0011:	begin     //xor
									out=inp1^inp2;
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end
						4'b0100:	begin		//shll or shllv
									out=inp1<<inp2;
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end
						4'b0101:	begin		//shrl or shrlv
									out=inp1>>inp2;
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end
						4'b0110:	begin		//shra or shrav
									out=inp1>>inp2;
									overflow_flag=1'b0;
									carry_flag=1'b0;
									zero_flag=(out==0)?1'b1:1'b0;
									sign_flag=out[31];
									end	
						4'b1001: out = inp1 + inp2[15:0];
						4'b0111: out = a;// Bypass the ALU. Operation important for branching
						4'b1000: out = b;//
						default: out=0;
		endcase
	end
endmodule