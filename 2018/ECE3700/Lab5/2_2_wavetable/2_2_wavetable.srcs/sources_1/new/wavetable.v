`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2018 01:53:44 PM
// Design Name: 
// Module Name: wavetable
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wavetable(
    input clk,
    input clr,
    input en,
    input [14:0] num,
    input [14:0] den,
    input [31:0] dout
    );
    
    reg [14:0] addr;
    reg [14:0] next_addr;
    reg mem_en;
    reg [14:0] count;
    
    wavetable_mem ROM1(
        .clk(clk),
        .en(mem_en),
        .addr(addr),
        .dout(dout)
    );
    
    initial begin
        addr    = 0;
        mem_en  = 0;
        count   = 0;
    end
    
    always @(posedge clk) begin
        if (clr) begin
            addr    <= 0;
            mem_en  <= 0;
            count   <= 0;
        end
        else begin
            if (count >= den) begin
                if (next_addr >= 30576) begin
                    addr    <= next_addr - 30576;
                    next_addr   <= next_addr - 30576 + num;
                end
                else begin
                    addr    <= next_addr;
                    next_addr   <= next_addr + num;
                end
                mem_en <= 1;
                count <= 0;
            end
            else begin
                mem_en <= 0;
                count <= count + 1;
            end
        end
    end
endmodule
