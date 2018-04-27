


`timescale 1ns / 1ps
`default_nettype none


module top
		(
			input	wire			in_clk125,
			
			input	wire	[3:0]	push_sw,
			input	wire	[3:0]	dip_sw,
			output	wire	[3:0]	led,
			output	wire	[7:0]	pmod_a,
			
			input	wire			cam_clk_hs_p,
			input	wire			cam_clk_hs_n,
			input	wire			cam_clk_lp_p,
			input	wire			cam_clk_lp_n,
			input	wire	[1:0]	cam_data_hs_p,
			input	wire	[1:0]	cam_data_hs_n,
			input	wire	[1:0]	cam_data_lp_p,
			input	wire	[1:0]	cam_data_lp_n,
			input	wire			cam_clk,
			output	wire			cam_gpio,
			inout	wire			cam_scl,
			inout	wire			cam_sda,
			
			inout	wire	[14:0]	DDR_addr,
			inout	wire	[2:0]	DDR_ba,
			inout	wire			DDR_cas_n,
			inout	wire			DDR_ck_n,
			inout	wire			DDR_ck_p,
			inout	wire			DDR_cke,
			inout	wire			DDR_cs_n,
			inout	wire	[3:0]	DDR_dm,
			inout	wire	[31:0]	DDR_dq,
			inout	wire	[3:0]	DDR_dqs_n,
			inout	wire	[3:0]	DDR_dqs_p,
			inout	wire			DDR_odt,
			inout	wire			DDR_ras_n,
			inout	wire			DDR_reset_n,
			inout	wire			DDR_we_n,
			inout	wire			FIXED_IO_ddr_vrn,
			inout	wire			FIXED_IO_ddr_vrp,
			inout	wire	[53:0]	FIXED_IO_mio,
			inout	wire			FIXED_IO_ps_clk,
			inout	wire			FIXED_IO_ps_porb,
			inout	wire			FIXED_IO_ps_srstb
		);
	
	
						wire			sys_reset;
	(* KEEP = "true" *)	wire			sys_clk100;
	(* KEEP = "true" *)	wire			sys_clk200;
	
	wire			axi4l_peri_aresetn;
	wire			axi4l_peri_aclk;
	wire	[31:0]	axi4l_peri_awaddr;
	wire	[2:0]	axi4l_peri_awprot;
	wire			axi4l_peri_awvalid;
	wire			axi4l_peri_awready;
	wire	[3:0]	axi4l_peri_wstrb;
	wire	[31:0]	axi4l_peri_wdata;
	wire			axi4l_peri_wvalid;
	wire			axi4l_peri_wready;
	wire	[1:0]	axi4l_peri_bresp;
	wire			axi4l_peri_bvalid;
	wire			axi4l_peri_bready;
	wire	[31:0]	axi4l_peri_araddr;
	wire	[2:0]	axi4l_peri_arprot;
	wire			axi4l_peri_arvalid;
	wire			axi4l_peri_arready;
	wire	[31:0]	axi4l_peri_rdata;
	wire	[1:0]	axi4l_peri_rresp;
	wire			axi4l_peri_rvalid;
	wire			axi4l_peri_rready;
	
	
	wire			axi4_mem_aresetn;
	wire			axi4_mem_aclk;
	
	wire	[5:0]	axi4_mem0_awid;
	wire	[31:0]	axi4_mem0_awaddr;
	wire	[1:0]	axi4_mem0_awburst;
	wire	[3:0]	axi4_mem0_awcache;
	wire	[7:0]	axi4_mem0_awlen;
	wire	[0:0]	axi4_mem0_awlock;
	wire	[2:0]	axi4_mem0_awprot;
	wire	[3:0]	axi4_mem0_awqos;
	wire	[3:0]	axi4_mem0_awregion;
	wire	[2:0]	axi4_mem0_awsize;
	wire			axi4_mem0_awvalid;
	wire			axi4_mem0_awready;
	wire	[7:0]	axi4_mem0_wstrb;
	wire	[63:0]	axi4_mem0_wdata;
	wire			axi4_mem0_wlast;
	wire			axi4_mem0_wvalid;
	wire			axi4_mem0_wready;
	wire	[5:0]	axi4_mem0_bid;
	wire	[1:0]	axi4_mem0_bresp;
	wire			axi4_mem0_bvalid;
	wire			axi4_mem0_bready;
	wire	[5:0]	axi4_mem0_arid;
	wire	[31:0]	axi4_mem0_araddr;
	wire	[1:0]	axi4_mem0_arburst;
	wire	[3:0]	axi4_mem0_arcache;
	wire	[7:0]	axi4_mem0_arlen;
	wire	[0:0]	axi4_mem0_arlock;
	wire	[2:0]	axi4_mem0_arprot;
	wire	[3:0]	axi4_mem0_arqos;
	wire	[3:0]	axi4_mem0_arregion;
	wire	[2:0]	axi4_mem0_arsize;
	wire			axi4_mem0_arvalid;
	wire			axi4_mem0_arready;
	wire	[5:0]	axi4_mem0_rid;
	wire	[1:0]	axi4_mem0_rresp;
	wire	[63:0]	axi4_mem0_rdata;
	wire			axi4_mem0_rlast;
	wire			axi4_mem0_rvalid;
	wire			axi4_mem0_rready;
	
	wire			IIC_0_0_scl_i;
	wire			IIC_0_0_scl_o;
	wire			IIC_0_0_scl_t;
	wire			IIC_0_0_sda_i;
	wire			IIC_0_0_sda_o;
	wire			IIC_0_0_sda_t;
	
	design_1
		i_design_1
			(
				.sys_reset				(1'b0),
				.sys_clock				(in_clk125),
				
				.out_reset				(sys_reset),
				.out_clk100				(sys_clk100),
				.out_clk200				(sys_clk200),
				
				.m_axi4l_peri_aresetn	(axi4l_peri_aresetn),
				.m_axi4l_peri_aclk		(axi4l_peri_aclk),
				.m_axi4l_peri_awaddr	(axi4l_peri_awaddr),
				.m_axi4l_peri_awprot	(axi4l_peri_awprot),
				.m_axi4l_peri_awvalid	(axi4l_peri_awvalid),
				.m_axi4l_peri_awready	(axi4l_peri_awready),
				.m_axi4l_peri_wstrb		(axi4l_peri_wstrb),
				.m_axi4l_peri_wdata		(axi4l_peri_wdata),
				.m_axi4l_peri_wvalid	(axi4l_peri_wvalid),
				.m_axi4l_peri_wready	(axi4l_peri_wready),
				.m_axi4l_peri_bresp		(axi4l_peri_bresp),
				.m_axi4l_peri_bvalid	(axi4l_peri_bvalid),
				.m_axi4l_peri_bready	(axi4l_peri_bready),
				.m_axi4l_peri_araddr	(axi4l_peri_araddr),
				.m_axi4l_peri_arprot	(axi4l_peri_arprot),
				.m_axi4l_peri_arvalid	(axi4l_peri_arvalid),
				.m_axi4l_peri_arready	(axi4l_peri_arready),
				.m_axi4l_peri_rdata		(axi4l_peri_rdata),
				.m_axi4l_peri_rresp		(axi4l_peri_rresp),
				.m_axi4l_peri_rvalid	(axi4l_peri_rvalid),
				.m_axi4l_peri_rready	(axi4l_peri_rready),
				
				
				.s_axi4_mem_aresetn		(axi4_mem_aresetn),
				.s_axi4_mem_aclk		(axi4_mem_aclk),
				
				.s_axi4_mem0_awid		(axi4_mem0_awid),
				.s_axi4_mem0_awaddr		(axi4_mem0_awaddr),
				.s_axi4_mem0_awburst	(axi4_mem0_awburst),
				.s_axi4_mem0_awcache	(axi4_mem0_awcache),
				.s_axi4_mem0_awlen		(axi4_mem0_awlen),
				.s_axi4_mem0_awlock		(axi4_mem0_awlock),
				.s_axi4_mem0_awprot		(axi4_mem0_awprot),
				.s_axi4_mem0_awqos		(axi4_mem0_awqos),
	//			.s_axi4_mem0_awregion	(axi4_mem0_awregion),
				.s_axi4_mem0_awsize		(axi4_mem0_awsize),
				.s_axi4_mem0_awvalid	(axi4_mem0_awvalid),
				.s_axi4_mem0_awready	(axi4_mem0_awready),
				.s_axi4_mem0_wstrb		(axi4_mem0_wstrb),
				.s_axi4_mem0_wdata		(axi4_mem0_wdata),
				.s_axi4_mem0_wlast		(axi4_mem0_wlast),
				.s_axi4_mem0_wvalid		(axi4_mem0_wvalid),
				.s_axi4_mem0_wready		(axi4_mem0_wready),
				.s_axi4_mem0_bid		(axi4_mem0_bid),
				.s_axi4_mem0_bresp		(axi4_mem0_bresp),
				.s_axi4_mem0_bvalid		(axi4_mem0_bvalid),
				.s_axi4_mem0_bready		(axi4_mem0_bready),
				.s_axi4_mem0_araddr		(axi4_mem0_araddr),
				.s_axi4_mem0_arburst	(axi4_mem0_arburst),
				.s_axi4_mem0_arcache	(axi4_mem0_arcache),
				.s_axi4_mem0_arid		(axi4_mem0_arid),
				.s_axi4_mem0_arlen		(axi4_mem0_arlen),
				.s_axi4_mem0_arlock		(axi4_mem0_arlock),
				.s_axi4_mem0_arprot		(axi4_mem0_arprot),
				.s_axi4_mem0_arqos		(axi4_mem0_arqos),
	//			.s_axi4_mem0_arregion	(axi4_mem0_arregion),
				.s_axi4_mem0_arsize		(axi4_mem0_arsize),
				.s_axi4_mem0_arvalid	(axi4_mem0_arvalid),
				.s_axi4_mem0_arready	(axi4_mem0_arready),
				.s_axi4_mem0_rid		(axi4_mem0_rid),
				.s_axi4_mem0_rresp		(axi4_mem0_rresp),
				.s_axi4_mem0_rdata		(axi4_mem0_rdata),
				.s_axi4_mem0_rlast		(axi4_mem0_rlast),
				.s_axi4_mem0_rvalid		(axi4_mem0_rvalid),
				.s_axi4_mem0_rready		(axi4_mem0_rready),
				
				.DDR_addr				(DDR_addr),
				.DDR_ba					(DDR_ba),
				.DDR_cas_n				(DDR_cas_n),
				.DDR_ck_n				(DDR_ck_n),
				.DDR_ck_p				(DDR_ck_p),
				.DDR_cke				(DDR_cke),
				.DDR_cs_n				(DDR_cs_n),
				.DDR_dm					(DDR_dm),
				.DDR_dq					(DDR_dq),
				.DDR_dqs_n				(DDR_dqs_n),
				.DDR_dqs_p				(DDR_dqs_p),
				.DDR_odt				(DDR_odt),
				.DDR_ras_n				(DDR_ras_n),
				.DDR_reset_n			(DDR_reset_n),
				.DDR_we_n				(DDR_we_n),
				.FIXED_IO_ddr_vrn		(FIXED_IO_ddr_vrn),
				.FIXED_IO_ddr_vrp		(FIXED_IO_ddr_vrp),
				.FIXED_IO_mio			(FIXED_IO_mio),
				.FIXED_IO_ps_clk		(FIXED_IO_ps_clk),
				.FIXED_IO_ps_porb		(FIXED_IO_ps_porb),
				.FIXED_IO_ps_srstb		(FIXED_IO_ps_srstb),
				
				.IIC_0_0_scl_i			(IIC_0_0_scl_i),
				.IIC_0_0_scl_o			(IIC_0_0_scl_o),
				.IIC_0_0_scl_t			(IIC_0_0_scl_t),
				.IIC_0_0_sda_i			(IIC_0_0_sda_i),
				.IIC_0_0_sda_o			(IIC_0_0_sda_o),
				.IIC_0_0_sda_t			(IIC_0_0_sda_t)
			);
	
	assign cam_gpio = dip_sw[0];
	
	IOBUF
		i_IOBUF_cam_scl
			(
				.IO		(cam_scl),
				.I		(IIC_0_0_scl_o),
				.O		(IIC_0_0_scl_i),
				.T		(IIC_0_0_scl_t)
			);

	IOBUF
		i_iobuf_cam_sda
			(
				.IO		(cam_sda),
				.I		(IIC_0_0_sda_o),
				.O		(IIC_0_0_sda_i),
				.T		(IIC_0_0_sda_t)
			);
	
		
	// AXI4L => WISHBONE
	wire					wb_rst_o;
	wire					wb_clk_o;
	(* MARK_DEBUG = "true" *)	wire	[29:0]			wb_host_adr_o;
	(* MARK_DEBUG = "true" *)	wire	[31:0]			wb_host_dat_o;
	(* MARK_DEBUG = "true" *)	wire	[31:0]			wb_host_dat_i;
	(* MARK_DEBUG = "true" *)	wire					wb_host_we_o;
	(* MARK_DEBUG = "true" *)	wire	[3:0]			wb_host_sel_o;
	(* MARK_DEBUG = "true" *)	wire					wb_host_stb_o;
	(* MARK_DEBUG = "true" *)	wire					wb_host_ack_i;
	
	jelly_axi4l_to_wishbone
			#(
				.AXI4L_ADDR_WIDTH	(32),
				.AXI4L_DATA_SIZE	(2)		// 0:8bit, 1:16bit, 2:32bit ...
			)
		i_axi4l_to_wishbone
			(
				.s_axi4l_aresetn	(axi4l_peri_aresetn),
				.s_axi4l_aclk		(axi4l_peri_aclk),
				.s_axi4l_awaddr		(axi4l_peri_awaddr),
				.s_axi4l_awprot		(axi4l_peri_awprot),
				.s_axi4l_awvalid	(axi4l_peri_awvalid),
				.s_axi4l_awready	(axi4l_peri_awready),
				.s_axi4l_wstrb		(axi4l_peri_wstrb),
				.s_axi4l_wdata		(axi4l_peri_wdata),
				.s_axi4l_wvalid		(axi4l_peri_wvalid),
				.s_axi4l_wready		(axi4l_peri_wready),
				.s_axi4l_bresp		(axi4l_peri_bresp),
				.s_axi4l_bvalid		(axi4l_peri_bvalid),
				.s_axi4l_bready		(axi4l_peri_bready),
				.s_axi4l_araddr		(axi4l_peri_araddr),
				.s_axi4l_arprot		(axi4l_peri_arprot),
				.s_axi4l_arvalid	(axi4l_peri_arvalid),
				.s_axi4l_arready	(axi4l_peri_arready),
				.s_axi4l_rdata		(axi4l_peri_rdata),
				.s_axi4l_rresp		(axi4l_peri_rresp),
				.s_axi4l_rvalid		(axi4l_peri_rvalid),
				.s_axi4l_rready		(axi4l_peri_rready),
				
				.m_wb_rst_o			(wb_rst_o),
				.m_wb_clk_o			(wb_clk_o),
				.m_wb_adr_o			(wb_host_adr_o),
				.m_wb_dat_o			(wb_host_dat_o),
				.m_wb_dat_i			(wb_host_dat_i),
				.m_wb_we_o			(wb_host_we_o),
				.m_wb_sel_o			(wb_host_sel_o),
				.m_wb_stb_o			(wb_host_stb_o),
				.m_wb_ack_i			(wb_host_ack_i)
			);
	
	// ----------------------------------------
	//  Global ID
	// ----------------------------------------
	
	wire	[31:0]			wb_gid_dat_o;
	wire					wb_gid_stb_i;
	wire					wb_gid_ack_o;
	
	assign wb_gid_dat_o = 32'h01234567;
	assign wb_gid_ack_o = wb_gid_stb_i;
	
	
	
	// ----------------------------------------
	//  MIPI D-PHY RX
	// ----------------------------------------
	
	(* KEEP = "true" *)			wire				rxbyteclkhs;
	(* MARK_DEBUG = "true" *)	wire				system_rst_out;
	(* MARK_DEBUG = "true" *)	wire				init_done;
	
	(* MARK_DEBUG = "true" *)	wire				cl_rxclkactivehs;
	(* MARK_DEBUG = "true" *)	wire				cl_stopstate;
	(* MARK_DEBUG = "true" *)	wire				cl_enable         = 1;
	(* MARK_DEBUG = "true" *)	wire				cl_rxulpsclknot;
	(* MARK_DEBUG = "true" *)	wire				cl_ulpsactivenot;
	
	(* MARK_DEBUG = "true" *)	wire	[7:0]		dl0_rxdatahs;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxvalidhs;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxactivehs;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxsynchs;
	
	(* MARK_DEBUG = "true" *)	wire				dl0_forcerxmode   = 0;
	(* MARK_DEBUG = "true" *)	wire				dl0_stopstate;
	(* MARK_DEBUG = "true" *)	wire				dl0_enable        = 1;
	(* MARK_DEBUG = "true" *)	wire				dl0_ulpsactivenot;
	
	(* MARK_DEBUG = "true" *)	wire				dl0_rxclkesc;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxlpdtesc;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxulpsesc;
	(* MARK_DEBUG = "true" *)	wire	[3:0]		dl0_rxtriggeresc;
	(* MARK_DEBUG = "true" *)	wire	[7:0]		dl0_rxdataesc;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxvalidesc;
	
	(* MARK_DEBUG = "true" *)	wire				dl0_errsoths;
	(* MARK_DEBUG = "true" *)	wire				dl0_errsotsynchs;
	(* MARK_DEBUG = "true" *)	wire				dl0_erresc;
	(* MARK_DEBUG = "true" *)	wire				dl0_errsyncesc;
	(* MARK_DEBUG = "true" *)	wire				dl0_errcontrol;
	
	(* MARK_DEBUG = "true" *)	wire	[7:0]		dl1_rxdatahs;
	(* MARK_DEBUG = "true" *)	wire				dl1_rxvalidhs;
	(* MARK_DEBUG = "true" *)	wire				dl1_rxactivehs;
	(* MARK_DEBUG = "true" *)	wire				dl1_rxsynchs;
	
	(* MARK_DEBUG = "true" *)	wire				dl1_forcerxmode   = 0;
	(* MARK_DEBUG = "true" *)	wire				dl1_stopstate;
	(* MARK_DEBUG = "true" *)	wire				dl1_enable        = 1;
	(* MARK_DEBUG = "true" *)	wire				dl1_ulpsactivenot;
	
	(* MARK_DEBUG = "true" *)	wire				dl1_rxclkesc;
	(* MARK_DEBUG = "true" *)	wire				dl1_rxlpdtesc;
	(* MARK_DEBUG = "true" *)	wire				dl1_rxulpsesc;
	(* MARK_DEBUG = "true" *)	wire	[3:0]		dl1_rxtriggeresc;
	(* MARK_DEBUG = "true" *)	wire	[7:0]		dl1_rxdataesc;
	(* MARK_DEBUG = "true" *)	wire				dl1_rxvalidesc;
	
	(* MARK_DEBUG = "true" *)	wire				dl1_errsoths;
	(* MARK_DEBUG = "true" *)	wire				dl1_errsotsynchs;
	(* MARK_DEBUG = "true" *)	wire				dl1_erresc;
	(* MARK_DEBUG = "true" *)	wire				dl1_errsyncesc;
	(* MARK_DEBUG = "true" *)	wire				dl1_errcontrol;
	
	
	(* MARK_DEBUG = "true" *)	reg		[31:0]		dbg_dl0_count;
	(* MARK_DEBUG = "true" *)	reg		[31:0]		dbg_dl1_count;
	always @(posedge rxbyteclkhs) begin
		if (dl0_rxactivehs ) begin
			dbg_dl0_count <= dbg_dl0_count + 1;
		end
		if ( dl0_rxsynchs ) begin
			dbg_dl0_count <= 0;
		end
		
		if (dl1_rxactivehs ) begin
			dbg_dl1_count <= dbg_dl1_count + 1;
		end
		if ( dl1_rxsynchs ) begin
			dbg_dl1_count <= 0;
		end
	end
	
	
	/*
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl0_rxdatahs;
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl0_rxdataesc;
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl1_rxdatahs;
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl1_rxdataesc;
	
	always @(posedge clk100) begin
		dbg_dl0_rxdatahs  <= dl0_rxdatahs ;
		dbg_dl0_rxdataesc <= dl0_rxdataesc;
		dbg_dl1_rxdatahs  <= dl1_rxdatahs ;
		dbg_dl1_rxdataesc <= dl1_rxdataesc;
	end
	*/
	
	
	mipi_dphy_cam
		i_mipi_dphy_cam
			(
				.core_clk			(sys_clk200),
				.core_rst			(sys_reset),
				.rxbyteclkhs		(rxbyteclkhs),
				.system_rst_out		(system_rst_out),
				.init_done			(init_done),
				
				.cl_rxclkactivehs	(cl_rxclkactivehs),
				.cl_stopstate		(cl_stopstate),
				.cl_enable			(cl_enable),
				.cl_rxulpsclknot	(cl_rxulpsclknot),
				.cl_ulpsactivenot	(cl_ulpsactivenot),
				
				.dl0_rxdatahs		(dl0_rxdatahs),
				.dl0_rxvalidhs		(dl0_rxvalidhs),
				.dl0_rxactivehs		(dl0_rxactivehs),
				.dl0_rxsynchs		(dl0_rxsynchs),
				
				.dl0_forcerxmode	(dl0_forcerxmode),
				.dl0_stopstate		(dl0_stopstate),
				.dl0_enable			(dl0_enable),
				.dl0_ulpsactivenot	(dl0_ulpsactivenot),
				
				.dl0_rxclkesc		(dl0_rxclkesc),
				.dl0_rxlpdtesc		(dl0_rxlpdtesc),
				.dl0_rxulpsesc		(dl0_rxulpsesc),
				.dl0_rxtriggeresc	(dl0_rxtriggeresc),
				.dl0_rxdataesc		(dl0_rxdataesc),
				.dl0_rxvalidesc		(dl0_rxvalidesc),
				
				.dl0_errsoths		(dl0_errsoths),
				.dl0_errsotsynchs	(dl0_errsotsynchs),
				.dl0_erresc			(dl0_erresc),
				.dl0_errsyncesc		(dl0_errsyncesc),
				.dl0_errcontrol		(dl0_errcontrol),
				
				.dl1_rxdatahs		(dl1_rxdatahs),
				.dl1_rxvalidhs		(dl1_rxvalidhs),
				.dl1_rxactivehs		(dl1_rxactivehs),
				.dl1_rxsynchs		(dl1_rxsynchs),
				
				.dl1_forcerxmode	(dl1_forcerxmode),
				.dl1_stopstate		(dl1_stopstate),
				.dl1_enable			(dl1_enable),
				.dl1_ulpsactivenot	(dl1_ulpsactivenot),
				
				.dl1_rxclkesc		(dl1_rxclkesc),
				.dl1_rxlpdtesc		(dl1_rxlpdtesc),
				.dl1_rxulpsesc		(dl1_rxulpsesc),
				.dl1_rxtriggeresc	(dl1_rxtriggeresc),
				.dl1_rxdataesc		(dl1_rxdataesc),
				.dl1_rxvalidesc		(dl1_rxvalidesc),
				
				.dl1_errsoths		(dl1_errsoths),
				.dl1_errsotsynchs	(dl1_errsotsynchs),
				.dl1_erresc			(dl1_erresc),
				.dl1_errsyncesc		(dl1_errsyncesc),
				.dl1_errcontrol		(dl1_errcontrol),
				
				.clk_hs_rxp			(cam_clk_hs_p),
				.clk_hs_rxn			(cam_clk_hs_n),
				.clk_lp_rxp			(cam_clk_lp_p),
				.clk_lp_rxn			(cam_clk_lp_n),
				.data_hs_rxp		(cam_data_hs_p),
				.data_hs_rxn		(cam_data_hs_n),
				.data_lp_rxp		(cam_data_lp_p),
				.data_lp_rxn		(cam_data_lp_n)
		   );
	
	
								wire		dphy_clk   = rxbyteclkhs;
	(* MARK_DEBUG = "true" *)	wire		dphy_reset = system_rst_out;
	
	/*
	jelly_reset
			#(
				.IN_LOW_ACTIVE		(0),
				.OUT_LOW_ACTIVE		(0),
				.INPUT_REGS			(2),
				.COUNTER_WIDTH		(5),
				.INSERT_BUFG		(0)
			)
		i_reset
			(
				.clk				(dphy_clk),
				.in_reset			(sys_reset),	// (system_rst_out),
				.out_reset			(dphy_reset)
			);
	*/
	
	
	// FIFO
	(* MARK_DEBUG = "true" *)	wire	[7:0]		fifo_dl0_rxdatahs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl0_rxvalidhs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl0_rxactivehs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl0_rxsynchs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl0_errsoths;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl0_errsotsynchs;
	(* MARK_DEBUG = "true" *)	wire	[7:0]		fifo_dl1_rxdatahs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl1_rxvalidhs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl1_rxactivehs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl1_rxsynchs;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl1_errsoths;
	(* MARK_DEBUG = "true" *)	wire				fifo_dl1_errsotsynchs;
	(* MARK_DEBUG = "true" *)	wire				fifo_valid;
	
	jelly_fifo_async_fwtf
			#(
				.DATA_WIDTH			((5+8)*2),
				.PTR_WIDTH			(6),
				.DOUT_REGS			(0),
				.RAM_TYPE			("distributed"),
				.SLAVE_REGS			(0),
				.MASTER_REGS		(1)
			)
		i_fifo_async_fwtf
			(
				.s_reset			(dphy_reset),
				.s_clk				(dphy_clk),
				.s_data				({
										dl0_rxdatahs,
										dl0_rxvalidhs,
										dl0_rxactivehs,
										dl0_rxsynchs,
										dl0_errsoths,
										dl0_errsotsynchs,
										dl1_rxdatahs,
										dl1_rxvalidhs,
										dl1_rxactivehs,
										dl1_rxsynchs,
										dl1_errsoths,
										dl1_errsotsynchs
									}),
				.s_valid			(1'b1),
				.s_ready			(),
				.s_free_count		(),
				
				.m_reset			(sys_reset),
				.m_clk				(sys_clk200),
				.m_data				({
										fifo_dl0_rxdatahs,
										fifo_dl0_rxvalidhs,
										fifo_dl0_rxactivehs,
										fifo_dl0_rxsynchs,
										fifo_dl0_errsoths,
										fifo_dl0_errsotsynchs,
										fifo_dl1_rxdatahs,
										fifo_dl1_rxvalidhs,
										fifo_dl1_rxactivehs,
										fifo_dl1_rxsynchs,
										fifo_dl1_errsoths,
										fifo_dl1_errsotsynchs
									}),
				.m_valid			(fifo_valid),
				.m_ready			(1'b1),
				.m_data_count		()
			);
	
	
	
	// ----------------------------------------
	//  DMA write
	// ----------------------------------------
	
	wire	[0:0]			axi4s_memw_tuser;
	wire					axi4s_memw_tlast;
	wire	[31:0]			axi4s_memw_tdata;
	wire					axi4s_memw_tvalid;
	wire					axi4s_memw_tready;
	
	assign axi4s_memw_tuser       = fifo_dl0_rxvalidhs;
	assign axi4s_memw_tlast       = 1'b0;
	assign axi4s_memw_tdata[15:0] = {
										fifo_dl0_errsotsynchs,
										fifo_dl0_errsoths,
										fifo_dl0_rxsynchs,
										fifo_dl0_rxactivehs,
										fifo_dl0_rxvalidhs,
										fifo_dl0_rxdatahs
									};
	assign axi4s_memw_tdata[31:16] = {
										fifo_dl1_errsotsynchs,
										fifo_dl1_errsoths,
										fifo_dl1_rxsynchs,
										fifo_dl1_rxactivehs,
										fifo_dl1_rxvalidhs,
										fifo_dl1_rxdatahs
									};
	
	assign axi4s_memw_tvalid       = fifo_valid;
	
	
	
	wire	[31:0]			wb_vdmaw_dat_o;
	wire					wb_vdmaw_stb_i;
	wire					wb_vdmaw_ack_o;
	
	jelly_vdma_axi4s_to_axi4
			#(
				.ASYNC				(1),
				.FIFO_PTR_WIDTH		(10),
				
				.PIXEL_SIZE			(2),	// 32bit
				.AXI4_ID_WIDTH		(6),
				.AXI4_ADDR_WIDTH	(32),
				.AXI4_DATA_SIZE		(3),	// 64bit
				.AXI4_LEN_WIDTH		(4),	// AXI3,
				.AXI4_QOS_WIDTH		(4),
				.AXI4S_DATA_SIZE	(2),	// 32bit
				.AXI4S_USER_WIDTH	(1),
				.INDEX_WIDTH		(8),
				.STRIDE_WIDTH		(14),
				.H_WIDTH			(12),
				.V_WIDTH			(12),
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32),
				.INIT_CTL_CONTROL	(2'b11),
				.INIT_PARAM_ADDR	(32'h1800_0000),
				.INIT_PARAM_STRIDE	(4096),
				.INIT_PARAM_WIDTH	(1024),
				.INIT_PARAM_HEIGHT	(1024),
				.INIT_PARAM_SIZE	(16*1024*1024),
				.INIT_PARAM_AWLEN	(7)
			)
		i_vdma_axi4s_to_axi4
			(
				.m_axi4_aresetn		(axi4_mem_aresetn),
				.m_axi4_aclk		(axi4_mem_aclk),
				.m_axi4_awid		(axi4_mem0_awid),
				.m_axi4_awaddr		(axi4_mem0_awaddr),
				.m_axi4_awburst		(axi4_mem0_awburst),
				.m_axi4_awcache		(axi4_mem0_awcache),
				.m_axi4_awlen		(axi4_mem0_awlen),
				.m_axi4_awlock		(axi4_mem0_awlock),
				.m_axi4_awprot		(axi4_mem0_awprot),
				.m_axi4_awqos		(axi4_mem0_awqos),
				.m_axi4_awregion	(),
				.m_axi4_awsize		(axi4_mem0_awsize),
				.m_axi4_awvalid		(axi4_mem0_awvalid),
				.m_axi4_awready		(axi4_mem0_awready),
				.m_axi4_wstrb		(axi4_mem0_wstrb),
				.m_axi4_wdata		(axi4_mem0_wdata),
				.m_axi4_wlast		(axi4_mem0_wlast),
				.m_axi4_wvalid		(axi4_mem0_wvalid),
				.m_axi4_wready		(axi4_mem0_wready),
				.m_axi4_bid			(axi4_mem0_bid),
				.m_axi4_bresp		(axi4_mem0_bresp),
				.m_axi4_bvalid		(axi4_mem0_bvalid),
				.m_axi4_bready		(axi4_mem0_bready),
				
				.s_axi4s_aresetn	(~sys_reset),
				.s_axi4s_aclk		(sys_clk200),
				.s_axi4s_tuser		(axi4s_memw_tuser),
				.s_axi4s_tlast		(axi4s_memw_tlast),
				.s_axi4s_tdata		(axi4s_memw_tdata),
				.s_axi4s_tvalid		(axi4s_memw_tvalid),
				.s_axi4s_tready		(axi4s_memw_tready),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[7:0]),
				.s_wb_dat_o			(wb_vdmaw_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_vdmaw_stb_i),
				.s_wb_ack_o			(wb_vdmaw_ack_o)
			);
	
	
	
	// ----------------------------------------
	//  WISHBONE address decoder
	// ----------------------------------------
	
	assign wb_gid_stb_i   = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4000_0);
	assign wb_vdmaw_stb_i = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_0);
	
	assign wb_host_dat_i  = wb_gid_stb_i   ? wb_gid_dat_o   :
	                        wb_vdmaw_stb_i ? wb_vdmaw_dat_o :
	                        32'h0000_0000;
	
	assign wb_host_ack_i  = wb_gid_stb_i   ? wb_gid_ack_o   :
	                        wb_vdmaw_stb_i ? wb_vdmaw_ack_o :
	                        wb_host_stb_o;
	
	
	
	
	// ----------------------------------------
	//  Debug
	// ----------------------------------------
	
	reg		[31:0]		reg_counter_rxbyteclkhs;
	always @(posedge rxbyteclkhs)	reg_counter_rxbyteclkhs <= reg_counter_rxbyteclkhs + 1;
	
	reg		[31:0]		reg_counter_clk200;
	always @(posedge sys_clk200)	reg_counter_clk200 <= reg_counter_clk200 + 1;
	
	reg		[31:0]		reg_counter_clk100;
	always @(posedge sys_clk100)	reg_counter_clk100 <= reg_counter_clk100 + 1;
	
	assign led[0] = reg_counter_rxbyteclkhs[24];
	assign led[1] = reg_counter_clk200[24];
	assign led[2] = reg_counter_clk100[24];
	assign led[3] = cam_gpio;
	
	assign pmod_a[0]   = cam_clk;
	assign pmod_a[1]   = reg_counter_rxbyteclkhs[5];
	assign pmod_a[7:2] = 0;
	
	
	
endmodule


`default_nettype wire
