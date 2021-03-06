module EXMEM(clk_i,WB_i,Mem_i,ALUres_i,imm_i,rs1_data_i,rs2_data_i,rd_addr_i,stall,Memaddr_o,Memdata_o,WB_o,Mem_o,rd_addr_o,ALUres_o);
    input [31:0] ALUres_i,imm_i,rs1_data_i,rs2_data_i;
    input [4:0] rd_addr_i;
    input [1:0] Mem_i;
    input WB_i,clk_i,stall;
    output reg [31:0] Memaddr_o,Memdata_o,ALUres_o;
    output reg [4:0] rd_addr_o;
    output reg [1:0] Mem_o;
    output reg WB_o;

    initial begin
        {Memaddr_o,Memdata_o,ALUres_o,rd_addr_o,Mem_o,WB_o} <= 0;
    end

    always @ ( posedge clk_i ) begin
        if (~stall) begin
            WB_o <= WB_i;
            Mem_o <= Mem_i;
            rd_addr_o <= rd_addr_i;
            Memdata_o <= rs2_data_i;
            ALUres_o <= ALUres_i;
            Memaddr_o <= ALUres_i;
        end
    end

endmodule
