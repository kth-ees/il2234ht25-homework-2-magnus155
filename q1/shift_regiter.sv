module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);


    logic [N-1:0] middle;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            middle       <= '0;
        end else if (load_enable) begin
            if (serial_parallel) begin
                middle <= parallel_in;           
            end else begin
                middle <= {middle[N-2:0], serial_in}; 
            end


        end

    
           assign parallel_out = middle;
           assign serial_out   = middle[N-1];
	end


endmodule

