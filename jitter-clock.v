`default_nettype none
module test;
  reg CLK;
  reg [31:0] rand_val;
  always @(posedge CLK) begin
    rand_val <= {$random};
  end
  initial begin
    CLK = 0;
    while(1) begin
      if(rand_val[3:0] > 8) begin
        #100;
        CLK = !CLK;
      end else begin
        #200;
        CLK = !CLK;
      end
    end
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
