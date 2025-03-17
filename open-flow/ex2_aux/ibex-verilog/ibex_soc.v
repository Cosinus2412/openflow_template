// removed package "ibex_pkg"
// removed package "ibex_soc_pkg"
// removed interface: bus_if
// Trace: ibex_soc/ibex_soc.sv:4:1
`default_nettype none
module ibex_soc (
	sys_clk_i,
	sys_rst_ni,
	uart_rx_i,
	uart_tx_o,
	led_o,
	parout_valid_o,
	parout_o,
	eoc_o,
	sram0_clk0,
	sram0_csb0,
	sram0_web0,
	sram0_wmask0,
	sram0_addr0,
	sram0_din0,
	sram0_dout0,
	sram0_clk1,
	sram0_csb1,
	sram0_addr1,
	sram0_dout1,
	sram1_clk0,
	sram1_csb0,
	sram1_web0,
	sram1_wmask0,
	sram1_addr0,
	sram1_din0,
	sram1_dout0,
	sram1_clk1,
	sram1_csb1,
	sram1_addr1,
	sram1_dout1,
	sram2_clk0,
	sram2_csb0,
	sram2_web0,
	sram2_wmask0,
	sram2_addr0,
	sram2_din0,
	sram2_dout0,
	sram2_clk1,
	sram2_csb1,
	sram2_addr1,
	sram2_dout1,
	sram3_clk0,
	sram3_csb0,
	sram3_web0,
	sram3_wmask0,
	sram3_addr0,
	sram3_din0,
	sram3_dout0,
	sram3_clk1,
	sram3_csb1,
	sram3_addr1,
	sram3_dout1,
	sram4_clk0,
	sram4_csb0,
	sram4_web0,
	sram4_wmask0,
	sram4_addr0,
	sram4_din0,
	sram4_dout0,
	sram4_clk1,
	sram4_csb1,
	sram4_addr1,
	sram4_dout1,
	sram5_clk0,
	sram5_csb0,
	sram5_web0,
	sram5_wmask0,
	sram5_addr0,
	sram5_din0,
	sram5_dout0,
	sram5_clk1,
	sram5_csb1,
	sram5_addr1,
	sram5_dout1,
	sram6_clk0,
	sram6_csb0,
	sram6_web0,
	sram6_wmask0,
	sram6_addr0,
	sram6_din0,
	sram6_dout0,
	sram6_clk1,
	sram6_csb1,
	sram6_addr1,
	sram6_dout1,
	sram7_clk0,
	sram7_csb0,
	sram7_web0,
	sram7_wmask0,
	sram7_addr0,
	sram7_din0,
	sram7_dout0,
	sram7_clk1,
	sram7_csb1,
	sram7_addr1,
	sram7_dout1,
	rom0_clk,
	rom0_cs,
	rom0_addr,
	rom0_dout,
	rom1_clk,
	rom1_cs,
	rom1_addr,
	rom1_dout,
	slave_req,
	slave_gnt,
	slave_addr,
	slave_we,
	slave_be,
	slave_rvalid,
	slave_wdata,
	slave_rdata,
	slave_err,
	master_req,
	master_gnt,
	master_addr,
	master_we,
	master_be,
	master_rvalid,
	master_wdata,
	master_rdata,
	master_err
);
	// removed import ibex_soc_pkg::*;
	// Trace: ibex_soc/ibex_soc.sv:8:15
	parameter CLOCK_FREQUENCY = 40000000;
	// Trace: ibex_soc/ibex_soc.sv:11:15
	parameter SRAM_NUM_WMASKS = 4;
	// Trace: ibex_soc/ibex_soc.sv:12:15
	parameter SRAM_DATA_WIDTH = 32;
	// Trace: ibex_soc/ibex_soc.sv:13:15
	parameter SRAM_ADDR_WIDTH = 9;
	// Trace: ibex_soc/ibex_soc.sv:16:15
	parameter ROM_DATA_WIDTH = 32;
	// Trace: ibex_soc/ibex_soc.sv:17:15
	parameter ROM_ADDR_WIDTH = 10;
	// Trace: ibex_soc/ibex_soc.sv:20:5
	input wire sys_clk_i;
	// Trace: ibex_soc/ibex_soc.sv:21:5
	input wire sys_rst_ni;
	// Trace: ibex_soc/ibex_soc.sv:23:5
	input wire uart_rx_i;
	// Trace: ibex_soc/ibex_soc.sv:24:5
	output wire uart_tx_o;
	// Trace: ibex_soc/ibex_soc.sv:26:5
	output wire led_o;
	// Trace: ibex_soc/ibex_soc.sv:28:5
	output wire parout_valid_o;
	// Trace: ibex_soc/ibex_soc.sv:29:5
	output wire [7:0] parout_o;
	// Trace: ibex_soc/ibex_soc.sv:31:5
	output wire eoc_o;
	// Trace: ibex_soc/ibex_soc.sv:34:5
	output wire sram0_clk0;
	// Trace: ibex_soc/ibex_soc.sv:35:5
	output wire sram0_csb0;
	// Trace: ibex_soc/ibex_soc.sv:36:5
	output wire sram0_web0;
	// Trace: ibex_soc/ibex_soc.sv:37:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram0_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:38:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram0_addr0;
	// Trace: ibex_soc/ibex_soc.sv:39:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram0_din0;
	// Trace: ibex_soc/ibex_soc.sv:40:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram0_dout0;
	// Trace: ibex_soc/ibex_soc.sv:42:5
	output wire sram0_clk1;
	// Trace: ibex_soc/ibex_soc.sv:43:5
	output wire sram0_csb1;
	// Trace: ibex_soc/ibex_soc.sv:44:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram0_addr1;
	// Trace: ibex_soc/ibex_soc.sv:45:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram0_dout1;
	// Trace: ibex_soc/ibex_soc.sv:48:5
	output wire sram1_clk0;
	// Trace: ibex_soc/ibex_soc.sv:49:5
	output wire sram1_csb0;
	// Trace: ibex_soc/ibex_soc.sv:50:5
	output wire sram1_web0;
	// Trace: ibex_soc/ibex_soc.sv:51:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram1_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:52:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram1_addr0;
	// Trace: ibex_soc/ibex_soc.sv:53:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram1_din0;
	// Trace: ibex_soc/ibex_soc.sv:54:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram1_dout0;
	// Trace: ibex_soc/ibex_soc.sv:56:5
	output wire sram1_clk1;
	// Trace: ibex_soc/ibex_soc.sv:57:5
	output wire sram1_csb1;
	// Trace: ibex_soc/ibex_soc.sv:58:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram1_addr1;
	// Trace: ibex_soc/ibex_soc.sv:59:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram1_dout1;
	// Trace: ibex_soc/ibex_soc.sv:62:5
	output wire sram2_clk0;
	// Trace: ibex_soc/ibex_soc.sv:63:5
	output wire sram2_csb0;
	// Trace: ibex_soc/ibex_soc.sv:64:5
	output wire sram2_web0;
	// Trace: ibex_soc/ibex_soc.sv:65:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram2_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:66:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram2_addr0;
	// Trace: ibex_soc/ibex_soc.sv:67:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram2_din0;
	// Trace: ibex_soc/ibex_soc.sv:68:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram2_dout0;
	// Trace: ibex_soc/ibex_soc.sv:70:5
	output wire sram2_clk1;
	// Trace: ibex_soc/ibex_soc.sv:71:5
	output wire sram2_csb1;
	// Trace: ibex_soc/ibex_soc.sv:72:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram2_addr1;
	// Trace: ibex_soc/ibex_soc.sv:73:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram2_dout1;
	// Trace: ibex_soc/ibex_soc.sv:76:5
	output wire sram3_clk0;
	// Trace: ibex_soc/ibex_soc.sv:77:5
	output wire sram3_csb0;
	// Trace: ibex_soc/ibex_soc.sv:78:5
	output wire sram3_web0;
	// Trace: ibex_soc/ibex_soc.sv:79:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram3_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:80:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram3_addr0;
	// Trace: ibex_soc/ibex_soc.sv:81:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram3_din0;
	// Trace: ibex_soc/ibex_soc.sv:82:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram3_dout0;
	// Trace: ibex_soc/ibex_soc.sv:84:5
	output wire sram3_clk1;
	// Trace: ibex_soc/ibex_soc.sv:85:5
	output wire sram3_csb1;
	// Trace: ibex_soc/ibex_soc.sv:86:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram3_addr1;
	// Trace: ibex_soc/ibex_soc.sv:87:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram3_dout1;
	// Trace: ibex_soc/ibex_soc.sv:90:5
	output wire sram4_clk0;
	// Trace: ibex_soc/ibex_soc.sv:91:5
	output wire sram4_csb0;
	// Trace: ibex_soc/ibex_soc.sv:92:5
	output wire sram4_web0;
	// Trace: ibex_soc/ibex_soc.sv:93:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram4_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:94:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram4_addr0;
	// Trace: ibex_soc/ibex_soc.sv:95:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram4_din0;
	// Trace: ibex_soc/ibex_soc.sv:96:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram4_dout0;
	// Trace: ibex_soc/ibex_soc.sv:98:5
	output wire sram4_clk1;
	// Trace: ibex_soc/ibex_soc.sv:99:5
	output wire sram4_csb1;
	// Trace: ibex_soc/ibex_soc.sv:100:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram4_addr1;
	// Trace: ibex_soc/ibex_soc.sv:101:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram4_dout1;
	// Trace: ibex_soc/ibex_soc.sv:104:5
	output wire sram5_clk0;
	// Trace: ibex_soc/ibex_soc.sv:105:5
	output wire sram5_csb0;
	// Trace: ibex_soc/ibex_soc.sv:106:5
	output wire sram5_web0;
	// Trace: ibex_soc/ibex_soc.sv:107:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram5_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:108:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram5_addr0;
	// Trace: ibex_soc/ibex_soc.sv:109:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram5_din0;
	// Trace: ibex_soc/ibex_soc.sv:110:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram5_dout0;
	// Trace: ibex_soc/ibex_soc.sv:112:5
	output wire sram5_clk1;
	// Trace: ibex_soc/ibex_soc.sv:113:5
	output wire sram5_csb1;
	// Trace: ibex_soc/ibex_soc.sv:114:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram5_addr1;
	// Trace: ibex_soc/ibex_soc.sv:115:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram5_dout1;
	// Trace: ibex_soc/ibex_soc.sv:118:5
	output wire sram6_clk0;
	// Trace: ibex_soc/ibex_soc.sv:119:5
	output wire sram6_csb0;
	// Trace: ibex_soc/ibex_soc.sv:120:5
	output wire sram6_web0;
	// Trace: ibex_soc/ibex_soc.sv:121:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram6_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:122:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram6_addr0;
	// Trace: ibex_soc/ibex_soc.sv:123:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram6_din0;
	// Trace: ibex_soc/ibex_soc.sv:124:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram6_dout0;
	// Trace: ibex_soc/ibex_soc.sv:126:5
	output wire sram6_clk1;
	// Trace: ibex_soc/ibex_soc.sv:127:5
	output wire sram6_csb1;
	// Trace: ibex_soc/ibex_soc.sv:128:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram6_addr1;
	// Trace: ibex_soc/ibex_soc.sv:129:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram6_dout1;
	// Trace: ibex_soc/ibex_soc.sv:132:5
	output wire sram7_clk0;
	// Trace: ibex_soc/ibex_soc.sv:133:5
	output wire sram7_csb0;
	// Trace: ibex_soc/ibex_soc.sv:134:5
	output wire sram7_web0;
	// Trace: ibex_soc/ibex_soc.sv:135:5
	output wire [SRAM_NUM_WMASKS - 1:0] sram7_wmask0;
	// Trace: ibex_soc/ibex_soc.sv:136:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram7_addr0;
	// Trace: ibex_soc/ibex_soc.sv:137:5
	output wire [SRAM_DATA_WIDTH - 1:0] sram7_din0;
	// Trace: ibex_soc/ibex_soc.sv:138:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram7_dout0;
	// Trace: ibex_soc/ibex_soc.sv:140:5
	output wire sram7_clk1;
	// Trace: ibex_soc/ibex_soc.sv:141:5
	output wire sram7_csb1;
	// Trace: ibex_soc/ibex_soc.sv:142:5
	output wire [SRAM_ADDR_WIDTH - 1:0] sram7_addr1;
	// Trace: ibex_soc/ibex_soc.sv:143:5
	input wire [SRAM_DATA_WIDTH - 1:0] sram7_dout1;
	// Trace: ibex_soc/ibex_soc.sv:146:5
	output wire rom0_clk;
	// Trace: ibex_soc/ibex_soc.sv:147:5
	output wire rom0_cs;
	// Trace: ibex_soc/ibex_soc.sv:148:5
	output wire [ROM_ADDR_WIDTH - 1:0] rom0_addr;
	// Trace: ibex_soc/ibex_soc.sv:149:5
	input wire [ROM_DATA_WIDTH - 1:0] rom0_dout;
	// Trace: ibex_soc/ibex_soc.sv:152:5
	output wire rom1_clk;
	// Trace: ibex_soc/ibex_soc.sv:153:5
	output wire rom1_cs;
	// Trace: ibex_soc/ibex_soc.sv:154:5
	output wire [ROM_ADDR_WIDTH - 1:0] rom1_addr;
	// Trace: ibex_soc/ibex_soc.sv:155:5
	input wire [ROM_DATA_WIDTH - 1:0] rom1_dout;
	// Trace: ibex_soc/ibex_soc.sv:158:5
	output wire slave_req;
	// Trace: ibex_soc/ibex_soc.sv:159:5
	input slave_gnt;
	// Trace: ibex_soc/ibex_soc.sv:160:5
	output wire [31:0] slave_addr;
	// Trace: ibex_soc/ibex_soc.sv:161:5
	output wire slave_we;
	// Trace: ibex_soc/ibex_soc.sv:162:5
	output wire [3:0] slave_be;
	// Trace: ibex_soc/ibex_soc.sv:163:5
	input slave_rvalid;
	// Trace: ibex_soc/ibex_soc.sv:164:5
	output wire [31:0] slave_wdata;
	// Trace: ibex_soc/ibex_soc.sv:165:5
	input [31:0] slave_rdata;
	// Trace: ibex_soc/ibex_soc.sv:166:5
	input slave_err;
	// Trace: ibex_soc/ibex_soc.sv:169:5
	input master_req;
	// Trace: ibex_soc/ibex_soc.sv:170:5
	output wire master_gnt;
	// Trace: ibex_soc/ibex_soc.sv:171:5
	input [31:0] master_addr;
	// Trace: ibex_soc/ibex_soc.sv:172:5
	input master_we;
	// Trace: ibex_soc/ibex_soc.sv:173:5
	input [3:0] master_be;
	// Trace: ibex_soc/ibex_soc.sv:174:5
	output wire master_rvalid;
	// Trace: ibex_soc/ibex_soc.sv:175:5
	input [31:0] master_wdata;
	// Trace: ibex_soc/ibex_soc.sv:176:5
	output wire [31:0] master_rdata;
	// Trace: ibex_soc/ibex_soc.sv:177:5
	output wire master_err;
	// Trace: ibex_soc/ibex_soc.sv:180:5
	localparam [31:0] MEM_START = 32'h00000000;
	// Trace: ibex_soc/ibex_soc.sv:181:5
	localparam [31:0] ibex_soc_pkg_RAM_SIZE = 32'h00004000;
	localparam [31:0] MEM_MASK = 16383;
	// Trace: ibex_soc/ibex_soc.sv:183:5
	wire clk;
	// Trace: ibex_soc/ibex_soc.sv:184:5
	assign clk = sys_clk_i;
	// Trace: ibex_soc/ibex_soc.sv:186:5
	wire rst_n;
	// Trace: ibex_soc/ibex_soc.sv:187:5
	assign rst_n = sys_rst_ni;
	// Trace: ibex_soc/ibex_soc.sv:190:5
	wire irq_timer;
	wire irq_uart_rx;
	wire irq_uart_tx;
	// Trace: ibex_soc/ibex_soc.sv:192:5
	assign irq_timer = 1'b0;
	// Trace: ibex_soc/ibex_soc.sv:193:5
	assign irq_uart_rx = 1'b0;
	// Trace: ibex_soc/ibex_soc.sv:194:5
	assign irq_uart_tx = 1'b0;
	// Trace: ibex_soc/ibex_soc.sv:197:5
	// expanded interface instance: instr_if
	generate
		if (1) begin : instr_if
			// Trace: ibex_soc/bus_if.sv:2:3
			wire req;
			reg gnt;
			reg rvalid;
			wire we;
			reg err;
			// Trace: ibex_soc/bus_if.sv:3:3
			wire [3:0] be;
			// Trace: ibex_soc/bus_if.sv:4:3
			wire [31:0] addr;
			reg [31:0] rdata;
			wire [31:0] wdata;
			// Trace: ibex_soc/bus_if.sv:6:3
			// Trace: ibex_soc/bus_if.sv:18:3
		end
	endgenerate
	// Trace: ibex_soc/ibex_soc.sv:198:5
	// expanded interface instance: data_if
	generate
		if (1) begin : data_if
			// Trace: ibex_soc/bus_if.sv:2:3
			wire req;
			reg gnt;
			wire rvalid;
			wire we;
			wire err;
			// Trace: ibex_soc/bus_if.sv:3:3
			wire [3:0] be;
			// Trace: ibex_soc/bus_if.sv:4:3
			wire [31:0] addr;
			reg [31:0] rdata;
			wire [31:0] wdata;
			// Trace: ibex_soc/bus_if.sv:6:3
			// Trace: ibex_soc/bus_if.sv:18:3
		end
	endgenerate
	// Trace: ibex_soc/ibex_soc.sv:200:5
	assign instr_if.we = 1'sb0;
	// Trace: ibex_soc/ibex_soc.sv:201:5
	assign instr_if.be = 1'sb0;
	// Trace: ibex_soc/ibex_soc.sv:202:5
	assign instr_if.wdata = 1'sb0;
	// Trace: ibex_soc/ibex_soc.sv:206:5
	ibex_top ibex_top(
		.clk_i(clk),
		.rst_ni(rst_n),
		.test_en_i(1'b0),
		.ram_cfg_i(10'b0000000000),
		.hart_id_i(32'b00000000000000000000000000000000),
		.boot_addr_i(32'h00000080),
		.instr_req_o(instr_if.req),
		.instr_gnt_i(instr_if.gnt),
		.instr_rvalid_i(instr_if.rvalid),
		.instr_addr_o(instr_if.addr),
		.instr_rdata_i(instr_if.rdata),
		.instr_rdata_intg_i(7'b0000000),
		.instr_err_i(instr_if.err),
		.data_req_o(data_if.req),
		.data_gnt_i(data_if.gnt),
		.data_rvalid_i(data_if.rvalid),
		.data_we_o(data_if.we),
		.data_be_o(data_if.be),
		.data_addr_o(data_if.addr),
		.data_wdata_o(data_if.wdata),
		.data_wdata_intg_o(),
		.data_rdata_i(data_if.rdata),
		.data_rdata_intg_i(7'b0000000),
		.data_err_i(data_if.err),
		.irq_software_i(1'b0),
		.irq_timer_i(irq_timer),
		.irq_external_i(1'b0),
		.irq_fast_i({13'b0000000000000, irq_uart_tx, irq_uart_rx}),
		.irq_nm_i(1'b0),
		.scramble_key_valid_i(1'b0),
		.scramble_key_i(128'h00000000000000000000000000000000),
		.scramble_nonce_i(64'h0000000000000000),
		.scramble_req_o(),
		.debug_req_i(1'b0),
		.crash_dump_o(),
		.double_fault_seen_o(),
		.fetch_enable_i(4'b0101),
		.alert_minor_o(),
		.alert_major_internal_o(),
		.alert_major_bus_o(),
		.core_sleep_o(),
		.scan_rst_ni(1'b1)
	);
	// Trace: ibex_soc/ibex_soc.sv:260:5
	// expanded interface instance: rom_if
	generate
		if (1) begin : rom_if
			// Trace: ibex_soc/bus_if.sv:2:3
			reg req;
			wire gnt;
			reg rvalid;
			reg we;
			wire err;
			// Trace: ibex_soc/bus_if.sv:3:3
			reg [3:0] be;
			// Trace: ibex_soc/bus_if.sv:4:3
			reg [31:0] addr;
			wire [31:0] rdata;
			reg [31:0] wdata;
			// Trace: ibex_soc/bus_if.sv:6:3
			// Trace: ibex_soc/bus_if.sv:18:3
		end
	endgenerate
	// Trace: ibex_soc/ibex_soc.sv:261:5
	// expanded interface instance: ram_if
	generate
		if (1) begin : ram_if
			// Trace: ibex_soc/bus_if.sv:2:3
			reg req;
			wire gnt;
			reg rvalid;
			reg we;
			wire err;
			// Trace: ibex_soc/bus_if.sv:3:3
			reg [3:0] be;
			// Trace: ibex_soc/bus_if.sv:4:3
			reg [31:0] addr;
			wire [31:0] rdata;
			reg [31:0] wdata;
			// Trace: ibex_soc/bus_if.sv:6:3
			// Trace: ibex_soc/bus_if.sv:18:3
		end
	endgenerate
	// Trace: ibex_soc/ibex_soc.sv:262:5
	// expanded interface instance: slaves
	genvar _arr_61254;
	generate
		for (_arr_61254 = 0; _arr_61254 <= 6; _arr_61254 = _arr_61254 + 1) begin : slaves
			// Trace: ibex_soc/bus_if.sv:2:3
			wire req;
			reg gnt;
			reg rvalid;
			wire we;
			reg err;
			// Trace: ibex_soc/bus_if.sv:3:3
			wire [3:0] be;
			// Trace: ibex_soc/bus_if.sv:4:3
			wire [31:0] addr;
			reg [31:0] rdata;
			wire [31:0] wdata;
			// Trace: ibex_soc/bus_if.sv:6:3
			// Trace: ibex_soc/bus_if.sv:18:3
		end
	endgenerate
	// Trace: ibex_soc/ibex_soc.sv:263:5
	// expanded interface instance: cipher_if
	generate
		if (1) begin : cipher_if
			// Trace: ibex_soc/bus_if.sv:2:3
			wire req;
			reg gnt;
			reg rvalid;
			wire we;
			reg err;
			// Trace: ibex_soc/bus_if.sv:3:3
			wire [3:0] be;
			// Trace: ibex_soc/bus_if.sv:4:3
			wire [31:0] addr;
			reg [31:0] rdata;
			wire [31:0] wdata;
			// Trace: ibex_soc/bus_if.sv:6:3
			// Trace: ibex_soc/bus_if.sv:18:3
		end
	endgenerate
	// Trace: ibex_soc/ibex_soc.sv:265:5
	localparam [31:0] ibex_soc_pkg_ROM_SIZE = 32'h00002000;
	localparam [31:0] ibex_soc_pkg_ROM_START = 32'h00000000;
	// expanded module instance: arbiter_inst0
	localparam _bbase_063A7_master2 = 0;
	localparam _param_063A7_SLAVE_START = ibex_soc_pkg_ROM_START;
	localparam _param_063A7_SLAVE_SIZE = ibex_soc_pkg_ROM_SIZE;
	generate
		if (1) begin : arbiter_inst0
			// Trace: ibex_soc/bus_arbiter2m1s.sv:4:13
			localparam SLAVE_START = _param_063A7_SLAVE_START;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:5:13
			localparam SLAVE_SIZE = _param_063A7_SLAVE_SIZE;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:7:3
			wire clk_i;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:8:3
			wire rst_ni;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:10:3
			// removed modport instance master1
			// Trace: ibex_soc/bus_arbiter2m1s.sv:11:3
			localparam _mbase_master2 = _bbase_063A7_master2;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:12:3
			// removed modport instance slave
			// Trace: ibex_soc/bus_arbiter2m1s.sv:14:3
			localparam SLAVE_MASK = ~8191;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:17:3
			wire master1_sel;
			wire master2_sel;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:18:3
			assign master1_sel = (ibex_soc.instr_if.addr & SLAVE_MASK) == SLAVE_START;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:19:3
			assign master2_sel = (ibex_soc.slaves[_mbase_master2].addr & SLAVE_MASK) == SLAVE_START;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:22:3
			wire master1_req;
			wire master2_req;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:23:3
			assign master1_req = ibex_soc.instr_if.req & master1_sel;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:24:3
			assign master2_req = ibex_soc.slaves[_mbase_master2].req & master2_sel;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:26:3
			// removed localparam type resp_t
			// Trace: ibex_soc/bus_arbiter2m1s.sv:27:3
			reg [31:0] resp_n;
			reg [31:0] resp_q;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:29:3
			always @(*) begin
				// Trace: ibex_soc/bus_arbiter2m1s.sv:31:5
				resp_n = resp_q;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:32:5
				ibex_soc.instr_if.gnt = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:33:5
				ibex_soc.slaves[_mbase_master2].gnt = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:35:5
				ibex_soc.rom_if.req = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:36:5
				ibex_soc.rom_if.addr = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:37:5
				ibex_soc.rom_if.we = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:38:5
				ibex_soc.rom_if.be = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:39:5
				ibex_soc.rom_if.wdata = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:41:5
				if (master1_req && master2_req) begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:44:7
					ibex_soc.rom_if.req = ibex_soc.slaves[_mbase_master2].req;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:45:7
					ibex_soc.rom_if.addr = ibex_soc.slaves[_mbase_master2].addr;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:46:7
					ibex_soc.rom_if.we = ibex_soc.slaves[_mbase_master2].we;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:47:7
					ibex_soc.rom_if.be = ibex_soc.slaves[_mbase_master2].be;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:48:7
					ibex_soc.rom_if.wdata = ibex_soc.slaves[_mbase_master2].wdata;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:49:7
					ibex_soc.slaves[_mbase_master2].gnt = ibex_soc.rom_if.gnt;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:50:7
					ibex_soc.instr_if.gnt = 'b0;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:51:7
					resp_n = 32'd1;
				end
				else begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:53:7
					if (master1_req) begin
						// Trace: ibex_soc/bus_arbiter2m1s.sv:54:9
						ibex_soc.rom_if.req = ibex_soc.instr_if.req;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:55:9
						ibex_soc.rom_if.addr = ibex_soc.instr_if.addr;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:56:9
						ibex_soc.rom_if.we = ibex_soc.instr_if.we;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:57:9
						ibex_soc.rom_if.be = ibex_soc.instr_if.be;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:58:9
						ibex_soc.rom_if.wdata = ibex_soc.instr_if.wdata;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:59:9
						ibex_soc.instr_if.gnt = ibex_soc.rom_if.gnt;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:60:9
						ibex_soc.slaves[_mbase_master2].gnt = 'b0;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:61:9
						resp_n = 32'd0;
					end
					if (master2_req) begin
						// Trace: ibex_soc/bus_arbiter2m1s.sv:64:9
						ibex_soc.rom_if.req = ibex_soc.slaves[_mbase_master2].req;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:65:9
						ibex_soc.rom_if.addr = ibex_soc.slaves[_mbase_master2].addr;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:66:9
						ibex_soc.rom_if.we = ibex_soc.slaves[_mbase_master2].we;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:67:9
						ibex_soc.rom_if.be = ibex_soc.slaves[_mbase_master2].be;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:68:9
						ibex_soc.rom_if.wdata = ibex_soc.slaves[_mbase_master2].wdata;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:69:9
						ibex_soc.slaves[_mbase_master2].gnt = ibex_soc.rom_if.gnt;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:70:9
						ibex_soc.instr_if.gnt = 'b0;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:71:9
						resp_n = 32'd1;
					end
				end
			end
			// Trace: ibex_soc/bus_arbiter2m1s.sv:78:3
			always @(*) begin
				// Trace: ibex_soc/bus_arbiter2m1s.sv:79:5
				ibex_soc.instr_if.rdata = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:80:5
				ibex_soc.instr_if.rvalid = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:81:5
				ibex_soc.instr_if.err = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:82:5
				ibex_soc.slaves[_mbase_master2].rdata = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:83:5
				ibex_soc.slaves[_mbase_master2].rvalid = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:84:5
				ibex_soc.slaves[_mbase_master2].err = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:86:5
				if (resp_q == 32'd0) begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:87:7
					ibex_soc.instr_if.rdata = ibex_soc.rom_if.rdata;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:88:7
					ibex_soc.instr_if.rvalid = ibex_soc.rom_if.rvalid;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:89:7
					ibex_soc.instr_if.err = ibex_soc.rom_if.err;
				end
				else begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:92:7
					ibex_soc.slaves[_mbase_master2].rdata = ibex_soc.rom_if.rdata;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:93:7
					ibex_soc.slaves[_mbase_master2].rvalid = ibex_soc.rom_if.rvalid;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:94:7
					ibex_soc.slaves[_mbase_master2].err = ibex_soc.rom_if.err;
				end
			end
			// Trace: ibex_soc/bus_arbiter2m1s.sv:98:3
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/bus_arbiter2m1s.sv:99:5
				if (!rst_ni)
					// Trace: ibex_soc/bus_arbiter2m1s.sv:100:7
					resp_q <= 32'd0;
				else
					// Trace: ibex_soc/bus_arbiter2m1s.sv:102:7
					resp_q <= resp_n;
		end
	endgenerate
	assign arbiter_inst0.clk_i = clk;
	assign arbiter_inst0.rst_ni = rst_n;
	// Trace: ibex_soc/ibex_soc.sv:276:5
	localparam [31:0] ibex_soc_pkg_RAM_START = 32'h00020000;
	// expanded module instance: arbiter_inst1
	localparam _bbase_E63D8_master2 = 1;
	localparam _param_E63D8_SLAVE_START = ibex_soc_pkg_RAM_START;
	localparam _param_E63D8_SLAVE_SIZE = ibex_soc_pkg_RAM_SIZE;
	generate
		if (1) begin : arbiter_inst1
			// Trace: ibex_soc/bus_arbiter2m1s.sv:4:13
			localparam SLAVE_START = _param_E63D8_SLAVE_START;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:5:13
			localparam SLAVE_SIZE = _param_E63D8_SLAVE_SIZE;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:7:3
			wire clk_i;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:8:3
			wire rst_ni;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:10:3
			// removed modport instance master1
			// Trace: ibex_soc/bus_arbiter2m1s.sv:11:3
			localparam _mbase_master2 = _bbase_E63D8_master2;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:12:3
			// removed modport instance slave
			// Trace: ibex_soc/bus_arbiter2m1s.sv:14:3
			localparam SLAVE_MASK = ~16383;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:17:3
			wire master1_sel;
			wire master2_sel;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:18:3
			assign master1_sel = (ibex_soc.cipher_if.addr & SLAVE_MASK) == SLAVE_START;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:19:3
			assign master2_sel = (ibex_soc.slaves[_mbase_master2].addr & SLAVE_MASK) == SLAVE_START;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:22:3
			wire master1_req;
			wire master2_req;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:23:3
			assign master1_req = ibex_soc.cipher_if.req & master1_sel;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:24:3
			assign master2_req = ibex_soc.slaves[_mbase_master2].req & master2_sel;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:26:3
			// removed localparam type resp_t
			// Trace: ibex_soc/bus_arbiter2m1s.sv:27:3
			reg [31:0] resp_n;
			reg [31:0] resp_q;
			// Trace: ibex_soc/bus_arbiter2m1s.sv:29:3
			always @(*) begin
				// Trace: ibex_soc/bus_arbiter2m1s.sv:31:5
				resp_n = resp_q;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:32:5
				ibex_soc.cipher_if.gnt = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:33:5
				ibex_soc.slaves[_mbase_master2].gnt = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:35:5
				ibex_soc.ram_if.req = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:36:5
				ibex_soc.ram_if.addr = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:37:5
				ibex_soc.ram_if.we = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:38:5
				ibex_soc.ram_if.be = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:39:5
				ibex_soc.ram_if.wdata = 1'sb0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:41:5
				if (master1_req && master2_req) begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:44:7
					ibex_soc.ram_if.req = ibex_soc.slaves[_mbase_master2].req;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:45:7
					ibex_soc.ram_if.addr = ibex_soc.slaves[_mbase_master2].addr;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:46:7
					ibex_soc.ram_if.we = ibex_soc.slaves[_mbase_master2].we;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:47:7
					ibex_soc.ram_if.be = ibex_soc.slaves[_mbase_master2].be;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:48:7
					ibex_soc.ram_if.wdata = ibex_soc.slaves[_mbase_master2].wdata;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:49:7
					ibex_soc.slaves[_mbase_master2].gnt = ibex_soc.ram_if.gnt;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:50:7
					ibex_soc.cipher_if.gnt = 'b0;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:51:7
					resp_n = 32'd1;
				end
				else begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:53:7
					if (master1_req) begin
						// Trace: ibex_soc/bus_arbiter2m1s.sv:54:9
						ibex_soc.ram_if.req = ibex_soc.cipher_if.req;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:55:9
						ibex_soc.ram_if.addr = ibex_soc.cipher_if.addr;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:56:9
						ibex_soc.ram_if.we = ibex_soc.cipher_if.we;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:57:9
						ibex_soc.ram_if.be = ibex_soc.cipher_if.be;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:58:9
						ibex_soc.ram_if.wdata = ibex_soc.cipher_if.wdata;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:59:9
						ibex_soc.cipher_if.gnt = ibex_soc.ram_if.gnt;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:60:9
						ibex_soc.slaves[_mbase_master2].gnt = 'b0;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:61:9
						resp_n = 32'd0;
					end
					if (master2_req) begin
						// Trace: ibex_soc/bus_arbiter2m1s.sv:64:9
						ibex_soc.ram_if.req = ibex_soc.slaves[_mbase_master2].req;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:65:9
						ibex_soc.ram_if.addr = ibex_soc.slaves[_mbase_master2].addr;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:66:9
						ibex_soc.ram_if.we = ibex_soc.slaves[_mbase_master2].we;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:67:9
						ibex_soc.ram_if.be = ibex_soc.slaves[_mbase_master2].be;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:68:9
						ibex_soc.ram_if.wdata = ibex_soc.slaves[_mbase_master2].wdata;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:69:9
						ibex_soc.slaves[_mbase_master2].gnt = ibex_soc.ram_if.gnt;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:70:9
						ibex_soc.cipher_if.gnt = 'b0;
						// Trace: ibex_soc/bus_arbiter2m1s.sv:71:9
						resp_n = 32'd1;
					end
				end
			end
			// Trace: ibex_soc/bus_arbiter2m1s.sv:78:3
			always @(*) begin
				// Trace: ibex_soc/bus_arbiter2m1s.sv:79:5
				ibex_soc.cipher_if.rdata = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:80:5
				ibex_soc.cipher_if.rvalid = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:81:5
				ibex_soc.cipher_if.err = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:82:5
				ibex_soc.slaves[_mbase_master2].rdata = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:83:5
				ibex_soc.slaves[_mbase_master2].rvalid = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:84:5
				ibex_soc.slaves[_mbase_master2].err = 'b0;
				// Trace: ibex_soc/bus_arbiter2m1s.sv:86:5
				if (resp_q == 32'd0) begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:87:7
					ibex_soc.cipher_if.rdata = ibex_soc.ram_if.rdata;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:88:7
					ibex_soc.cipher_if.rvalid = ibex_soc.ram_if.rvalid;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:89:7
					ibex_soc.cipher_if.err = ibex_soc.ram_if.err;
				end
				else begin
					// Trace: ibex_soc/bus_arbiter2m1s.sv:92:7
					ibex_soc.slaves[_mbase_master2].rdata = ibex_soc.ram_if.rdata;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:93:7
					ibex_soc.slaves[_mbase_master2].rvalid = ibex_soc.ram_if.rvalid;
					// Trace: ibex_soc/bus_arbiter2m1s.sv:94:7
					ibex_soc.slaves[_mbase_master2].err = ibex_soc.ram_if.err;
				end
			end
			// Trace: ibex_soc/bus_arbiter2m1s.sv:98:3
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/bus_arbiter2m1s.sv:99:5
				if (!rst_ni)
					// Trace: ibex_soc/bus_arbiter2m1s.sv:100:7
					resp_q <= 32'd0;
				else
					// Trace: ibex_soc/bus_arbiter2m1s.sv:102:7
					resp_q <= resp_n;
		end
	endgenerate
	assign arbiter_inst1.clk_i = clk;
	assign arbiter_inst1.rst_ni = rst_n;
	// Trace: ibex_soc/ibex_soc.sv:287:5
	localparam [31:0] ibex_soc_pkg_BLINKY_SIZE = 32'h00000001;
	localparam [31:0] ibex_soc_pkg_BLINKY_MASK = ~0;
	localparam [31:0] ibex_soc_pkg_BLINKY_START = 32'h20000000;
	localparam [31:0] ibex_soc_pkg_CIPHER_SIZE = 32'h10000000;
	localparam [31:0] ibex_soc_pkg_CIPHER_MASK = ~268435455;
	localparam [31:0] ibex_soc_pkg_CIPHER_START = 32'h50000000;
	localparam [31:0] ibex_soc_pkg_EOC_SIZE = 32'h00000001;
	localparam [31:0] ibex_soc_pkg_EOC_MASK = ~0;
	localparam [31:0] ibex_soc_pkg_EOC_START = 32'h40000000;
	localparam [31:0] ibex_soc_pkg_PARIO_SIZE = 32'h00000008;
	localparam [31:0] ibex_soc_pkg_PARIO_MASK = ~7;
	localparam [31:0] ibex_soc_pkg_PARIO_START = 32'h30000000;
	localparam [31:0] ibex_soc_pkg_ROM_MASK = ~8191;
	localparam [31:0] ibex_soc_pkg_UART_SIZE = 32'h00000010;
	localparam [31:0] ibex_soc_pkg_UART_MASK = ~15;
	localparam [31:0] ibex_soc_pkg_UART_START = 32'h10000000;
	// expanded module instance: bus_mux
	localparam _bbase_FB2AF_slave = 0;
	localparam _param_FB2AF_N_SLAVES = 7;
	localparam _param_FB2AF_START_ADDR = {ibex_soc_pkg_ROM_START, ibex_soc_pkg_RAM_START, ibex_soc_pkg_UART_START, ibex_soc_pkg_BLINKY_START, ibex_soc_pkg_PARIO_START, ibex_soc_pkg_EOC_START, ibex_soc_pkg_CIPHER_START};
	localparam _param_FB2AF_MASK = {ibex_soc_pkg_ROM_MASK, ibex_soc_pkg_RAM_START, ibex_soc_pkg_UART_MASK, ibex_soc_pkg_BLINKY_MASK, ibex_soc_pkg_PARIO_MASK, ibex_soc_pkg_EOC_MASK, ibex_soc_pkg_CIPHER_MASK};
	generate
		if (1) begin : bus_mux
			// Trace: ibex_soc/bus_mux1mNs.sv:12:13
			localparam signed [31:0] N_SLAVES = _param_FB2AF_N_SLAVES;
			// Trace: ibex_soc/bus_mux1mNs.sv:13:13
			localparam signed [223:0] START_ADDR = _param_FB2AF_START_ADDR;
			// Trace: ibex_soc/bus_mux1mNs.sv:14:13
			localparam signed [223:0] MASK = _param_FB2AF_MASK;
			// Trace: ibex_soc/bus_mux1mNs.sv:16:3
			wire clk_i;
			// Trace: ibex_soc/bus_mux1mNs.sv:17:3
			wire rst_ni;
			// Trace: ibex_soc/bus_mux1mNs.sv:18:3
			// removed modport instance master
			// Trace: ibex_soc/bus_mux1mNs.sv:19:3
			localparam _mbase_slave = 0;
			// Trace: ibex_soc/bus_mux1mNs.sv:22:3
			wire [6:0] mux_gnt;
			wire [6:0] mux_rvalid;
			wire [6:0] mux_req;
			wire [6:0] mux_err;
			// Trace: ibex_soc/bus_mux1mNs.sv:23:3
			wire [31:0] local_rdata [0:6];
			// Trace: ibex_soc/bus_mux1mNs.sv:24:3
			reg bus_err_rvalid_n;
			reg bus_err_rvalid_q;
			// Trace: ibex_soc/bus_mux1mNs.sv:26:3
			genvar i;
			// Trace: ibex_soc/bus_mux1mNs.sv:27:3
			for (i = 0; i < N_SLAVES; i = i + 1) begin : genblk1
				// Trace: ibex_soc/bus_mux1mNs.sv:29:7
				assign mux_req[i] = ibex_soc.data_if.req & ((ibex_soc.data_if.addr & MASK[(6 - i) * 32+:32]) == START_ADDR[(6 - i) * 32+:32]);
				// Trace: ibex_soc/bus_mux1mNs.sv:30:7
				assign ibex_soc.slaves[i + _mbase_slave].req = mux_req[i];
				// Trace: ibex_soc/bus_mux1mNs.sv:31:7
				assign ibex_soc.slaves[i + _mbase_slave].addr = ibex_soc.data_if.addr;
				// Trace: ibex_soc/bus_mux1mNs.sv:32:7
				assign ibex_soc.slaves[i + _mbase_slave].we = ibex_soc.data_if.we;
				// Trace: ibex_soc/bus_mux1mNs.sv:33:7
				assign ibex_soc.slaves[i + _mbase_slave].be = ibex_soc.data_if.be;
				// Trace: ibex_soc/bus_mux1mNs.sv:34:7
				assign ibex_soc.slaves[i + _mbase_slave].wdata = ibex_soc.data_if.wdata;
				// Trace: ibex_soc/bus_mux1mNs.sv:38:7
				assign mux_gnt[i] = ibex_soc.slaves[i + _mbase_slave].gnt;
				// Trace: ibex_soc/bus_mux1mNs.sv:39:7
				assign mux_err[i] = ibex_soc.slaves[i + _mbase_slave].err;
				// Trace: ibex_soc/bus_mux1mNs.sv:40:7
				assign mux_rvalid[i] = ibex_soc.slaves[i + _mbase_slave].rvalid;
				// Trace: ibex_soc/bus_mux1mNs.sv:41:7
				assign local_rdata[i] = ibex_soc.slaves[i + _mbase_slave].rdata;
			end
			// Trace: ibex_soc/bus_mux1mNs.sv:47:3
			integer j;
			// Trace: ibex_soc/bus_mux1mNs.sv:48:3
			always @(*) begin
				// Trace: ibex_soc/bus_mux1mNs.sv:49:5
				ibex_soc.data_if.rdata = 1'sb0;
				// Trace: ibex_soc/bus_mux1mNs.sv:50:5
				for (j = 0; j < N_SLAVES; j = j + 1)
					begin
						// Trace: ibex_soc/bus_mux1mNs.sv:52:7
						if (mux_rvalid[j])
							// Trace: ibex_soc/bus_mux1mNs.sv:53:9
							ibex_soc.data_if.rdata = local_rdata[j];
					end
			end
			// Trace: ibex_soc/bus_mux1mNs.sv:60:3
			assign ibex_soc.data_if.rvalid = |mux_rvalid | bus_err_rvalid_q;
			// Trace: ibex_soc/bus_mux1mNs.sv:61:3
			assign ibex_soc.data_if.err = |mux_err | bus_err_rvalid_q;
			// Trace: ibex_soc/bus_mux1mNs.sv:63:3
			always @(*) begin
				// Trace: ibex_soc/bus_mux1mNs.sv:65:5
				ibex_soc.data_if.gnt = |mux_gnt;
				// Trace: ibex_soc/bus_mux1mNs.sv:66:5
				bus_err_rvalid_n = 1'b0;
				// Trace: ibex_soc/bus_mux1mNs.sv:69:5
				if (ibex_soc.data_if.req & ~|mux_req) begin
					// Trace: ibex_soc/bus_mux1mNs.sv:70:7
					ibex_soc.data_if.gnt = 1'b1;
					// Trace: ibex_soc/bus_mux1mNs.sv:71:7
					bus_err_rvalid_n = 1'b1;
				end
			end
			// Trace: ibex_soc/bus_mux1mNs.sv:76:3
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/bus_mux1mNs.sv:78:5
				if (!rst_ni)
					// Trace: ibex_soc/bus_mux1mNs.sv:79:7
					bus_err_rvalid_q <= 1'b0;
				else
					// Trace: ibex_soc/bus_mux1mNs.sv:81:7
					bus_err_rvalid_q <= bus_err_rvalid_n;
		end
	endgenerate
	assign bus_mux.clk_i = clk;
	assign bus_mux.rst_ni = rst_n;
	// Trace: ibex_soc/ibex_soc.sv:314:5
	// expanded module instance: rom_wrapper_inst
	localparam _param_8BAB8_DATA_WIDTH = ROM_DATA_WIDTH;
	localparam _param_8BAB8_ADDR_WIDTH = ROM_ADDR_WIDTH;
	generate
		if (1) begin : rom_wrapper_inst
			// Trace: ibex_soc/rom_wrapper.sv:5:15
			localparam DATA_WIDTH = _param_8BAB8_DATA_WIDTH;
			// Trace: ibex_soc/rom_wrapper.sv:6:15
			localparam ADDR_WIDTH = _param_8BAB8_ADDR_WIDTH;
			// Trace: ibex_soc/rom_wrapper.sv:8:5
			wire clk_i;
			// Trace: ibex_soc/rom_wrapper.sv:9:5
			wire rst_ni;
			// Trace: ibex_soc/rom_wrapper.sv:10:5
			// removed modport instance bus
			// Trace: ibex_soc/rom_wrapper.sv:13:5
			wire rom0_clk;
			// Trace: ibex_soc/rom_wrapper.sv:14:5
			wire rom0_cs;
			// Trace: ibex_soc/rom_wrapper.sv:15:5
			wire [ADDR_WIDTH - 1:0] rom0_addr;
			// Trace: ibex_soc/rom_wrapper.sv:16:5
			wire [DATA_WIDTH - 1:0] rom0_dout;
			// Trace: ibex_soc/rom_wrapper.sv:19:5
			wire rom1_clk;
			// Trace: ibex_soc/rom_wrapper.sv:20:5
			wire rom1_cs;
			// Trace: ibex_soc/rom_wrapper.sv:21:5
			wire [ADDR_WIDTH - 1:0] rom1_addr;
			// Trace: ibex_soc/rom_wrapper.sv:22:5
			wire [DATA_WIDTH - 1:0] rom1_dout;
			// Trace: ibex_soc/rom_wrapper.sv:26:5
			assign ibex_soc.rom_if.gnt = ibex_soc.rom_if.req;
			// Trace: ibex_soc/rom_wrapper.sv:29:5
			assign ibex_soc.rom_if.err = 1'b0;
			// Trace: ibex_soc/rom_wrapper.sv:32:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/rom_wrapper.sv:33:9
				if (!rst_ni)
					// Trace: ibex_soc/rom_wrapper.sv:34:13
					ibex_soc.rom_if.rvalid <= 1'sb0;
				else
					// Trace: ibex_soc/rom_wrapper.sv:36:13
					ibex_soc.rom_if.rvalid <= ibex_soc.rom_if.req;
			// Trace: ibex_soc/rom_wrapper.sv:41:5
			wire rom0_select;
			// Trace: ibex_soc/rom_wrapper.sv:42:5
			wire rom1_select;
			// Trace: ibex_soc/rom_wrapper.sv:43:5
			reg rom0_select_d;
			// Trace: ibex_soc/rom_wrapper.sv:44:5
			reg rom1_select_d;
			// Trace: ibex_soc/rom_wrapper.sv:46:5
			assign rom0_select = ibex_soc.rom_if.req && !ibex_soc.rom_if.addr[ADDR_WIDTH + 2];
			// Trace: ibex_soc/rom_wrapper.sv:47:5
			assign rom1_select = ibex_soc.rom_if.req && ibex_soc.rom_if.addr[ADDR_WIDTH + 2];
			// Trace: ibex_soc/rom_wrapper.sv:50:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/rom_wrapper.sv:51:9
				if (!rst_ni) begin
					// Trace: ibex_soc/rom_wrapper.sv:52:13
					rom0_select_d <= 1'b0;
					// Trace: ibex_soc/rom_wrapper.sv:53:13
					rom1_select_d <= 1'b0;
				end
				else begin
					// Trace: ibex_soc/rom_wrapper.sv:55:13
					rom0_select_d <= rom0_select;
					// Trace: ibex_soc/rom_wrapper.sv:56:13
					rom1_select_d <= rom1_select;
				end
			// Trace: ibex_soc/rom_wrapper.sv:63:5
			assign rom0_clk = clk_i;
			// Trace: ibex_soc/rom_wrapper.sv:64:5
			assign rom0_cs = 1'b1;
			// Trace: ibex_soc/rom_wrapper.sv:65:5
			assign rom0_addr = (rom0_select ? ibex_soc.rom_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/rom_wrapper.sv:70:5
			assign rom1_clk = clk_i;
			// Trace: ibex_soc/rom_wrapper.sv:71:5
			assign rom1_cs = 1'b1;
			// Trace: ibex_soc/rom_wrapper.sv:72:5
			assign rom1_addr = (rom1_select ? ibex_soc.rom_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/rom_wrapper.sv:75:5
			assign ibex_soc.rom_if.rdata = (rom0_select_d ? rom0_dout : (rom1_select_d ? rom1_dout : {32 {1'sb0}}));
		end
	endgenerate
	assign rom_wrapper_inst.clk_i = clk;
	assign rom_wrapper_inst.rst_ni = rst_n;
	assign rom0_clk = rom_wrapper_inst.rom0_clk;
	assign rom0_cs = rom_wrapper_inst.rom0_cs;
	assign rom0_addr = rom_wrapper_inst.rom0_addr;
	assign rom_wrapper_inst.rom0_dout = rom0_dout;
	assign rom1_clk = rom_wrapper_inst.rom1_clk;
	assign rom1_cs = rom_wrapper_inst.rom1_cs;
	assign rom1_addr = rom_wrapper_inst.rom1_addr;
	assign rom_wrapper_inst.rom1_dout = rom1_dout;
	// Trace: ibex_soc/ibex_soc.sv:333:5
	// expanded module instance: ram_wrapper_inst
	localparam _param_9DF9C_NUM_WMASKS = SRAM_NUM_WMASKS;
	localparam _param_9DF9C_DATA_WIDTH = SRAM_DATA_WIDTH;
	localparam _param_9DF9C_ADDR_WIDTH = SRAM_ADDR_WIDTH;
	generate
		if (1) begin : ram_wrapper_inst
			// Trace: ibex_soc/ram_wrapper.sv:6:15
			localparam NUM_WMASKS = _param_9DF9C_NUM_WMASKS;
			// Trace: ibex_soc/ram_wrapper.sv:7:15
			localparam DATA_WIDTH = _param_9DF9C_DATA_WIDTH;
			// Trace: ibex_soc/ram_wrapper.sv:8:15
			localparam ADDR_WIDTH = _param_9DF9C_ADDR_WIDTH;
			// Trace: ibex_soc/ram_wrapper.sv:10:5
			wire clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:11:5
			wire rst_ni;
			// Trace: ibex_soc/ram_wrapper.sv:12:5
			// removed modport instance bus
			// Trace: ibex_soc/ram_wrapper.sv:15:5
			wire sram0_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:16:5
			wire sram0_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:17:5
			wire sram0_web0;
			// Trace: ibex_soc/ram_wrapper.sv:18:5
			wire [NUM_WMASKS - 1:0] sram0_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:19:5
			wire [ADDR_WIDTH - 1:0] sram0_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:20:5
			wire [DATA_WIDTH - 1:0] sram0_din0;
			// Trace: ibex_soc/ram_wrapper.sv:21:5
			wire [DATA_WIDTH - 1:0] sram0_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:23:5
			wire sram0_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:24:5
			wire sram0_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:25:5
			wire [ADDR_WIDTH - 1:0] sram0_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:26:5
			wire [DATA_WIDTH - 1:0] sram0_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:29:5
			wire sram1_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:30:5
			wire sram1_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:31:5
			wire sram1_web0;
			// Trace: ibex_soc/ram_wrapper.sv:32:5
			wire [NUM_WMASKS - 1:0] sram1_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:33:5
			wire [ADDR_WIDTH - 1:0] sram1_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:34:5
			wire [DATA_WIDTH - 1:0] sram1_din0;
			// Trace: ibex_soc/ram_wrapper.sv:35:5
			wire [DATA_WIDTH - 1:0] sram1_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:37:5
			wire sram1_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:38:5
			wire sram1_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:39:5
			wire [ADDR_WIDTH - 1:0] sram1_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:40:5
			wire [DATA_WIDTH - 1:0] sram1_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:43:5
			wire sram2_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:44:5
			wire sram2_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:45:5
			wire sram2_web0;
			// Trace: ibex_soc/ram_wrapper.sv:46:5
			wire [NUM_WMASKS - 1:0] sram2_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:47:5
			wire [ADDR_WIDTH - 1:0] sram2_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:48:5
			wire [DATA_WIDTH - 1:0] sram2_din0;
			// Trace: ibex_soc/ram_wrapper.sv:49:5
			wire [DATA_WIDTH - 1:0] sram2_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:51:5
			wire sram2_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:52:5
			wire sram2_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:53:5
			wire [ADDR_WIDTH - 1:0] sram2_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:54:5
			wire [DATA_WIDTH - 1:0] sram2_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:57:5
			wire sram3_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:58:5
			wire sram3_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:59:5
			wire sram3_web0;
			// Trace: ibex_soc/ram_wrapper.sv:60:5
			wire [NUM_WMASKS - 1:0] sram3_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:61:5
			wire [ADDR_WIDTH - 1:0] sram3_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:62:5
			wire [DATA_WIDTH - 1:0] sram3_din0;
			// Trace: ibex_soc/ram_wrapper.sv:63:5
			wire [DATA_WIDTH - 1:0] sram3_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:65:5
			wire sram3_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:66:5
			wire sram3_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:67:5
			wire [ADDR_WIDTH - 1:0] sram3_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:68:5
			wire [DATA_WIDTH - 1:0] sram3_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:71:5
			wire sram4_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:72:5
			wire sram4_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:73:5
			wire sram4_web0;
			// Trace: ibex_soc/ram_wrapper.sv:74:5
			wire [NUM_WMASKS - 1:0] sram4_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:75:5
			wire [ADDR_WIDTH - 1:0] sram4_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:76:5
			wire [DATA_WIDTH - 1:0] sram4_din0;
			// Trace: ibex_soc/ram_wrapper.sv:77:5
			wire [DATA_WIDTH - 1:0] sram4_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:79:5
			wire sram4_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:80:5
			wire sram4_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:81:5
			wire [ADDR_WIDTH - 1:0] sram4_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:82:5
			wire [DATA_WIDTH - 1:0] sram4_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:85:5
			wire sram5_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:86:5
			wire sram5_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:87:5
			wire sram5_web0;
			// Trace: ibex_soc/ram_wrapper.sv:88:5
			wire [NUM_WMASKS - 1:0] sram5_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:89:5
			wire [ADDR_WIDTH - 1:0] sram5_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:90:5
			wire [DATA_WIDTH - 1:0] sram5_din0;
			// Trace: ibex_soc/ram_wrapper.sv:91:5
			wire [DATA_WIDTH - 1:0] sram5_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:93:5
			wire sram5_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:94:5
			wire sram5_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:95:5
			wire [ADDR_WIDTH - 1:0] sram5_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:96:5
			wire [DATA_WIDTH - 1:0] sram5_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:99:5
			wire sram6_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:100:5
			wire sram6_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:101:5
			wire sram6_web0;
			// Trace: ibex_soc/ram_wrapper.sv:102:5
			wire [NUM_WMASKS - 1:0] sram6_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:103:5
			wire [ADDR_WIDTH - 1:0] sram6_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:104:5
			wire [DATA_WIDTH - 1:0] sram6_din0;
			// Trace: ibex_soc/ram_wrapper.sv:105:5
			wire [DATA_WIDTH - 1:0] sram6_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:107:5
			wire sram6_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:108:5
			wire sram6_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:109:5
			wire [ADDR_WIDTH - 1:0] sram6_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:110:5
			wire [DATA_WIDTH - 1:0] sram6_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:113:5
			wire sram7_clk0;
			// Trace: ibex_soc/ram_wrapper.sv:114:5
			wire sram7_csb0;
			// Trace: ibex_soc/ram_wrapper.sv:115:5
			wire sram7_web0;
			// Trace: ibex_soc/ram_wrapper.sv:116:5
			wire [NUM_WMASKS - 1:0] sram7_wmask0;
			// Trace: ibex_soc/ram_wrapper.sv:117:5
			wire [ADDR_WIDTH - 1:0] sram7_addr0;
			// Trace: ibex_soc/ram_wrapper.sv:118:5
			wire [DATA_WIDTH - 1:0] sram7_din0;
			// Trace: ibex_soc/ram_wrapper.sv:119:5
			wire [DATA_WIDTH - 1:0] sram7_dout0;
			// Trace: ibex_soc/ram_wrapper.sv:121:5
			wire sram7_clk1;
			// Trace: ibex_soc/ram_wrapper.sv:122:5
			wire sram7_csb1;
			// Trace: ibex_soc/ram_wrapper.sv:123:5
			wire [ADDR_WIDTH - 1:0] sram7_addr1;
			// Trace: ibex_soc/ram_wrapper.sv:124:5
			wire [DATA_WIDTH - 1:0] sram7_dout1;
			// Trace: ibex_soc/ram_wrapper.sv:128:5
			assign ibex_soc.ram_if.gnt = ibex_soc.ram_if.req;
			// Trace: ibex_soc/ram_wrapper.sv:131:5
			assign ibex_soc.ram_if.err = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:134:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/ram_wrapper.sv:135:9
				if (!rst_ni)
					// Trace: ibex_soc/ram_wrapper.sv:136:13
					ibex_soc.ram_if.rvalid <= 1'sb0;
				else
					// Trace: ibex_soc/ram_wrapper.sv:138:13
					ibex_soc.ram_if.rvalid <= ibex_soc.ram_if.req;
			// Trace: ibex_soc/ram_wrapper.sv:143:5
			wire sram0_select;
			// Trace: ibex_soc/ram_wrapper.sv:144:5
			wire sram1_select;
			// Trace: ibex_soc/ram_wrapper.sv:145:5
			wire sram2_select;
			// Trace: ibex_soc/ram_wrapper.sv:146:5
			wire sram3_select;
			// Trace: ibex_soc/ram_wrapper.sv:147:5
			wire sram4_select;
			// Trace: ibex_soc/ram_wrapper.sv:148:5
			wire sram5_select;
			// Trace: ibex_soc/ram_wrapper.sv:149:5
			wire sram6_select;
			// Trace: ibex_soc/ram_wrapper.sv:150:5
			wire sram7_select;
			// Trace: ibex_soc/ram_wrapper.sv:152:5
			reg sram0_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:153:5
			reg sram1_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:154:5
			reg sram2_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:155:5
			reg sram3_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:156:5
			reg sram4_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:157:5
			reg sram5_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:158:5
			reg sram6_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:159:5
			reg sram7_select_d;
			// Trace: ibex_soc/ram_wrapper.sv:161:5
			assign sram0_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd0);
			// Trace: ibex_soc/ram_wrapper.sv:162:5
			assign sram1_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd1);
			// Trace: ibex_soc/ram_wrapper.sv:163:5
			assign sram2_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd2);
			// Trace: ibex_soc/ram_wrapper.sv:164:5
			assign sram3_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd3);
			// Trace: ibex_soc/ram_wrapper.sv:165:5
			assign sram4_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd4);
			// Trace: ibex_soc/ram_wrapper.sv:166:5
			assign sram5_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd5);
			// Trace: ibex_soc/ram_wrapper.sv:167:5
			assign sram6_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd6);
			// Trace: ibex_soc/ram_wrapper.sv:168:5
			assign sram7_select = ibex_soc.ram_if.req && (ibex_soc.ram_if.addr[ADDR_WIDTH + 5:ADDR_WIDTH + 2] == 4'd7);
			// Trace: ibex_soc/ram_wrapper.sv:171:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/ram_wrapper.sv:172:9
				if (!rst_ni) begin
					// Trace: ibex_soc/ram_wrapper.sv:173:13
					sram0_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:174:13
					sram1_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:175:13
					sram2_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:176:13
					sram3_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:177:13
					sram4_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:178:13
					sram5_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:179:13
					sram6_select_d <= 1'b0;
					// Trace: ibex_soc/ram_wrapper.sv:180:13
					sram7_select_d <= 1'b0;
				end
				else begin
					// Trace: ibex_soc/ram_wrapper.sv:182:13
					sram0_select_d <= sram0_select;
					// Trace: ibex_soc/ram_wrapper.sv:183:13
					sram1_select_d <= sram1_select;
					// Trace: ibex_soc/ram_wrapper.sv:184:13
					sram2_select_d <= sram2_select;
					// Trace: ibex_soc/ram_wrapper.sv:185:13
					sram3_select_d <= sram3_select;
					// Trace: ibex_soc/ram_wrapper.sv:186:13
					sram4_select_d <= sram4_select;
					// Trace: ibex_soc/ram_wrapper.sv:187:13
					sram5_select_d <= sram5_select;
					// Trace: ibex_soc/ram_wrapper.sv:188:13
					sram6_select_d <= sram6_select;
					// Trace: ibex_soc/ram_wrapper.sv:189:13
					sram7_select_d <= sram7_select;
				end
			// Trace: ibex_soc/ram_wrapper.sv:196:5
			assign sram0_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:197:5
			assign sram0_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:198:5
			assign sram0_web0 = (sram0_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:199:5
			assign sram0_wmask0 = (sram0_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:200:5
			assign sram0_addr0 = (sram0_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:201:5
			assign sram0_din0 = (sram0_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:204:5
			assign sram0_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:205:5
			assign sram0_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:206:5
			assign sram0_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:211:5
			assign sram1_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:212:5
			assign sram1_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:213:5
			assign sram1_web0 = (sram1_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:214:5
			assign sram1_wmask0 = (sram1_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:215:5
			assign sram1_addr0 = (sram1_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:216:5
			assign sram1_din0 = (sram1_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:219:5
			assign sram1_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:220:5
			assign sram1_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:221:5
			assign sram1_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:226:5
			assign sram2_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:227:5
			assign sram2_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:228:5
			assign sram2_web0 = (sram2_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:229:5
			assign sram2_wmask0 = (sram2_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:230:5
			assign sram2_addr0 = (sram2_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:231:5
			assign sram2_din0 = (sram2_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:234:5
			assign sram2_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:235:5
			assign sram2_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:236:5
			assign sram2_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:241:5
			assign sram3_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:242:5
			assign sram3_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:243:5
			assign sram3_web0 = (sram3_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:244:5
			assign sram3_wmask0 = (sram3_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:245:5
			assign sram3_addr0 = (sram3_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:246:5
			assign sram3_din0 = (sram3_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:249:5
			assign sram3_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:250:5
			assign sram3_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:251:5
			assign sram3_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:256:5
			assign sram4_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:257:5
			assign sram4_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:258:5
			assign sram4_web0 = (sram4_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:259:5
			assign sram4_wmask0 = (sram4_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:260:5
			assign sram4_addr0 = (sram4_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:261:5
			assign sram4_din0 = (sram4_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:264:5
			assign sram4_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:265:5
			assign sram4_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:266:5
			assign sram4_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:271:5
			assign sram5_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:272:5
			assign sram5_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:273:5
			assign sram5_web0 = (sram5_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:274:5
			assign sram5_wmask0 = (sram5_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:275:5
			assign sram5_addr0 = (sram5_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:276:5
			assign sram5_din0 = (sram5_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:279:5
			assign sram5_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:280:5
			assign sram5_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:281:5
			assign sram5_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:286:5
			assign sram6_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:287:5
			assign sram6_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:288:5
			assign sram6_web0 = (sram6_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:289:5
			assign sram6_wmask0 = (sram6_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:290:5
			assign sram6_addr0 = (sram6_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:291:5
			assign sram6_din0 = (sram6_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:294:5
			assign sram6_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:295:5
			assign sram6_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:296:5
			assign sram6_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:301:5
			assign sram7_clk0 = clk_i;
			// Trace: ibex_soc/ram_wrapper.sv:302:5
			assign sram7_csb0 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:303:5
			assign sram7_web0 = (sram7_select ? !ibex_soc.ram_if.we : 1'b1);
			// Trace: ibex_soc/ram_wrapper.sv:304:5
			assign sram7_wmask0 = (sram7_select ? ibex_soc.ram_if.be : 4'b0000);
			// Trace: ibex_soc/ram_wrapper.sv:305:5
			assign sram7_addr0 = (sram7_select ? ibex_soc.ram_if.addr[ADDR_WIDTH + 1:2] : {ADDR_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:306:5
			assign sram7_din0 = (sram7_select ? ibex_soc.ram_if.wdata : {DATA_WIDTH {1'sb0}});
			// Trace: ibex_soc/ram_wrapper.sv:309:5
			assign sram7_clk1 = 1'b0;
			// Trace: ibex_soc/ram_wrapper.sv:310:5
			assign sram7_csb1 = 1'b1;
			// Trace: ibex_soc/ram_wrapper.sv:311:5
			assign sram7_addr1 = 1'sb0;
			// Trace: ibex_soc/ram_wrapper.sv:314:5
			assign ibex_soc.ram_if.rdata = (sram0_select_d ? sram0_dout0 : (sram1_select_d ? sram1_dout0 : (sram2_select_d ? sram2_dout0 : (sram3_select_d ? sram3_dout0 : (sram4_select_d ? sram4_dout0 : (sram5_select_d ? sram5_dout0 : (sram6_select_d ? sram6_dout0 : (sram7_select_d ? sram7_dout0 : {32 {1'sb0}}))))))));
		end
	endgenerate
	assign ram_wrapper_inst.clk_i = clk;
	assign ram_wrapper_inst.rst_ni = rst_n;
	assign sram0_clk0 = ram_wrapper_inst.sram0_clk0;
	assign sram0_csb0 = ram_wrapper_inst.sram0_csb0;
	assign sram0_web0 = ram_wrapper_inst.sram0_web0;
	assign sram0_wmask0 = ram_wrapper_inst.sram0_wmask0;
	assign sram0_addr0 = ram_wrapper_inst.sram0_addr0;
	assign sram0_din0 = ram_wrapper_inst.sram0_din0;
	assign ram_wrapper_inst.sram0_dout0 = sram0_dout0;
	assign sram0_clk1 = ram_wrapper_inst.sram0_clk1;
	assign sram0_csb1 = ram_wrapper_inst.sram0_csb1;
	assign sram0_addr1 = ram_wrapper_inst.sram0_addr1;
	assign ram_wrapper_inst.sram0_dout1 = sram0_dout1;
	assign sram1_clk0 = ram_wrapper_inst.sram1_clk0;
	assign sram1_csb0 = ram_wrapper_inst.sram1_csb0;
	assign sram1_web0 = ram_wrapper_inst.sram1_web0;
	assign sram1_wmask0 = ram_wrapper_inst.sram1_wmask0;
	assign sram1_addr0 = ram_wrapper_inst.sram1_addr0;
	assign sram1_din0 = ram_wrapper_inst.sram1_din0;
	assign ram_wrapper_inst.sram1_dout0 = sram1_dout0;
	assign sram1_clk1 = ram_wrapper_inst.sram1_clk1;
	assign sram1_csb1 = ram_wrapper_inst.sram1_csb1;
	assign sram1_addr1 = ram_wrapper_inst.sram1_addr1;
	assign ram_wrapper_inst.sram1_dout1 = sram1_dout1;
	assign sram2_clk0 = ram_wrapper_inst.sram2_clk0;
	assign sram2_csb0 = ram_wrapper_inst.sram2_csb0;
	assign sram2_web0 = ram_wrapper_inst.sram2_web0;
	assign sram2_wmask0 = ram_wrapper_inst.sram2_wmask0;
	assign sram2_addr0 = ram_wrapper_inst.sram2_addr0;
	assign sram2_din0 = ram_wrapper_inst.sram2_din0;
	assign ram_wrapper_inst.sram2_dout0 = sram2_dout0;
	assign sram2_clk1 = ram_wrapper_inst.sram2_clk1;
	assign sram2_csb1 = ram_wrapper_inst.sram2_csb1;
	assign sram2_addr1 = ram_wrapper_inst.sram2_addr1;
	assign ram_wrapper_inst.sram2_dout1 = sram2_dout1;
	assign sram3_clk0 = ram_wrapper_inst.sram3_clk0;
	assign sram3_csb0 = ram_wrapper_inst.sram3_csb0;
	assign sram3_web0 = ram_wrapper_inst.sram3_web0;
	assign sram3_wmask0 = ram_wrapper_inst.sram3_wmask0;
	assign sram3_addr0 = ram_wrapper_inst.sram3_addr0;
	assign sram3_din0 = ram_wrapper_inst.sram3_din0;
	assign ram_wrapper_inst.sram3_dout0 = sram3_dout0;
	assign sram3_clk1 = ram_wrapper_inst.sram3_clk1;
	assign sram3_csb1 = ram_wrapper_inst.sram3_csb1;
	assign sram3_addr1 = ram_wrapper_inst.sram3_addr1;
	assign ram_wrapper_inst.sram3_dout1 = sram3_dout1;
	assign sram4_clk0 = ram_wrapper_inst.sram4_clk0;
	assign sram4_csb0 = ram_wrapper_inst.sram4_csb0;
	assign sram4_web0 = ram_wrapper_inst.sram4_web0;
	assign sram4_wmask0 = ram_wrapper_inst.sram4_wmask0;
	assign sram4_addr0 = ram_wrapper_inst.sram4_addr0;
	assign sram4_din0 = ram_wrapper_inst.sram4_din0;
	assign ram_wrapper_inst.sram4_dout0 = sram4_dout0;
	assign sram4_clk1 = ram_wrapper_inst.sram4_clk1;
	assign sram4_csb1 = ram_wrapper_inst.sram4_csb1;
	assign sram4_addr1 = ram_wrapper_inst.sram4_addr1;
	assign ram_wrapper_inst.sram4_dout1 = sram4_dout1;
	assign sram5_clk0 = ram_wrapper_inst.sram5_clk0;
	assign sram5_csb0 = ram_wrapper_inst.sram5_csb0;
	assign sram5_web0 = ram_wrapper_inst.sram5_web0;
	assign sram5_wmask0 = ram_wrapper_inst.sram5_wmask0;
	assign sram5_addr0 = ram_wrapper_inst.sram5_addr0;
	assign sram5_din0 = ram_wrapper_inst.sram5_din0;
	assign ram_wrapper_inst.sram5_dout0 = sram5_dout0;
	assign sram5_clk1 = ram_wrapper_inst.sram5_clk1;
	assign sram5_csb1 = ram_wrapper_inst.sram5_csb1;
	assign sram5_addr1 = ram_wrapper_inst.sram5_addr1;
	assign ram_wrapper_inst.sram5_dout1 = sram5_dout1;
	assign sram6_clk0 = ram_wrapper_inst.sram6_clk0;
	assign sram6_csb0 = ram_wrapper_inst.sram6_csb0;
	assign sram6_web0 = ram_wrapper_inst.sram6_web0;
	assign sram6_wmask0 = ram_wrapper_inst.sram6_wmask0;
	assign sram6_addr0 = ram_wrapper_inst.sram6_addr0;
	assign sram6_din0 = ram_wrapper_inst.sram6_din0;
	assign ram_wrapper_inst.sram6_dout0 = sram6_dout0;
	assign sram6_clk1 = ram_wrapper_inst.sram6_clk1;
	assign sram6_csb1 = ram_wrapper_inst.sram6_csb1;
	assign sram6_addr1 = ram_wrapper_inst.sram6_addr1;
	assign ram_wrapper_inst.sram6_dout1 = sram6_dout1;
	assign sram7_clk0 = ram_wrapper_inst.sram7_clk0;
	assign sram7_csb0 = ram_wrapper_inst.sram7_csb0;
	assign sram7_web0 = ram_wrapper_inst.sram7_web0;
	assign sram7_wmask0 = ram_wrapper_inst.sram7_wmask0;
	assign sram7_addr0 = ram_wrapper_inst.sram7_addr0;
	assign sram7_din0 = ram_wrapper_inst.sram7_din0;
	assign ram_wrapper_inst.sram7_dout0 = sram7_dout0;
	assign sram7_clk1 = ram_wrapper_inst.sram7_clk1;
	assign sram7_csb1 = ram_wrapper_inst.sram7_csb1;
	assign sram7_addr1 = ram_wrapper_inst.sram7_addr1;
	assign ram_wrapper_inst.sram7_dout1 = sram7_dout1;
	// Trace: ibex_soc/ibex_soc.sv:454:5
	// expanded module instance: uart_wrapper_inst
	localparam _bbase_E2EEA_bus = 2;
	localparam _param_E2EEA_FREQUENCY = CLOCK_FREQUENCY;
	localparam _param_E2EEA_BAUDRATE = 9600;
	generate
		if (1) begin : uart_wrapper_inst
			// Trace: ibex_soc/uart_wrapper.sv:7:15
			localparam FREQUENCY = _param_E2EEA_FREQUENCY;
			// Trace: ibex_soc/uart_wrapper.sv:8:15
			localparam BAUDRATE = _param_E2EEA_BAUDRATE;
			// Trace: ibex_soc/uart_wrapper.sv:10:5
			wire clk_i;
			// Trace: ibex_soc/uart_wrapper.sv:11:5
			wire rst_ni;
			// Trace: ibex_soc/uart_wrapper.sv:12:5
			localparam _mbase_bus = _bbase_E2EEA_bus;
			// Trace: ibex_soc/uart_wrapper.sv:14:5
			wire uart_rx;
			// Trace: ibex_soc/uart_wrapper.sv:15:5
			wire uart_tx;
			// Trace: ibex_soc/uart_wrapper.sv:28:5
			wire [1:1] sv2v_tmp_2A82F;
			assign sv2v_tmp_2A82F = ibex_soc.slaves[_mbase_bus].req;
			always @(*) ibex_soc.slaves[_mbase_bus].gnt = sv2v_tmp_2A82F;
			// Trace: ibex_soc/uart_wrapper.sv:31:5
			wire [1:1] sv2v_tmp_05AE2;
			assign sv2v_tmp_05AE2 = 1'b0;
			always @(*) ibex_soc.slaves[_mbase_bus].err = sv2v_tmp_05AE2;
			// Trace: ibex_soc/uart_wrapper.sv:34:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/uart_wrapper.sv:35:9
				if (!rst_ni)
					// Trace: ibex_soc/uart_wrapper.sv:36:13
					ibex_soc.slaves[_mbase_bus].rvalid <= 1'sb0;
				else
					// Trace: ibex_soc/uart_wrapper.sv:38:13
					ibex_soc.slaves[_mbase_bus].rvalid <= ibex_soc.slaves[_mbase_bus].req;
			// Trace: ibex_soc/uart_wrapper.sv:43:5
			reg [31:0] uart_rdata;
			// Trace: ibex_soc/uart_wrapper.sv:44:5
			reg [7:0] rx_data_d;
			reg rx_flag;
			wire tx_busy;
			reg [15:0] wait_cycles;
			always @(posedge clk_i) begin
				// Trace: ibex_soc/uart_wrapper.sv:45:9
				uart_rdata <= 1'sb0;
				// Trace: ibex_soc/uart_wrapper.sv:46:9
				if (ibex_soc.slaves[_mbase_bus].req && !ibex_soc.slaves[_mbase_bus].we)
					// Trace: ibex_soc/uart_wrapper.sv:47:13
					case (ibex_soc.slaves[_mbase_bus].addr[3:0])
						4'h0:
							// Trace: ibex_soc/uart_wrapper.sv:48:23
							uart_rdata <= {{30 {1'b0}}, tx_busy, rx_flag};
						4'h4:
							// Trace: ibex_soc/uart_wrapper.sv:49:23
							uart_rdata <= rx_data_d;
						4'h8:
							// Trace: ibex_soc/uart_wrapper.sv:50:23
							uart_rdata <= 1'sb0;
						4'hc:
							// Trace: ibex_soc/uart_wrapper.sv:51:23
							uart_rdata <= {{16 {1'b0}}, wait_cycles};
					endcase
			end
			// Trace: ibex_soc/uart_wrapper.sv:56:5
			wire [32:1] sv2v_tmp_7B92E;
			assign sv2v_tmp_7B92E = uart_rdata;
			always @(*) ibex_soc.slaves[_mbase_bus].rdata = sv2v_tmp_7B92E;
			// Trace: ibex_soc/uart_wrapper.sv:58:5
			localparam DEFAULT_WAIT_CYCLES = FREQUENCY / BAUDRATE;
			// Trace: ibex_soc/uart_wrapper.sv:59:5
			// Trace: ibex_soc/uart_wrapper.sv:62:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/uart_wrapper.sv:63:9
				if (!rst_ni)
					// Trace: ibex_soc/uart_wrapper.sv:64:13
					wait_cycles <= DEFAULT_WAIT_CYCLES;
				else
					// Trace: ibex_soc/uart_wrapper.sv:66:13
					if (ibex_soc.slaves[_mbase_bus].req && ibex_soc.slaves[_mbase_bus].we)
						// Trace: ibex_soc/uart_wrapper.sv:67:17
						case (ibex_soc.slaves[_mbase_bus].addr[3:0])
							4'h0:
								;
							4'h4:
								;
							4'h8:
								;
							4'hc: begin
								// Trace: ibex_soc/uart_wrapper.sv:72:25
								if (ibex_soc.slaves[_mbase_bus].be[0])
									// Trace: ibex_soc/uart_wrapper.sv:72:40
									wait_cycles[7:0] <= ibex_soc.slaves[_mbase_bus].wdata[7:0];
								if (ibex_soc.slaves[_mbase_bus].be[1])
									// Trace: ibex_soc/uart_wrapper.sv:73:40
									wait_cycles[15:8] <= ibex_soc.slaves[_mbase_bus].wdata[15:8];
							end
						endcase
			// Trace: ibex_soc/uart_wrapper.sv:81:5
			wire uart_rx_sync;
			// Trace: ibex_soc/uart_wrapper.sv:83:5
			synchronizer #(.FF_COUNT(3)) synchronizer(
				.clk(clk_i),
				.resetn(rst_ni),
				.in(uart_rx),
				.out(uart_rx_sync)
			);
			// Trace: ibex_soc/uart_wrapper.sv:93:5
			// Trace: ibex_soc/uart_wrapper.sv:94:5
			// Trace: ibex_soc/uart_wrapper.sv:96:5
			wire [7:0] rx_data;
			wire rx_done;
			reg rx_done_delayed;
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/uart_wrapper.sv:97:9
				if (!rst_ni) begin
					// Trace: ibex_soc/uart_wrapper.sv:98:13
					rx_flag <= 1'b0;
					// Trace: ibex_soc/uart_wrapper.sv:99:13
					rx_data_d <= 1'sb0;
				end
				else
					// Trace: ibex_soc/uart_wrapper.sv:101:13
					if (!rx_done_delayed && rx_done) begin
						// Trace: ibex_soc/uart_wrapper.sv:102:17
						rx_data_d <= rx_data;
						// Trace: ibex_soc/uart_wrapper.sv:103:17
						rx_flag <= 1'b1;
					end
					else if ((ibex_soc.slaves[_mbase_bus].req && !ibex_soc.slaves[_mbase_bus].we) && (ibex_soc.slaves[_mbase_bus].addr[3:0] == 4'h0))
						// Trace: ibex_soc/uart_wrapper.sv:105:67
						rx_flag <= 1'b0;
			// Trace: ibex_soc/uart_wrapper.sv:109:5
			// Trace: ibex_soc/uart_wrapper.sv:110:5
			// Trace: ibex_soc/uart_wrapper.sv:111:5
			// Trace: ibex_soc/uart_wrapper.sv:113:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/uart_wrapper.sv:114:9
				if (!rst_ni)
					// Trace: ibex_soc/uart_wrapper.sv:115:13
					rx_done_delayed <= 1'b0;
				else
					// Trace: ibex_soc/uart_wrapper.sv:117:13
					rx_done_delayed <= rx_done;
			// Trace: ibex_soc/uart_wrapper.sv:121:5
			uart_rx uart_rx_inst(
				.clk(clk_i),
				.rst(!rst_ni),
				.rx(uart_rx),
				.data(rx_data),
				.valid(rx_done),
				.wait_cycles(wait_cycles)
			);
			// Trace: ibex_soc/uart_wrapper.sv:131:5
			// Trace: ibex_soc/uart_wrapper.sv:133:5
			uart_tx uart_tx_inst(
				.clk(clk_i),
				.rst(!rst_ni),
				.data(ibex_soc.slaves[_mbase_bus].wdata[7:0]),
				.start((ibex_soc.slaves[_mbase_bus].req && ibex_soc.slaves[_mbase_bus].we) && (ibex_soc.slaves[_mbase_bus].addr[3:0] == 4'h8)),
				.tx(uart_tx),
				.busy(tx_busy),
				.wait_cycles(wait_cycles)
			);
		end
	endgenerate
	assign uart_wrapper_inst.clk_i = clk;
	assign uart_wrapper_inst.rst_ni = rst_n;
	assign uart_wrapper_inst.uart_rx = uart_rx_i;
	assign uart_tx_o = uart_wrapper_inst.uart_tx;
	// Trace: ibex_soc/ibex_soc.sv:466:5
	// expanded module instance: blinky_wrapper_inst
	localparam _bbase_EE6C8_bus = 3;
	generate
		if (1) begin : blinky_wrapper_inst
			// Trace: ibex_soc/blinky_wrapper.sv:7:5
			wire clk_i;
			// Trace: ibex_soc/blinky_wrapper.sv:8:5
			wire rst_ni;
			// Trace: ibex_soc/blinky_wrapper.sv:9:5
			localparam _mbase_bus = _bbase_EE6C8_bus;
			// Trace: ibex_soc/blinky_wrapper.sv:11:5
			wire led;
			// Trace: ibex_soc/blinky_wrapper.sv:14:5
			reg blinky;
			// Trace: ibex_soc/blinky_wrapper.sv:17:5
			wire [1:1] sv2v_tmp_2A82F;
			assign sv2v_tmp_2A82F = ibex_soc.slaves[_mbase_bus].req;
			always @(*) ibex_soc.slaves[_mbase_bus].gnt = sv2v_tmp_2A82F;
			// Trace: ibex_soc/blinky_wrapper.sv:20:5
			wire [1:1] sv2v_tmp_05AE2;
			assign sv2v_tmp_05AE2 = 1'b0;
			always @(*) ibex_soc.slaves[_mbase_bus].err = sv2v_tmp_05AE2;
			// Trace: ibex_soc/blinky_wrapper.sv:23:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/blinky_wrapper.sv:24:9
				if (!rst_ni)
					// Trace: ibex_soc/blinky_wrapper.sv:25:13
					ibex_soc.slaves[_mbase_bus].rvalid <= 1'sb0;
				else
					// Trace: ibex_soc/blinky_wrapper.sv:27:13
					ibex_soc.slaves[_mbase_bus].rvalid <= ibex_soc.slaves[_mbase_bus].req;
			// Trace: ibex_soc/blinky_wrapper.sv:32:5
			wire [31:0] uart_rdata;
			// Trace: ibex_soc/blinky_wrapper.sv:33:5
			always @(posedge clk_i) begin
				// Trace: ibex_soc/blinky_wrapper.sv:34:9
				ibex_soc.slaves[_mbase_bus].rdata <= 1'sb0;
				// Trace: ibex_soc/blinky_wrapper.sv:35:9
				if (ibex_soc.slaves[_mbase_bus].req && !ibex_soc.slaves[_mbase_bus].we)
					// Trace: ibex_soc/blinky_wrapper.sv:36:13
					ibex_soc.slaves[_mbase_bus].rdata <= blinky;
			end
			// Trace: ibex_soc/blinky_wrapper.sv:41:5
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/blinky_wrapper.sv:42:9
				if (!rst_ni)
					// Trace: ibex_soc/blinky_wrapper.sv:43:13
					blinky <= 1'sb0;
				else
					// Trace: ibex_soc/blinky_wrapper.sv:45:13
					if (ibex_soc.slaves[_mbase_bus].req && ibex_soc.slaves[_mbase_bus].we)
						// Trace: ibex_soc/blinky_wrapper.sv:46:17
						blinky <= ibex_soc.slaves[_mbase_bus].wdata[0];
			// Trace: ibex_soc/blinky_wrapper.sv:51:5
			assign led = blinky;
		end
	endgenerate
	assign blinky_wrapper_inst.clk_i = clk;
	assign blinky_wrapper_inst.rst_ni = rst_n;
	assign led_o = blinky_wrapper_inst.led;
	// Trace: ibex_soc/ibex_soc.sv:474:5
	// expanded module instance: parallel_out_inst
	localparam _bbase_9CFFA_bus = 4;
	generate
		if (1) begin : parallel_out_inst
			// Trace: ibex_soc/parallel_out.sv:6:3
			wire clk_i;
			// Trace: ibex_soc/parallel_out.sv:7:3
			wire rst_ni;
			// Trace: ibex_soc/parallel_out.sv:8:3
			localparam _mbase_bus = _bbase_9CFFA_bus;
			// Trace: ibex_soc/parallel_out.sv:10:3
			reg parout_valid;
			// Trace: ibex_soc/parallel_out.sv:11:3
			reg [7:0] parout;
			// Trace: ibex_soc/parallel_out.sv:13:3
			reg [7:0] data_n;
			reg [7:0] data_p;
			// Trace: ibex_soc/parallel_out.sv:14:3
			reg [3:0] cnt_n;
			reg [3:0] cnt_p;
			// Trace: ibex_soc/parallel_out.sv:15:3
			reg busy_n;
			reg busy_p;
			// Trace: ibex_soc/parallel_out.sv:18:3
			wire [1:1] sv2v_tmp_2A82F;
			assign sv2v_tmp_2A82F = ibex_soc.slaves[_mbase_bus].req;
			always @(*) ibex_soc.slaves[_mbase_bus].gnt = sv2v_tmp_2A82F;
			// Trace: ibex_soc/parallel_out.sv:20:3
			wire [1:1] sv2v_tmp_05AE2;
			assign sv2v_tmp_05AE2 = 1'b0;
			always @(*) ibex_soc.slaves[_mbase_bus].err = sv2v_tmp_05AE2;
			// Trace: ibex_soc/parallel_out.sv:24:3
			always @(posedge clk_i)
				// Trace: ibex_soc/parallel_out.sv:25:5
				ibex_soc.slaves[_mbase_bus].rvalid <= ibex_soc.slaves[_mbase_bus].req;
			// Trace: ibex_soc/parallel_out.sv:30:3
			always @(posedge clk_i) begin
				// Trace: ibex_soc/parallel_out.sv:31:5
				ibex_soc.slaves[_mbase_bus].rdata <= 32'b00000000000000000000000000000000;
				// Trace: ibex_soc/parallel_out.sv:33:5
				if (ibex_soc.slaves[_mbase_bus].req && !ibex_soc.slaves[_mbase_bus].we)
					// Trace: ibex_soc/parallel_out.sv:34:7
					case (ibex_soc.slaves[_mbase_bus].addr[3:0])
						32'h00000000:
							// Trace: ibex_soc/parallel_out.sv:35:28
							ibex_soc.slaves[_mbase_bus].rdata <= {31'b0000000000000000000000000000000, busy_p};
						32'h00000004:
							// Trace: ibex_soc/parallel_out.sv:36:28
							ibex_soc.slaves[_mbase_bus].rdata <= {24'b000000000000000000000000, data_p};
					endcase
			end
			// Trace: ibex_soc/parallel_out.sv:43:3
			always @(*) begin
				// Trace: ibex_soc/parallel_out.sv:44:5
				busy_n = busy_p;
				// Trace: ibex_soc/parallel_out.sv:45:5
				data_n = data_p;
				// Trace: ibex_soc/parallel_out.sv:46:5
				cnt_n = cnt_p;
				// Trace: ibex_soc/parallel_out.sv:47:5
				parout_valid = 1'b0;
				// Trace: ibex_soc/parallel_out.sv:48:5
				parout = 8'b00000000;
				// Trace: ibex_soc/parallel_out.sv:50:5
				if (ibex_soc.slaves[_mbase_bus].req && ibex_soc.slaves[_mbase_bus].we)
					// Trace: ibex_soc/parallel_out.sv:51:7
					case (ibex_soc.slaves[_mbase_bus].addr[3:0])
						32'h00000000:
							// Trace: ibex_soc/parallel_out.sv:53:11
							if (!busy_p)
								// Trace: ibex_soc/parallel_out.sv:54:13
								busy_n = ibex_soc.slaves[_mbase_bus].wdata[0];
						32'h00000004:
							// Trace: ibex_soc/parallel_out.sv:58:11
							if (!busy_p)
								// Trace: ibex_soc/parallel_out.sv:59:13
								data_n = ibex_soc.slaves[_mbase_bus].wdata;
					endcase
				if (busy_p)
					// Trace: ibex_soc/parallel_out.sv:67:7
					cnt_n = cnt_p + 1;
				if (cnt_p == 4'hf) begin
					// Trace: ibex_soc/parallel_out.sv:70:7
					busy_n = 1'b0;
					// Trace: ibex_soc/parallel_out.sv:71:7
					parout_valid = 1'b1;
					// Trace: ibex_soc/parallel_out.sv:72:7
					parout = data_p;
				end
			end
			// Trace: ibex_soc/parallel_out.sv:78:3
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/parallel_out.sv:79:5
				if (!rst_ni) begin
					// Trace: ibex_soc/parallel_out.sv:80:7
					cnt_p <= 4'b0000;
					// Trace: ibex_soc/parallel_out.sv:81:7
					busy_p <= 1'b0;
					// Trace: ibex_soc/parallel_out.sv:82:7
					data_p <= 8'b00000000;
				end
				else begin
					// Trace: ibex_soc/parallel_out.sv:84:7
					cnt_p <= cnt_n;
					// Trace: ibex_soc/parallel_out.sv:85:7
					busy_p <= busy_n;
					// Trace: ibex_soc/parallel_out.sv:86:7
					data_p <= data_n;
				end
		end
	endgenerate
	assign parallel_out_inst.clk_i = clk;
	assign parallel_out_inst.rst_ni = rst_n;
	assign parout_valid_o = parallel_out_inst.parout_valid;
	assign parout_o = parallel_out_inst.parout;
	// Trace: ibex_soc/ibex_soc.sv:483:5
	// expanded module instance: eoc_controller_inst
	localparam _bbase_32C42_bus = 5;
	generate
		if (1) begin : eoc_controller_inst
			// Trace: ibex_soc/eoc_controller.sv:3:3
			wire clk_i;
			// Trace: ibex_soc/eoc_controller.sv:4:3
			wire rst_ni;
			// Trace: ibex_soc/eoc_controller.sv:5:3
			localparam _mbase_bus = _bbase_32C42_bus;
			// Trace: ibex_soc/eoc_controller.sv:7:3
			wire eoc_o;
			// Trace: ibex_soc/eoc_controller.sv:9:3
			reg eoc_n;
			reg eoc_p;
			// Trace: ibex_soc/eoc_controller.sv:12:3
			wire [1:1] sv2v_tmp_2A82F;
			assign sv2v_tmp_2A82F = ibex_soc.slaves[_mbase_bus].req;
			always @(*) ibex_soc.slaves[_mbase_bus].gnt = sv2v_tmp_2A82F;
			// Trace: ibex_soc/eoc_controller.sv:14:3
			wire [1:1] sv2v_tmp_05AE2;
			assign sv2v_tmp_05AE2 = 1'b0;
			always @(*) ibex_soc.slaves[_mbase_bus].err = sv2v_tmp_05AE2;
			// Trace: ibex_soc/eoc_controller.sv:18:3
			assign eoc_o = eoc_p;
			// Trace: ibex_soc/eoc_controller.sv:22:3
			always @(posedge clk_i)
				// Trace: ibex_soc/eoc_controller.sv:23:5
				ibex_soc.slaves[_mbase_bus].rvalid <= ibex_soc.slaves[_mbase_bus].req;
			// Trace: ibex_soc/eoc_controller.sv:28:3
			always @(posedge clk_i) begin
				// Trace: ibex_soc/eoc_controller.sv:29:5
				ibex_soc.slaves[_mbase_bus].rdata <= 32'b00000000000000000000000000000000;
				// Trace: ibex_soc/eoc_controller.sv:31:5
				if ((ibex_soc.slaves[_mbase_bus].req && !ibex_soc.slaves[_mbase_bus].we) && (ibex_soc.slaves[_mbase_bus].addr[3:0] == 4'b0000))
					// Trace: ibex_soc/eoc_controller.sv:32:7
					ibex_soc.slaves[_mbase_bus].rdata <= {31'b0000000000000000000000000000000, eoc_p};
			end
			// Trace: ibex_soc/eoc_controller.sv:38:3
			always @(*) begin
				// Trace: ibex_soc/eoc_controller.sv:39:5
				eoc_n = eoc_p;
				// Trace: ibex_soc/eoc_controller.sv:41:5
				if ((ibex_soc.slaves[_mbase_bus].req && ibex_soc.slaves[_mbase_bus].we) && (ibex_soc.slaves[_mbase_bus].addr[3:0] == 4'b0000))
					// Trace: ibex_soc/eoc_controller.sv:42:7
					eoc_n = ibex_soc.slaves[_mbase_bus].wdata[0];
			end
			// Trace: ibex_soc/eoc_controller.sv:48:3
			always @(posedge clk_i or negedge rst_ni)
				// Trace: ibex_soc/eoc_controller.sv:49:5
				if (!rst_ni)
					// Trace: ibex_soc/eoc_controller.sv:50:7
					eoc_p <= 1'b0;
				else
					// Trace: ibex_soc/eoc_controller.sv:52:7
					eoc_p <= eoc_n;
		end
	endgenerate
	assign eoc_controller_inst.clk_i = clk;
	assign eoc_controller_inst.rst_ni = rst_n;
	assign eoc_o = eoc_controller_inst.eoc_o;
	// Trace: ibex_soc/ibex_soc.sv:491:5
	// expanded module instance: cipher_wrapper_inst
	localparam _bbase_9EED4_bus_slave = 6;
	generate
		if (1) begin : cipher_wrapper_inst
			// Trace: ibex_soc/cipher_wrapper.sv:5:5
			wire clk_i;
			// Trace: ibex_soc/cipher_wrapper.sv:6:5
			wire rst_ni;
			// Trace: ibex_soc/cipher_wrapper.sv:9:5
			localparam _mbase_bus_slave = _bbase_9EED4_bus_slave;
			// Trace: ibex_soc/cipher_wrapper.sv:12:5
			// removed modport instance bus_master
			// Trace: ibex_soc/cipher_wrapper.sv:15:5
			wire slave_req;
			// Trace: ibex_soc/cipher_wrapper.sv:16:5
			wire slave_gnt;
			// Trace: ibex_soc/cipher_wrapper.sv:17:5
			wire [31:0] slave_addr;
			// Trace: ibex_soc/cipher_wrapper.sv:18:5
			wire slave_we;
			// Trace: ibex_soc/cipher_wrapper.sv:19:5
			wire [3:0] slave_be;
			// Trace: ibex_soc/cipher_wrapper.sv:20:5
			wire slave_rvalid;
			// Trace: ibex_soc/cipher_wrapper.sv:21:5
			wire [31:0] slave_wdata;
			// Trace: ibex_soc/cipher_wrapper.sv:22:5
			wire [31:0] slave_rdata;
			// Trace: ibex_soc/cipher_wrapper.sv:23:5
			wire slave_err;
			// Trace: ibex_soc/cipher_wrapper.sv:26:5
			wire master_req;
			// Trace: ibex_soc/cipher_wrapper.sv:27:5
			wire master_gnt;
			// Trace: ibex_soc/cipher_wrapper.sv:28:5
			wire [31:0] master_addr;
			// Trace: ibex_soc/cipher_wrapper.sv:29:5
			wire master_we;
			// Trace: ibex_soc/cipher_wrapper.sv:30:5
			wire [3:0] master_be;
			// Trace: ibex_soc/cipher_wrapper.sv:31:5
			wire master_rvalid;
			// Trace: ibex_soc/cipher_wrapper.sv:32:5
			wire [31:0] master_wdata;
			// Trace: ibex_soc/cipher_wrapper.sv:33:5
			wire [31:0] master_rdata;
			// Trace: ibex_soc/cipher_wrapper.sv:34:5
			wire master_err;
			// Trace: ibex_soc/cipher_wrapper.sv:37:5
			assign slave_req = ibex_soc.slaves[_mbase_bus_slave].req;
			// Trace: ibex_soc/cipher_wrapper.sv:38:5
			wire [1:1] sv2v_tmp_CD2CC;
			assign sv2v_tmp_CD2CC = slave_gnt;
			always @(*) ibex_soc.slaves[_mbase_bus_slave].gnt = sv2v_tmp_CD2CC;
			// Trace: ibex_soc/cipher_wrapper.sv:39:5
			assign slave_addr = ibex_soc.slaves[_mbase_bus_slave].addr;
			// Trace: ibex_soc/cipher_wrapper.sv:40:5
			assign slave_we = ibex_soc.slaves[_mbase_bus_slave].we;
			// Trace: ibex_soc/cipher_wrapper.sv:41:5
			assign slave_be = ibex_soc.slaves[_mbase_bus_slave].be;
			// Trace: ibex_soc/cipher_wrapper.sv:42:5
			wire [1:1] sv2v_tmp_BB7AA;
			assign sv2v_tmp_BB7AA = slave_rvalid;
			always @(*) ibex_soc.slaves[_mbase_bus_slave].rvalid = sv2v_tmp_BB7AA;
			// Trace: ibex_soc/cipher_wrapper.sv:43:5
			assign slave_wdata = ibex_soc.slaves[_mbase_bus_slave].wdata;
			// Trace: ibex_soc/cipher_wrapper.sv:44:5
			wire [32:1] sv2v_tmp_C13E4;
			assign sv2v_tmp_C13E4 = slave_rdata;
			always @(*) ibex_soc.slaves[_mbase_bus_slave].rdata = sv2v_tmp_C13E4;
			// Trace: ibex_soc/cipher_wrapper.sv:45:5
			wire [1:1] sv2v_tmp_4D0AC;
			assign sv2v_tmp_4D0AC = slave_err;
			always @(*) ibex_soc.slaves[_mbase_bus_slave].err = sv2v_tmp_4D0AC;
			// Trace: ibex_soc/cipher_wrapper.sv:47:5
			assign ibex_soc.cipher_if.req = master_req;
			// Trace: ibex_soc/cipher_wrapper.sv:48:5
			assign master_gnt = ibex_soc.cipher_if.gnt;
			// Trace: ibex_soc/cipher_wrapper.sv:49:5
			assign ibex_soc.cipher_if.addr = master_addr;
			// Trace: ibex_soc/cipher_wrapper.sv:50:5
			assign ibex_soc.cipher_if.we = master_we;
			// Trace: ibex_soc/cipher_wrapper.sv:51:5
			assign ibex_soc.cipher_if.be = master_be;
			// Trace: ibex_soc/cipher_wrapper.sv:52:5
			assign master_rvalid = ibex_soc.cipher_if.rvalid;
			// Trace: ibex_soc/cipher_wrapper.sv:53:5
			assign ibex_soc.cipher_if.wdata = master_wdata;
			// Trace: ibex_soc/cipher_wrapper.sv:54:5
			assign master_rdata = ibex_soc.cipher_if.rdata;
			// Trace: ibex_soc/cipher_wrapper.sv:55:5
			assign master_err = ibex_soc.cipher_if.err;
		end
	endgenerate
	assign cipher_wrapper_inst.clk_i = clk;
	assign cipher_wrapper_inst.rst_ni = rst_n;
	assign slave_req = cipher_wrapper_inst.slave_req;
	assign cipher_wrapper_inst.slave_gnt = slave_gnt;
	assign slave_addr = cipher_wrapper_inst.slave_addr;
	assign slave_we = cipher_wrapper_inst.slave_we;
	assign slave_be = cipher_wrapper_inst.slave_be;
	assign cipher_wrapper_inst.slave_rvalid = slave_rvalid;
	assign slave_wdata = cipher_wrapper_inst.slave_wdata;
	assign cipher_wrapper_inst.slave_rdata = slave_rdata;
	assign cipher_wrapper_inst.slave_err = slave_err;
	assign cipher_wrapper_inst.master_req = master_req;
	assign master_gnt = cipher_wrapper_inst.master_gnt;
	assign cipher_wrapper_inst.master_addr = master_addr;
	assign cipher_wrapper_inst.master_we = master_we;
	assign cipher_wrapper_inst.master_be = master_be;
	assign master_rvalid = cipher_wrapper_inst.master_rvalid;
	assign cipher_wrapper_inst.master_wdata = master_wdata;
	assign master_rdata = cipher_wrapper_inst.master_rdata;
	assign master_err = cipher_wrapper_inst.master_err;
endmodule
// Trace: ibex_soc/bus_arbiter2m1s.sv:1:1
`default_nettype none
// removed module with interface ports: bus_arbiter2m1s
// removed module with interface ports: bus_mux1mNs
// removed module with interface ports: ram_wrapper
// removed module with interface ports: rom_wrapper
// Trace: ibex_soc/uart_wrapper.sv:4:1
`default_nettype none
// removed module with interface ports: uart_wrapper
// Trace: ibex_soc/blinky_wrapper.sv:4:1
`default_nettype none
// removed module with interface ports: blinky_wrapper
// removed module with interface ports: cipher_wrapper
// removed module with interface ports: parallel_out
// removed module with interface ports: eoc_controller