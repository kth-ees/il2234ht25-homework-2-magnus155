module shift_register_tb;

localparam N=4;
logic clk;
logic rst_n;
logic serial_parallel; 
logic load_enable;
logic serial_in;
logic [N-1:0] parallel_in;
logic [N-1:0] parallel_out;
logic serial_out;

// complete here
   shift_register #(.N(N)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .serial_parallel(serial_parallel),
        .load_enable(load_enable),
        .serial_in(serial_in),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out),
        .serial_out(serial_out)
	
    );

initial clk=1;
always #5 clk = ~clk;
  

initial begin
$display("Time  / serial_parallel / serial_in / parallel_in/ parallel_out/serial_out" );
        rst_n = 0;
        load_enable = 0;
        serial_parallel = 0;
        serial_in = 0;
        parallel_in = '0;
#5;
rst_n=0;
$display("%0t / %1b / %1b / %4b /%4b / %1b" , $time , serial_parallel, serial_in, parallel_in,parallel_out,serial_out);
for(int i=0;i<10;i++) begin
rst_n=1;
load_enable=1;
serial_parallel=1;
parallel_in=$urandom_range(0,2**N-1);
serial_in=$urandom_range (0,1);
#5;
$display("%0t / %1b / %1b / %4b /%4b / %1b" , $time, serial_parallel, serial_in, parallel_in,parallel_out,serial_out);
end
for (int i=0;i<10;i++) begin 
serial_parallel=0;
parallel_in=$urandom_range(0,2**N-1);
serial_in=$urandom_range (0,1);
#5;
$display("%0t / %1b / %1b / %4b /%4b / %1b" , $time, serial_parallel, serial_in, parallel_in,parallel_out,serial_out);
end





$finish;



end

endmodule
