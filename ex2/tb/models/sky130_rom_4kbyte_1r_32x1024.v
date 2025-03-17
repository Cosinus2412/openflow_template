// OpenROM ROM model
// Words: 1024
// Word size: 32
// Word per Row: 4
// Data Type: bin
// Data File: rom_4kbyte.bin

module sky130_rom_4kbyte_1r_32x1024(
`ifdef USE_POWER_PINS
    vccd1,
    vssd1,
`endif
// Port 0: R
    clk,cs,addr,dout
  );

  parameter INIT_FILE = "";
  parameter DATA_WIDTH = 32 ;
  parameter ADDR_WIDTH = 10 ;
  parameter ROM_DEPTH = 1 << ADDR_WIDTH;
  // FIXME: This delay is arbitrary.
  parameter DELAY = 3 ;
  parameter VERBOSE = 1 ; //Set to 0 to only display warnings
  parameter T_HOLD = 1 ; //Delay to hold dout value after posedge. Value is arbitrary

`ifdef USE_POWER_PINS
    inout vccd1;
    inout vssd1;
`endif
  input  clk; // clock
  input   cs; // active low chip select
  input [ADDR_WIDTH-1:0]  addr;
  output [DATA_WIDTH-1:0] dout;

  reg [DATA_WIDTH-1:0]    mem [0:ROM_DEPTH-1];

  initial begin
    if (INIT_FILE != "") begin
        $display("Loading ROM content from %s", INIT_FILE);
        $readmemh(INIT_FILE, mem, 0, ROM_DEPTH-1);
    end
  end

  reg  cs_reg;
  reg [ADDR_WIDTH-1:0]  addr_reg;
  reg [DATA_WIDTH-1:0]  dout;

  // All inputs are registers
  always @(posedge clk)
  begin
    cs_reg = cs;
    addr_reg = addr;
    if ( !cs_reg && VERBOSE ) 
      $display($time," Reading %m addr=%b dout=%b",addr_reg,mem[addr_reg]);
  end


  // Memory Read Block Port 0
  // Read Operation : When cs = 1
  always @ (negedge clk)
  begin : MEM_READ0
    if (cs_reg)
       dout <= mem[addr_reg];
  end

endmodule
