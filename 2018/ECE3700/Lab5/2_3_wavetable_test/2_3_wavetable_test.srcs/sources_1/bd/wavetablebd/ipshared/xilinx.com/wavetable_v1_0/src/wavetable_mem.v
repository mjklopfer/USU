`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2018 01:48:38 PM
// Design Name: 
// Module Name: wavetable_mem
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


module wavetable_mem(
    clk,
    en,
    addr,
    dout
    );
    
        parameter ROM_WIDTH = 32;
        parameter ROM_ADDR_BITS = 15;
        
        reg [ROM_WIDTH-1:0] wavetable [(2**ROM_ADDR_BITS)-1:0];
        
        input clk;
        input en;
        input [ROM_ADDR_BITS-1:0] addr;
        output reg [ROM_WIDTH-1:0] dout;
        
        initial
            $readmemh("sin_table.dat", wavetable, 0, (2**ROM_ADDR_BITS)-1);
            
        always @(posedge clk)
            if (en)
                dout <= wavetable[addr];
endmodule
