// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 27 18:01:53 2020
// Host        : J1STUDY running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               w:/wa/fpga-serial-mem-tester-1/SF-Tester-Design-AXI/IPI-BDs/system/ip/system_PWM_1_1/system_PWM_1_1_stub.v
// Design      : system_PWM_1_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "PWM_v2_0,Vivado 2020.2" *)
module system_PWM_1_1(pwm, pwm_axi_awaddr, pwm_axi_awprot, 
  pwm_axi_awvalid, pwm_axi_awready, pwm_axi_wdata, pwm_axi_wstrb, pwm_axi_wvalid, 
  pwm_axi_wready, pwm_axi_bresp, pwm_axi_bvalid, pwm_axi_bready, pwm_axi_araddr, 
  pwm_axi_arprot, pwm_axi_arvalid, pwm_axi_arready, pwm_axi_rdata, pwm_axi_rresp, 
  pwm_axi_rvalid, pwm_axi_rready, pwm_axi_aclk, pwm_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="pwm[3:0],pwm_axi_awaddr[6:0],pwm_axi_awprot[2:0],pwm_axi_awvalid,pwm_axi_awready,pwm_axi_wdata[31:0],pwm_axi_wstrb[3:0],pwm_axi_wvalid,pwm_axi_wready,pwm_axi_bresp[1:0],pwm_axi_bvalid,pwm_axi_bready,pwm_axi_araddr[6:0],pwm_axi_arprot[2:0],pwm_axi_arvalid,pwm_axi_arready,pwm_axi_rdata[31:0],pwm_axi_rresp[1:0],pwm_axi_rvalid,pwm_axi_rready,pwm_axi_aclk,pwm_axi_aresetn" */;
  output [3:0]pwm;
  input [6:0]pwm_axi_awaddr;
  input [2:0]pwm_axi_awprot;
  input pwm_axi_awvalid;
  output pwm_axi_awready;
  input [31:0]pwm_axi_wdata;
  input [3:0]pwm_axi_wstrb;
  input pwm_axi_wvalid;
  output pwm_axi_wready;
  output [1:0]pwm_axi_bresp;
  output pwm_axi_bvalid;
  input pwm_axi_bready;
  input [6:0]pwm_axi_araddr;
  input [2:0]pwm_axi_arprot;
  input pwm_axi_arvalid;
  output pwm_axi_arready;
  output [31:0]pwm_axi_rdata;
  output [1:0]pwm_axi_rresp;
  output pwm_axi_rvalid;
  input pwm_axi_rready;
  input pwm_axi_aclk;
  input pwm_axi_aresetn;
endmodule
