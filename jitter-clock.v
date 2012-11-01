`default_nettype none
module test;
  reg CLK;
  reg [31:0] rand_val;
  integer clock_half_period;
  
  always @(posedge CLK) begin
    rand_val <= {$random};
  end
  
  initial begin
    clock_half_period = 100;
  end
  
  always @* begin
    clock_half_period = 100;
    if(rand_val[3:0] > 8) clock_half_period = 200;
  end
  
  initial begin
    CLK = 0;
    forever #(clock_half_period) CLK = !CLK;
  end
  
  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, CLK, rand_val);
  end
  
  initial begin
    #10000;
    $finish;
  end
endmodule
