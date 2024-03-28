module I2C (PCLK,
    PENABLE,
    PREADY,
    PRESETn,
    PSEL,
    PWRITE,
    clk,
    ena,
    rst_n,
    PADDR,
    PRDATA,
    PWDATA,
    ui_in,
    uio_in,
    uio_oe,
    uio_out,
    uo_out);
 output PCLK;
 output PENABLE;
 input PREADY;
 output PRESETn;
 output PSEL;
 output PWRITE;
 input clk;
 input ena;
 input rst_n;
 output [4:0] PADDR;
 input [7:0] PRDATA;
 output [7:0] PWDATA;
 input [7:0] ui_in;
 input [7:0] uio_in;
 output [7:0] uio_oe;
 output [7:0] uio_out;
 output [7:0] uo_out;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _207_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire \adapter.adapter.address[0] ;
 wire \adapter.adapter.address[1] ;
 wire \adapter.adapter.address[2] ;
 wire \adapter.adapter.address[3] ;
 wire \adapter.adapter.address[4] ;
 wire \adapter.adapter.apb.bus_state[0] ;
 wire \adapter.adapter.apb.bus_write ;
 wire \adapter.adapter.apb.out_data[0] ;
 wire \adapter.adapter.apb.out_data[1] ;
 wire \adapter.adapter.apb.out_data[2] ;
 wire \adapter.adapter.apb.out_data[3] ;
 wire \adapter.adapter.apb.out_data[4] ;
 wire \adapter.adapter.apb.out_data[5] ;
 wire \adapter.adapter.apb.out_data[6] ;
 wire \adapter.adapter.apb.out_data[7] ;
 wire \adapter.adapter.apb.out_valid ;
 wire \adapter.adapter.got_first_byte ;
 wire \adapter.adapter.previous_busy ;
 wire \adapter.adapter.previous_got_first_byte ;
 wire \adapter.i2cs.bit_count_reg[0] ;
 wire \adapter.i2cs.bit_count_reg[1] ;
 wire \adapter.i2cs.bit_count_reg[2] ;
 wire \adapter.i2cs.bit_count_reg[3] ;
 wire \adapter.i2cs.busy_reg ;
 wire \adapter.i2cs.data_out_reg_valid_reg ;
 wire \adapter.i2cs.data_reg[0] ;
 wire \adapter.i2cs.data_reg[1] ;
 wire \adapter.i2cs.data_reg[2] ;
 wire \adapter.i2cs.data_reg[3] ;
 wire \adapter.i2cs.data_reg[4] ;
 wire \adapter.i2cs.data_reg[5] ;
 wire \adapter.i2cs.data_reg[6] ;
 wire \adapter.i2cs.data_reg[7] ;
 wire \adapter.i2cs.data_valid_reg ;
 wire \adapter.i2cs.last_scl_i_reg ;
 wire \adapter.i2cs.last_sda_i_reg ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[0] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[1] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[2] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[3] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[4] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[5] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[6] ;
 wire \adapter.i2cs.m_axis_data_tdata_reg[7] ;
 wire \adapter.i2cs.m_axis_data_tvalid_reg ;
 wire \adapter.i2cs.mode_read_reg ;
 wire \adapter.i2cs.s_axis_data_tready_reg ;
 wire \adapter.i2cs.scl_i_filter[0] ;
 wire \adapter.i2cs.scl_i_filter[1] ;
 wire \adapter.i2cs.scl_i_filter[2] ;
 wire \adapter.i2cs.scl_i_filter[3] ;
 wire \adapter.i2cs.scl_i_reg ;
 wire \adapter.i2cs.scl_o_reg ;
 wire \adapter.i2cs.sda_i_filter[0] ;
 wire \adapter.i2cs.sda_i_filter[1] ;
 wire \adapter.i2cs.sda_i_filter[2] ;
 wire \adapter.i2cs.sda_i_filter[3] ;
 wire \adapter.i2cs.sda_i_reg ;
 wire \adapter.i2cs.sda_o_reg ;
 wire \adapter.i2cs.state_reg[0] ;
 wire \adapter.i2cs.state_reg[1] ;
 wire \adapter.i2cs.state_reg[2] ;
 wire clknet_0_clk;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire clknet_3_0__leaf_clk;
 wire clknet_3_1__leaf_clk;
 wire clknet_3_2__leaf_clk;
 wire clknet_3_3__leaf_clk;
 wire clknet_3_4__leaf_clk;
 wire clknet_3_5__leaf_clk;
 wire clknet_3_6__leaf_clk;
 wire clknet_3_7__leaf_clk;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;

 sky130_fd_sc_hd__inv_2 _220_ (.A(\adapter.i2cs.sda_o_reg ),
    .Y(net32));
 sky130_fd_sc_hd__inv_2 _221_ (.A(\adapter.i2cs.scl_o_reg ),
    .Y(net31));
 sky130_fd_sc_hd__inv_2 _222_ (.A(\adapter.i2cs.sda_i_reg ),
    .Y(_066_));
 sky130_fd_sc_hd__inv_2 _223_ (.A(net106),
    .Y(_067_));
 sky130_fd_sc_hd__inv_2 _224_ (.A(net78),
    .Y(_068_));
 sky130_fd_sc_hd__inv_2 _225_ (.A(\adapter.i2cs.bit_count_reg[2] ),
    .Y(_069_));
 sky130_fd_sc_hd__inv_2 _226_ (.A(net38),
    .Y(_070_));
 sky130_fd_sc_hd__inv_2 _227_ (.A(net41),
    .Y(_071_));
 sky130_fd_sc_hd__inv_2 _228_ (.A(net46),
    .Y(_072_));
 sky130_fd_sc_hd__nor2_1 _229_ (.A(\adapter.adapter.apb.bus_state[0] ),
    .B(net19),
    .Y(_073_));
 sky130_fd_sc_hd__inv_2 _230_ (.A(_073_),
    .Y(net21));
 sky130_fd_sc_hd__and2_1 _231_ (.A(\adapter.adapter.apb.bus_write ),
    .B(net21),
    .X(net30));
 sky130_fd_sc_hd__o31a_1 _232_ (.A1(net124),
    .A2(net39),
    .A3(net42),
    .B1(net46),
    .X(_000_));
 sky130_fd_sc_hd__nor2_1 _233_ (.A(\adapter.i2cs.bit_count_reg[1] ),
    .B(\adapter.i2cs.bit_count_reg[0] ),
    .Y(_074_));
 sky130_fd_sc_hd__nor4_1 _234_ (.A(\adapter.i2cs.bit_count_reg[3] ),
    .B(\adapter.i2cs.bit_count_reg[2] ),
    .C(\adapter.i2cs.bit_count_reg[1] ),
    .D(\adapter.i2cs.bit_count_reg[0] ),
    .Y(_075_));
 sky130_fd_sc_hd__or4_1 _235_ (.A(\adapter.i2cs.bit_count_reg[3] ),
    .B(\adapter.i2cs.bit_count_reg[2] ),
    .C(\adapter.i2cs.bit_count_reg[1] ),
    .D(\adapter.i2cs.bit_count_reg[0] ),
    .X(_076_));
 sky130_fd_sc_hd__nand2_1 _236_ (.A(net40),
    .B(net38),
    .Y(_077_));
 sky130_fd_sc_hd__nand2b_2 _237_ (.A_N(\adapter.i2cs.last_scl_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .Y(_078_));
 sky130_fd_sc_hd__nor2_1 _238_ (.A(net40),
    .B(net38),
    .Y(_079_));
 sky130_fd_sc_hd__a211o_1 _239_ (.A1(_077_),
    .A2(_078_),
    .B1(_079_),
    .C1(net41),
    .X(_080_));
 sky130_fd_sc_hd__a2111o_1 _240_ (.A1(_077_),
    .A2(_078_),
    .B1(_079_),
    .C1(_075_),
    .D1(net41),
    .X(_081_));
 sky130_fd_sc_hd__and3_1 _241_ (.A(net40),
    .B(net38),
    .C(net41),
    .X(_082_));
 sky130_fd_sc_hd__nor3b_2 _242_ (.A(\adapter.i2cs.state_reg[2] ),
    .B(net39),
    .C_N(\adapter.i2cs.state_reg[1] ),
    .Y(_083_));
 sky130_fd_sc_hd__nor2_1 _243_ (.A(_082_),
    .B(_083_),
    .Y(_084_));
 sky130_fd_sc_hd__and2b_1 _244_ (.A_N(\adapter.i2cs.scl_i_reg ),
    .B(\adapter.i2cs.last_scl_i_reg ),
    .X(_085_));
 sky130_fd_sc_hd__nand2b_2 _245_ (.A_N(\adapter.i2cs.scl_i_reg ),
    .B(\adapter.i2cs.last_scl_i_reg ),
    .Y(_086_));
 sky130_fd_sc_hd__nand2_1 _246_ (.A(_083_),
    .B(_086_),
    .Y(_087_));
 sky130_fd_sc_hd__or3b_1 _247_ (.A(\adapter.i2cs.sda_i_reg ),
    .B(\adapter.i2cs.last_scl_i_reg ),
    .C_N(\adapter.i2cs.scl_i_reg ),
    .X(_088_));
 sky130_fd_sc_hd__a22o_1 _248_ (.A1(_083_),
    .A2(_086_),
    .B1(_088_),
    .B2(_082_),
    .X(_089_));
 sky130_fd_sc_hd__nor2_1 _249_ (.A(net41),
    .B(_077_),
    .Y(_090_));
 sky130_fd_sc_hd__nand3b_4 _250_ (.A_N(net42),
    .B(net38),
    .C(net40),
    .Y(_091_));
 sky130_fd_sc_hd__o21a_1 _251_ (.A1(net31),
    .A2(_085_),
    .B1(\adapter.i2cs.data_valid_reg ),
    .X(_092_));
 sky130_fd_sc_hd__nor2_2 _252_ (.A(_091_),
    .B(_092_),
    .Y(_093_));
 sky130_fd_sc_hd__and3b_1 _253_ (.A_N(\adapter.i2cs.last_sda_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .C(\adapter.i2cs.sda_i_reg ),
    .X(_094_));
 sky130_fd_sc_hd__a211o_1 _254_ (.A1(_081_),
    .A2(_084_),
    .B1(_089_),
    .C1(_094_),
    .X(_095_));
 sky130_fd_sc_hd__nor2_1 _255_ (.A(net35),
    .B(_095_),
    .Y(_096_));
 sky130_fd_sc_hd__o31a_1 _256_ (.A1(net41),
    .A2(net35),
    .A3(_095_),
    .B1(\adapter.i2cs.bit_count_reg[0] ),
    .X(_097_));
 sky130_fd_sc_hd__and3b_2 _257_ (.A_N(\adapter.i2cs.sda_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .C(\adapter.i2cs.last_sda_i_reg ),
    .X(_098_));
 sky130_fd_sc_hd__or3_1 _258_ (.A(\adapter.i2cs.bit_count_reg[0] ),
    .B(net35),
    .C(_095_),
    .X(_099_));
 sky130_fd_sc_hd__or3b_1 _259_ (.A(_097_),
    .B(_098_),
    .C_N(_099_),
    .X(_001_));
 sky130_fd_sc_hd__or3_1 _260_ (.A(net41),
    .B(_074_),
    .C(_079_),
    .X(_100_));
 sky130_fd_sc_hd__a221o_1 _261_ (.A1(net114),
    .A2(_099_),
    .B1(_100_),
    .B2(_096_),
    .C1(_098_),
    .X(_002_));
 sky130_fd_sc_hd__a211o_1 _262_ (.A1(_069_),
    .A2(_074_),
    .B1(_079_),
    .C1(net41),
    .X(_101_));
 sky130_fd_sc_hd__or4_1 _263_ (.A(\adapter.i2cs.bit_count_reg[1] ),
    .B(\adapter.i2cs.bit_count_reg[0] ),
    .C(_093_),
    .D(_095_),
    .X(_102_));
 sky130_fd_sc_hd__a221o_1 _264_ (.A1(_096_),
    .A2(_101_),
    .B1(_102_),
    .B2(net111),
    .C1(_098_),
    .X(_003_));
 sky130_fd_sc_hd__a211oi_1 _265_ (.A1(_096_),
    .A2(_101_),
    .B1(_098_),
    .C1(_068_),
    .Y(_004_));
 sky130_fd_sc_hd__nor2_2 _266_ (.A(_094_),
    .B(_098_),
    .Y(_103_));
 sky130_fd_sc_hd__or2_1 _267_ (.A(_094_),
    .B(_098_),
    .X(_104_));
 sky130_fd_sc_hd__nor2_1 _268_ (.A(_076_),
    .B(_078_),
    .Y(_105_));
 sky130_fd_sc_hd__or3b_1 _269_ (.A(net40),
    .B(net42),
    .C_N(net38),
    .X(_106_));
 sky130_fd_sc_hd__or3_1 _270_ (.A(_076_),
    .B(_078_),
    .C(_106_),
    .X(_107_));
 sky130_fd_sc_hd__or4bb_1 _271_ (.A(\adapter.i2cs.data_reg[0] ),
    .B(\adapter.i2cs.data_reg[2] ),
    .C_N(\adapter.i2cs.data_reg[3] ),
    .D_N(\adapter.i2cs.data_reg[1] ),
    .X(_108_));
 sky130_fd_sc_hd__or4b_1 _272_ (.A(\adapter.i2cs.data_reg[4] ),
    .B(\adapter.i2cs.data_reg[6] ),
    .C(_108_),
    .D_N(\adapter.i2cs.data_reg[5] ),
    .X(_109_));
 sky130_fd_sc_hd__nor2_1 _273_ (.A(_107_),
    .B(_109_),
    .Y(_110_));
 sky130_fd_sc_hd__and3b_1 _274_ (.A_N(\adapter.i2cs.state_reg[2] ),
    .B(net39),
    .C(net42),
    .X(_111_));
 sky130_fd_sc_hd__nand3b_1 _275_ (.A_N(\adapter.i2cs.state_reg[2] ),
    .B(net39),
    .C(net42),
    .Y(_112_));
 sky130_fd_sc_hd__o211a_1 _276_ (.A1(\adapter.adapter.apb.bus_state[0] ),
    .A2(net19),
    .B1(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C1(\adapter.adapter.got_first_byte ),
    .X(_113_));
 sky130_fd_sc_hd__o211ai_1 _277_ (.A1(\adapter.adapter.apb.bus_state[0] ),
    .A2(net19),
    .B1(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C1(\adapter.adapter.got_first_byte ),
    .Y(_114_));
 sky130_fd_sc_hd__a21o_1 _278_ (.A1(\adapter.i2cs.scl_o_reg ),
    .A2(_086_),
    .B1(_113_),
    .X(_115_));
 sky130_fd_sc_hd__nand2_1 _279_ (.A(\adapter.i2cs.mode_read_reg ),
    .B(_085_),
    .Y(_116_));
 sky130_fd_sc_hd__a22o_1 _280_ (.A1(_111_),
    .A2(_115_),
    .B1(_116_),
    .B2(_083_),
    .X(_117_));
 sky130_fd_sc_hd__and4_1 _281_ (.A(net40),
    .B(_070_),
    .C(_071_),
    .D(_105_),
    .X(_118_));
 sky130_fd_sc_hd__and3b_1 _282_ (.A_N(net38),
    .B(net42),
    .C(net40),
    .X(_119_));
 sky130_fd_sc_hd__a21o_1 _283_ (.A1(_078_),
    .A2(_082_),
    .B1(_119_),
    .X(_120_));
 sky130_fd_sc_hd__a311o_1 _284_ (.A1(net37),
    .A2(_090_),
    .A3(_092_),
    .B1(_110_),
    .C1(_120_),
    .X(_121_));
 sky130_fd_sc_hd__o311a_1 _285_ (.A1(_117_),
    .A2(_118_),
    .A3(_121_),
    .B1(_103_),
    .C1(net46),
    .X(_005_));
 sky130_fd_sc_hd__o2111a_1 _286_ (.A1(_076_),
    .A2(_078_),
    .B1(net40),
    .C1(_070_),
    .D1(_071_),
    .X(_122_));
 sky130_fd_sc_hd__and3_1 _287_ (.A(\adapter.i2cs.mode_read_reg ),
    .B(_083_),
    .C(_085_),
    .X(_123_));
 sky130_fd_sc_hd__a211o_1 _288_ (.A1(\adapter.i2cs.scl_o_reg ),
    .A2(_086_),
    .B1(_112_),
    .C1(_113_),
    .X(_124_));
 sky130_fd_sc_hd__inv_2 _289_ (.A(_124_),
    .Y(_125_));
 sky130_fd_sc_hd__o21a_1 _290_ (.A1(_066_),
    .A2(_078_),
    .B1(_082_),
    .X(_126_));
 sky130_fd_sc_hd__or4_1 _291_ (.A(_090_),
    .B(_119_),
    .C(_123_),
    .D(_126_),
    .X(_127_));
 sky130_fd_sc_hd__o311a_1 _292_ (.A1(_122_),
    .A2(_125_),
    .A3(_127_),
    .B1(_103_),
    .C1(net46),
    .X(_006_));
 sky130_fd_sc_hd__and3b_1 _293_ (.A_N(\adapter.adapter.got_first_byte ),
    .B(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C(\adapter.i2cs.busy_reg ),
    .X(_128_));
 sky130_fd_sc_hd__nand3b_2 _294_ (.A_N(\adapter.adapter.got_first_byte ),
    .B(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C(\adapter.i2cs.busy_reg ),
    .Y(_129_));
 sky130_fd_sc_hd__or2_1 _295_ (.A(net109),
    .B(_128_),
    .X(_130_));
 sky130_fd_sc_hd__o211a_1 _296_ (.A1(net97),
    .A2(_129_),
    .B1(_130_),
    .C1(net45),
    .X(_007_));
 sky130_fd_sc_hd__nand2_1 _297_ (.A(_067_),
    .B(_129_),
    .Y(_131_));
 sky130_fd_sc_hd__o211a_1 _298_ (.A1(net91),
    .A2(_129_),
    .B1(_131_),
    .C1(net45),
    .X(_008_));
 sky130_fd_sc_hd__or2_1 _299_ (.A(net107),
    .B(_128_),
    .X(_132_));
 sky130_fd_sc_hd__o211a_1 _300_ (.A1(\adapter.i2cs.m_axis_data_tdata_reg[2] ),
    .A2(_129_),
    .B1(_132_),
    .C1(net45),
    .X(_009_));
 sky130_fd_sc_hd__or2_1 _301_ (.A(net122),
    .B(_128_),
    .X(_133_));
 sky130_fd_sc_hd__o211a_1 _302_ (.A1(\adapter.i2cs.m_axis_data_tdata_reg[3] ),
    .A2(_129_),
    .B1(_133_),
    .C1(net45),
    .X(_010_));
 sky130_fd_sc_hd__or2_1 _303_ (.A(net117),
    .B(_128_),
    .X(_134_));
 sky130_fd_sc_hd__o211a_1 _304_ (.A1(\adapter.i2cs.m_axis_data_tdata_reg[4] ),
    .A2(_129_),
    .B1(_134_),
    .C1(net45),
    .X(_011_));
 sky130_fd_sc_hd__and2_1 _305_ (.A(net45),
    .B(\adapter.i2cs.busy_reg ),
    .X(_013_));
 sky130_fd_sc_hd__o21a_1 _306_ (.A1(\adapter.adapter.got_first_byte ),
    .A2(net110),
    .B1(_013_),
    .X(_012_));
 sky130_fd_sc_hd__nand2b_1 _307_ (.A_N(\adapter.adapter.previous_got_first_byte ),
    .B(\adapter.adapter.got_first_byte ),
    .Y(_135_));
 sky130_fd_sc_hd__nand2b_1 _308_ (.A_N(\adapter.adapter.previous_busy ),
    .B(\adapter.i2cs.busy_reg ),
    .Y(_136_));
 sky130_fd_sc_hd__a21oi_2 _309_ (.A1(_135_),
    .A2(_136_),
    .B1(net21),
    .Y(_137_));
 sky130_fd_sc_hd__and3b_2 _310_ (.A_N(\adapter.adapter.apb.bus_state[0] ),
    .B(net19),
    .C(net9),
    .X(_138_));
 sky130_fd_sc_hd__a21o_1 _311_ (.A1(net13),
    .A2(_138_),
    .B1(_137_),
    .X(_139_));
 sky130_fd_sc_hd__nor2_1 _312_ (.A(net13),
    .B(_138_),
    .Y(_140_));
 sky130_fd_sc_hd__o2bb2a_1 _313_ (.A1_N(\adapter.adapter.address[0] ),
    .A2_N(_137_),
    .B1(_139_),
    .B2(_140_),
    .X(_141_));
 sky130_fd_sc_hd__nor2_1 _314_ (.A(_072_),
    .B(_141_),
    .Y(_014_));
 sky130_fd_sc_hd__and3_1 _315_ (.A(net14),
    .B(net13),
    .C(_138_),
    .X(_142_));
 sky130_fd_sc_hd__a21oi_1 _316_ (.A1(_067_),
    .A2(_137_),
    .B1(_142_),
    .Y(_143_));
 sky130_fd_sc_hd__o211a_1 _317_ (.A1(net103),
    .A2(_139_),
    .B1(_143_),
    .C1(net45),
    .X(_015_));
 sky130_fd_sc_hd__and4_1 _318_ (.A(net15),
    .B(net14),
    .C(net13),
    .D(_138_),
    .X(_144_));
 sky130_fd_sc_hd__or2_1 _319_ (.A(_137_),
    .B(_144_),
    .X(_145_));
 sky130_fd_sc_hd__nor2_1 _320_ (.A(net15),
    .B(_142_),
    .Y(_146_));
 sky130_fd_sc_hd__o2bb2a_1 _321_ (.A1_N(\adapter.adapter.address[2] ),
    .A2_N(_137_),
    .B1(_145_),
    .B2(_146_),
    .X(_147_));
 sky130_fd_sc_hd__nor2_1 _322_ (.A(_072_),
    .B(_147_),
    .Y(_016_));
 sky130_fd_sc_hd__nand2b_1 _323_ (.A_N(\adapter.adapter.address[3] ),
    .B(_137_),
    .Y(_148_));
 sky130_fd_sc_hd__nand2_1 _324_ (.A(net16),
    .B(_144_),
    .Y(_149_));
 sky130_fd_sc_hd__o2111a_1 _325_ (.A1(net121),
    .A2(_145_),
    .B1(_148_),
    .C1(_149_),
    .D1(net45),
    .X(_017_));
 sky130_fd_sc_hd__and3b_1 _326_ (.A_N(_137_),
    .B(_149_),
    .C(net17),
    .X(_150_));
 sky130_fd_sc_hd__a2bb2o_1 _327_ (.A1_N(net17),
    .A2_N(_149_),
    .B1(_137_),
    .B2(\adapter.adapter.address[4] ),
    .X(_151_));
 sky130_fd_sc_hd__o21a_1 _328_ (.A1(_150_),
    .A2(_151_),
    .B1(net45),
    .X(_018_));
 sky130_fd_sc_hd__and3_2 _329_ (.A(\adapter.adapter.got_first_byte ),
    .B(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C(_073_),
    .X(_152_));
 sky130_fd_sc_hd__nand3_4 _330_ (.A(\adapter.adapter.got_first_byte ),
    .B(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C(_073_),
    .Y(_153_));
 sky130_fd_sc_hd__or2_1 _331_ (.A(net108),
    .B(_152_),
    .X(_154_));
 sky130_fd_sc_hd__o211a_1 _332_ (.A1(net97),
    .A2(_153_),
    .B1(_154_),
    .C1(net44),
    .X(_019_));
 sky130_fd_sc_hd__or2_1 _333_ (.A(net112),
    .B(_152_),
    .X(_155_));
 sky130_fd_sc_hd__o211a_1 _334_ (.A1(net91),
    .A2(_153_),
    .B1(_155_),
    .C1(net44),
    .X(_020_));
 sky130_fd_sc_hd__or2_1 _335_ (.A(net119),
    .B(_152_),
    .X(_156_));
 sky130_fd_sc_hd__o211a_1 _336_ (.A1(\adapter.i2cs.m_axis_data_tdata_reg[2] ),
    .A2(_153_),
    .B1(_156_),
    .C1(net44),
    .X(_021_));
 sky130_fd_sc_hd__or2_1 _337_ (.A(net125),
    .B(_152_),
    .X(_157_));
 sky130_fd_sc_hd__o211a_1 _338_ (.A1(\adapter.i2cs.m_axis_data_tdata_reg[3] ),
    .A2(_153_),
    .B1(_157_),
    .C1(net44),
    .X(_022_));
 sky130_fd_sc_hd__or2_1 _339_ (.A(net115),
    .B(_152_),
    .X(_158_));
 sky130_fd_sc_hd__o211a_1 _340_ (.A1(\adapter.i2cs.m_axis_data_tdata_reg[4] ),
    .A2(_153_),
    .B1(_158_),
    .C1(net44),
    .X(_023_));
 sky130_fd_sc_hd__or2_1 _341_ (.A(net88),
    .B(_152_),
    .X(_159_));
 sky130_fd_sc_hd__o211a_1 _342_ (.A1(net81),
    .A2(_153_),
    .B1(_159_),
    .C1(net43),
    .X(_024_));
 sky130_fd_sc_hd__or2_1 _343_ (.A(net90),
    .B(_152_),
    .X(_160_));
 sky130_fd_sc_hd__o211a_1 _344_ (.A1(net83),
    .A2(_153_),
    .B1(_160_),
    .C1(net43),
    .X(_025_));
 sky130_fd_sc_hd__or2_1 _345_ (.A(net87),
    .B(_152_),
    .X(_161_));
 sky130_fd_sc_hd__o211a_1 _346_ (.A1(net79),
    .A2(_153_),
    .B1(_161_),
    .C1(net43),
    .X(_026_));
 sky130_fd_sc_hd__and2b_2 _347_ (.A_N(\adapter.adapter.apb.bus_write ),
    .B(_138_),
    .X(_162_));
 sky130_fd_sc_hd__nand2b_4 _348_ (.A_N(\adapter.adapter.apb.bus_write ),
    .B(_138_),
    .Y(_163_));
 sky130_fd_sc_hd__nand2b_1 _349_ (.A_N(\adapter.i2cs.s_axis_data_tready_reg ),
    .B(net105),
    .Y(_164_));
 sky130_fd_sc_hd__a21oi_1 _350_ (.A1(_163_),
    .A2(_164_),
    .B1(_072_),
    .Y(_027_));
 sky130_fd_sc_hd__nand2_1 _351_ (.A(\adapter.adapter.apb.out_valid ),
    .B(\adapter.i2cs.s_axis_data_tready_reg ),
    .Y(_165_));
 sky130_fd_sc_hd__a21o_1 _352_ (.A1(\adapter.adapter.apb.out_data[0] ),
    .A2(net36),
    .B1(_162_),
    .X(_166_));
 sky130_fd_sc_hd__o211a_1 _353_ (.A1(net1),
    .A2(_163_),
    .B1(_166_),
    .C1(net43),
    .X(_028_));
 sky130_fd_sc_hd__a21o_1 _354_ (.A1(\adapter.adapter.apb.out_data[1] ),
    .A2(net36),
    .B1(_162_),
    .X(_167_));
 sky130_fd_sc_hd__o211a_1 _355_ (.A1(net2),
    .A2(_163_),
    .B1(_167_),
    .C1(net44),
    .X(_029_));
 sky130_fd_sc_hd__a21o_1 _356_ (.A1(net127),
    .A2(net36),
    .B1(_162_),
    .X(_168_));
 sky130_fd_sc_hd__o211a_1 _357_ (.A1(net3),
    .A2(_163_),
    .B1(_168_),
    .C1(net43),
    .X(_030_));
 sky130_fd_sc_hd__a21o_1 _358_ (.A1(net126),
    .A2(net36),
    .B1(_162_),
    .X(_169_));
 sky130_fd_sc_hd__o211a_1 _359_ (.A1(net4),
    .A2(_163_),
    .B1(_169_),
    .C1(net43),
    .X(_031_));
 sky130_fd_sc_hd__a21o_1 _360_ (.A1(\adapter.adapter.apb.out_data[4] ),
    .A2(net36),
    .B1(_162_),
    .X(_170_));
 sky130_fd_sc_hd__o211a_1 _361_ (.A1(net5),
    .A2(_163_),
    .B1(_170_),
    .C1(net43),
    .X(_032_));
 sky130_fd_sc_hd__a21o_1 _362_ (.A1(\adapter.adapter.apb.out_data[5] ),
    .A2(net36),
    .B1(_162_),
    .X(_171_));
 sky130_fd_sc_hd__o211a_1 _363_ (.A1(net6),
    .A2(_163_),
    .B1(_171_),
    .C1(net43),
    .X(_033_));
 sky130_fd_sc_hd__a21o_1 _364_ (.A1(net123),
    .A2(net36),
    .B1(_162_),
    .X(_172_));
 sky130_fd_sc_hd__o211a_1 _365_ (.A1(net7),
    .A2(_163_),
    .B1(_172_),
    .C1(net43),
    .X(_034_));
 sky130_fd_sc_hd__a21o_1 _366_ (.A1(\adapter.adapter.apb.out_data[7] ),
    .A2(net36),
    .B1(_162_),
    .X(_173_));
 sky130_fd_sc_hd__o211a_1 _367_ (.A1(net8),
    .A2(_163_),
    .B1(_173_),
    .C1(net43),
    .X(_035_));
 sky130_fd_sc_hd__and2_1 _368_ (.A(\adapter.adapter.got_first_byte ),
    .B(net45),
    .X(_036_));
 sky130_fd_sc_hd__or3b_1 _369_ (.A(net21),
    .B(\adapter.adapter.apb.out_valid ),
    .C_N(\adapter.i2cs.s_axis_data_tready_reg ),
    .X(_174_));
 sky130_fd_sc_hd__a21oi_1 _370_ (.A1(net104),
    .A2(_174_),
    .B1(_152_),
    .Y(_175_));
 sky130_fd_sc_hd__nor2_1 _371_ (.A(_072_),
    .B(_175_),
    .Y(_037_));
 sky130_fd_sc_hd__a21oi_1 _372_ (.A1(_153_),
    .A2(_174_),
    .B1(_072_),
    .Y(_038_));
 sky130_fd_sc_hd__o21ai_1 _373_ (.A1(\adapter.adapter.apb.bus_state[0] ),
    .A2(net9),
    .B1(net19),
    .Y(_176_));
 sky130_fd_sc_hd__and3_1 _374_ (.A(net46),
    .B(net21),
    .C(_176_),
    .X(_039_));
 sky130_fd_sc_hd__nor2_1 _375_ (.A(_105_),
    .B(_106_),
    .Y(_177_));
 sky130_fd_sc_hd__a21oi_1 _376_ (.A1(net37),
    .A2(_092_),
    .B1(_091_),
    .Y(_178_));
 sky130_fd_sc_hd__and3_1 _377_ (.A(_070_),
    .B(net42),
    .C(_085_),
    .X(_179_));
 sky130_fd_sc_hd__a211o_1 _378_ (.A1(_111_),
    .A2(_115_),
    .B1(_126_),
    .C1(_179_),
    .X(_180_));
 sky130_fd_sc_hd__or4_1 _379_ (.A(_098_),
    .B(_177_),
    .C(_178_),
    .D(_180_),
    .X(_181_));
 sky130_fd_sc_hd__and3b_1 _380_ (.A_N(_094_),
    .B(_181_),
    .C(net46),
    .X(_040_));
 sky130_fd_sc_hd__a31oi_1 _381_ (.A1(\adapter.i2cs.scl_o_reg ),
    .A2(_086_),
    .A3(_111_),
    .B1(_119_),
    .Y(_182_));
 sky130_fd_sc_hd__a311o_1 _382_ (.A1(\adapter.adapter.apb.out_valid ),
    .A2(\adapter.i2cs.s_axis_data_tready_reg ),
    .A3(net40),
    .B1(_070_),
    .C1(net42),
    .X(_183_));
 sky130_fd_sc_hd__nand3b_1 _383_ (.A_N(_089_),
    .B(_182_),
    .C(_183_),
    .Y(_184_));
 sky130_fd_sc_hd__nor3_1 _384_ (.A(_117_),
    .B(_122_),
    .C(_184_),
    .Y(_185_));
 sky130_fd_sc_hd__a21oi_1 _385_ (.A1(net38),
    .A2(net41),
    .B1(_079_),
    .Y(_186_));
 sky130_fd_sc_hd__or4_1 _386_ (.A(_117_),
    .B(_122_),
    .C(_184_),
    .D(_186_),
    .X(_187_));
 sky130_fd_sc_hd__o211a_1 _387_ (.A1(\adapter.i2cs.data_valid_reg ),
    .A2(_185_),
    .B1(_187_),
    .C1(_103_),
    .X(_041_));
 sky130_fd_sc_hd__o21a_1 _388_ (.A1(net39),
    .A2(net42),
    .B1(_124_),
    .X(_188_));
 sky130_fd_sc_hd__nor2_1 _389_ (.A(_122_),
    .B(_188_),
    .Y(_189_));
 sky130_fd_sc_hd__a211o_1 _390_ (.A1(\adapter.i2cs.data_valid_reg ),
    .A2(_111_),
    .B1(_122_),
    .C1(_188_),
    .X(_190_));
 sky130_fd_sc_hd__o211a_1 _391_ (.A1(net85),
    .A2(_189_),
    .B1(_190_),
    .C1(_103_),
    .X(_042_));
 sky130_fd_sc_hd__or3b_2 _392_ (.A(_080_),
    .B(_104_),
    .C_N(_107_),
    .X(_191_));
 sky130_fd_sc_hd__a21oi_1 _393_ (.A1(_090_),
    .A2(_165_),
    .B1(_191_),
    .Y(_192_));
 sky130_fd_sc_hd__or2_1 _394_ (.A(\adapter.adapter.apb.out_data[0] ),
    .B(net36),
    .X(_193_));
 sky130_fd_sc_hd__a221o_1 _395_ (.A1(\adapter.i2cs.sda_i_reg ),
    .A2(_091_),
    .B1(_093_),
    .B2(_193_),
    .C1(_191_),
    .X(_194_));
 sky130_fd_sc_hd__o21a_1 _396_ (.A1(net96),
    .A2(_192_),
    .B1(_194_),
    .X(_043_));
 sky130_fd_sc_hd__a21oi_4 _397_ (.A1(_093_),
    .A2(net36),
    .B1(_191_),
    .Y(_195_));
 sky130_fd_sc_hd__mux2_1 _398_ (.A0(\adapter.i2cs.data_reg[0] ),
    .A1(\adapter.adapter.apb.out_data[1] ),
    .S(net35),
    .X(_196_));
 sky130_fd_sc_hd__mux2_1 _399_ (.A0(net89),
    .A1(_196_),
    .S(_195_),
    .X(_044_));
 sky130_fd_sc_hd__mux2_1 _400_ (.A0(\adapter.i2cs.data_reg[1] ),
    .A1(\adapter.adapter.apb.out_data[2] ),
    .S(net35),
    .X(_197_));
 sky130_fd_sc_hd__mux2_1 _401_ (.A0(net92),
    .A1(_197_),
    .S(_195_),
    .X(_045_));
 sky130_fd_sc_hd__mux2_1 _402_ (.A0(\adapter.i2cs.data_reg[2] ),
    .A1(\adapter.adapter.apb.out_data[3] ),
    .S(net35),
    .X(_198_));
 sky130_fd_sc_hd__mux2_1 _403_ (.A0(net94),
    .A1(_198_),
    .S(_195_),
    .X(_046_));
 sky130_fd_sc_hd__mux2_1 _404_ (.A0(\adapter.i2cs.data_reg[3] ),
    .A1(\adapter.adapter.apb.out_data[4] ),
    .S(net35),
    .X(_199_));
 sky130_fd_sc_hd__mux2_1 _405_ (.A0(net101),
    .A1(_199_),
    .S(_195_),
    .X(_047_));
 sky130_fd_sc_hd__mux2_1 _406_ (.A0(\adapter.i2cs.data_reg[4] ),
    .A1(\adapter.adapter.apb.out_data[5] ),
    .S(net35),
    .X(_200_));
 sky130_fd_sc_hd__mux2_1 _407_ (.A0(net100),
    .A1(_200_),
    .S(_195_),
    .X(_048_));
 sky130_fd_sc_hd__mux2_1 _408_ (.A0(\adapter.i2cs.data_reg[5] ),
    .A1(\adapter.adapter.apb.out_data[6] ),
    .S(net35),
    .X(_201_));
 sky130_fd_sc_hd__mux2_1 _409_ (.A0(net99),
    .A1(_201_),
    .S(_195_),
    .X(_049_));
 sky130_fd_sc_hd__mux2_1 _410_ (.A0(\adapter.i2cs.data_reg[6] ),
    .A1(\adapter.adapter.apb.out_data[7] ),
    .S(net35),
    .X(_202_));
 sky130_fd_sc_hd__mux2_1 _411_ (.A0(net95),
    .A1(_202_),
    .S(_195_),
    .X(_050_));
 sky130_fd_sc_hd__nand2_1 _412_ (.A(_103_),
    .B(_110_),
    .Y(_203_));
 sky130_fd_sc_hd__mux2_1 _413_ (.A0(\adapter.i2cs.sda_i_reg ),
    .A1(net86),
    .S(_203_),
    .X(_051_));
 sky130_fd_sc_hd__or3b_1 _414_ (.A(\adapter.i2cs.data_valid_reg ),
    .B(_091_),
    .C_N(_165_),
    .X(_204_));
 sky130_fd_sc_hd__o31ai_1 _415_ (.A1(_071_),
    .A2(_077_),
    .A3(_088_),
    .B1(_204_),
    .Y(_205_));
 sky130_fd_sc_hd__o211a_1 _416_ (.A1(_123_),
    .A2(_205_),
    .B1(net46),
    .C1(_103_),
    .X(_052_));
 sky130_fd_sc_hd__a211o_1 _417_ (.A1(_091_),
    .A2(_112_),
    .B1(_098_),
    .C1(_094_),
    .X(_206_));
 sky130_fd_sc_hd__mux2_1 _418_ (.A0(\adapter.i2cs.data_valid_reg ),
    .A1(_114_),
    .S(_091_),
    .X(_207_));
 sky130_fd_sc_hd__mux2_1 _419_ (.A0(_207_),
    .A1(\adapter.i2cs.scl_o_reg ),
    .S(_206_),
    .X(_208_));
 sky130_fd_sc_hd__and4b_4 _420_ (.A_N(_098_),
    .B(_111_),
    .C(_208_),
    .D(_092_),
    .X(_209_));
 sky130_fd_sc_hd__mux2_1 _421_ (.A0(net97),
    .A1(net96),
    .S(_209_),
    .X(_053_));
 sky130_fd_sc_hd__mux2_1 _422_ (.A0(net91),
    .A1(net89),
    .S(_209_),
    .X(_054_));
 sky130_fd_sc_hd__mux2_1 _423_ (.A0(\adapter.i2cs.m_axis_data_tdata_reg[2] ),
    .A1(net92),
    .S(_209_),
    .X(_055_));
 sky130_fd_sc_hd__mux2_1 _424_ (.A0(net98),
    .A1(net94),
    .S(_209_),
    .X(_056_));
 sky130_fd_sc_hd__mux2_1 _425_ (.A0(\adapter.i2cs.m_axis_data_tdata_reg[4] ),
    .A1(net101),
    .S(_209_),
    .X(_057_));
 sky130_fd_sc_hd__mux2_1 _426_ (.A0(net81),
    .A1(\adapter.i2cs.data_reg[5] ),
    .S(_209_),
    .X(_058_));
 sky130_fd_sc_hd__mux2_1 _427_ (.A0(net83),
    .A1(\adapter.i2cs.data_reg[6] ),
    .S(_209_),
    .X(_059_));
 sky130_fd_sc_hd__mux2_1 _428_ (.A0(net79),
    .A1(\adapter.i2cs.data_reg[7] ),
    .S(_209_),
    .X(_060_));
 sky130_fd_sc_hd__a31o_1 _429_ (.A1(\adapter.i2cs.scl_i_filter[1] ),
    .A2(\adapter.i2cs.scl_i_filter[2] ),
    .A3(\adapter.i2cs.scl_i_filter[3] ),
    .B1(\adapter.i2cs.scl_i_reg ),
    .X(_210_));
 sky130_fd_sc_hd__or3_1 _430_ (.A(\adapter.i2cs.scl_i_filter[1] ),
    .B(\adapter.i2cs.scl_i_filter[2] ),
    .C(net76),
    .X(_211_));
 sky130_fd_sc_hd__a22o_1 _431_ (.A1(net68),
    .A2(_210_),
    .B1(_211_),
    .B2(net75),
    .X(_061_));
 sky130_fd_sc_hd__a31o_1 _432_ (.A1(\adapter.i2cs.sda_i_filter[1] ),
    .A2(\adapter.i2cs.sda_i_filter[2] ),
    .A3(\adapter.i2cs.sda_i_filter[3] ),
    .B1(\adapter.i2cs.sda_i_reg ),
    .X(_212_));
 sky130_fd_sc_hd__or3_1 _433_ (.A(\adapter.i2cs.sda_i_filter[1] ),
    .B(\adapter.i2cs.sda_i_filter[2] ),
    .C(net73),
    .X(_213_));
 sky130_fd_sc_hd__a22o_1 _434_ (.A1(net67),
    .A2(_212_),
    .B1(_213_),
    .B2(\adapter.i2cs.sda_i_reg ),
    .X(_062_));
 sky130_fd_sc_hd__a211o_1 _435_ (.A1(net113),
    .A2(_086_),
    .B1(_208_),
    .C1(_072_),
    .X(_063_));
 sky130_fd_sc_hd__o31ai_1 _436_ (.A1(net38),
    .A2(_071_),
    .A3(_104_),
    .B1(_206_),
    .Y(_214_));
 sky130_fd_sc_hd__o221a_1 _437_ (.A1(_091_),
    .A2(_092_),
    .B1(_182_),
    .B2(_085_),
    .C1(_087_),
    .X(_215_));
 sky130_fd_sc_hd__a31o_1 _438_ (.A1(net40),
    .A2(net38),
    .A3(\adapter.i2cs.data_reg[7] ),
    .B1(net41),
    .X(_216_));
 sky130_fd_sc_hd__a21oi_1 _439_ (.A1(_214_),
    .A2(_215_),
    .B1(net32),
    .Y(_217_));
 sky130_fd_sc_hd__a41o_1 _440_ (.A1(_084_),
    .A2(_214_),
    .A3(_215_),
    .A4(_216_),
    .B1(_072_),
    .X(_218_));
 sky130_fd_sc_hd__or2_1 _441_ (.A(_217_),
    .B(_218_),
    .X(_064_));
 sky130_fd_sc_hd__o21bai_1 _442_ (.A1(_104_),
    .A2(_118_),
    .B1_N(net85),
    .Y(_219_));
 sky130_fd_sc_hd__o311a_1 _443_ (.A1(_104_),
    .A2(_113_),
    .A3(_118_),
    .B1(_219_),
    .C1(net46),
    .X(_065_));
 sky130_fd_sc_hd__dfxtp_1 _444_ (.CLK(clknet_3_7__leaf_clk),
    .D(_000_),
    .Q(\adapter.i2cs.busy_reg ));
 sky130_fd_sc_hd__dfxtp_1 _445_ (.CLK(clknet_3_3__leaf_clk),
    .D(_001_),
    .Q(\adapter.i2cs.bit_count_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _446_ (.CLK(clknet_3_3__leaf_clk),
    .D(_002_),
    .Q(\adapter.i2cs.bit_count_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _447_ (.CLK(clknet_3_3__leaf_clk),
    .D(_003_),
    .Q(\adapter.i2cs.bit_count_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _448_ (.CLK(clknet_3_3__leaf_clk),
    .D(_004_),
    .Q(\adapter.i2cs.bit_count_reg[3] ));
 sky130_fd_sc_hd__dfxtp_1 _449_ (.CLK(clknet_3_4__leaf_clk),
    .D(_005_),
    .Q(\adapter.i2cs.state_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _450_ (.CLK(clknet_3_6__leaf_clk),
    .D(_006_),
    .Q(\adapter.i2cs.state_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _451_ (.CLK(clknet_3_5__leaf_clk),
    .D(_007_),
    .Q(\adapter.adapter.address[0] ));
 sky130_fd_sc_hd__dfxtp_1 _452_ (.CLK(clknet_3_7__leaf_clk),
    .D(_008_),
    .Q(\adapter.adapter.address[1] ));
 sky130_fd_sc_hd__dfxtp_1 _453_ (.CLK(clknet_3_4__leaf_clk),
    .D(_009_),
    .Q(\adapter.adapter.address[2] ));
 sky130_fd_sc_hd__dfxtp_1 _454_ (.CLK(clknet_3_7__leaf_clk),
    .D(_010_),
    .Q(\adapter.adapter.address[3] ));
 sky130_fd_sc_hd__dfxtp_1 _455_ (.CLK(clknet_3_5__leaf_clk),
    .D(net118),
    .Q(\adapter.adapter.address[4] ));
 sky130_fd_sc_hd__dfxtp_2 _456_ (.CLK(clknet_3_7__leaf_clk),
    .D(_012_),
    .Q(\adapter.adapter.got_first_byte ));
 sky130_fd_sc_hd__dfxtp_1 _457_ (.CLK(clknet_3_7__leaf_clk),
    .D(_013_),
    .Q(\adapter.adapter.previous_busy ));
 sky130_fd_sc_hd__dfxtp_1 _458_ (.CLK(clknet_3_5__leaf_clk),
    .D(_014_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_1 _459_ (.CLK(clknet_3_5__leaf_clk),
    .D(_015_),
    .Q(net14));
 sky130_fd_sc_hd__dfxtp_1 _460_ (.CLK(clknet_3_5__leaf_clk),
    .D(_016_),
    .Q(net15));
 sky130_fd_sc_hd__dfxtp_1 _461_ (.CLK(clknet_3_5__leaf_clk),
    .D(_017_),
    .Q(net16));
 sky130_fd_sc_hd__dfxtp_1 _462_ (.CLK(clknet_3_5__leaf_clk),
    .D(_018_),
    .Q(net17));
 sky130_fd_sc_hd__dfxtp_1 _463_ (.CLK(clknet_3_1__leaf_clk),
    .D(_019_),
    .Q(net22));
 sky130_fd_sc_hd__dfxtp_1 _464_ (.CLK(clknet_3_1__leaf_clk),
    .D(_020_),
    .Q(net23));
 sky130_fd_sc_hd__dfxtp_1 _465_ (.CLK(clknet_3_1__leaf_clk),
    .D(net120),
    .Q(net24));
 sky130_fd_sc_hd__dfxtp_1 _466_ (.CLK(clknet_3_1__leaf_clk),
    .D(_022_),
    .Q(net25));
 sky130_fd_sc_hd__dfxtp_1 _467_ (.CLK(clknet_3_1__leaf_clk),
    .D(net116),
    .Q(net26));
 sky130_fd_sc_hd__dfxtp_1 _468_ (.CLK(clknet_3_1__leaf_clk),
    .D(_024_),
    .Q(net27));
 sky130_fd_sc_hd__dfxtp_1 _469_ (.CLK(clknet_3_1__leaf_clk),
    .D(_025_),
    .Q(net28));
 sky130_fd_sc_hd__dfxtp_1 _470_ (.CLK(clknet_3_1__leaf_clk),
    .D(_026_),
    .Q(net29));
 sky130_fd_sc_hd__dfxtp_1 _471_ (.CLK(clknet_3_4__leaf_clk),
    .D(_027_),
    .Q(\adapter.adapter.apb.out_valid ));
 sky130_fd_sc_hd__dfxtp_1 _472_ (.CLK(clknet_3_0__leaf_clk),
    .D(_028_),
    .Q(\adapter.adapter.apb.out_data[0] ));
 sky130_fd_sc_hd__dfxtp_1 _473_ (.CLK(clknet_3_0__leaf_clk),
    .D(_029_),
    .Q(\adapter.adapter.apb.out_data[1] ));
 sky130_fd_sc_hd__dfxtp_1 _474_ (.CLK(clknet_3_0__leaf_clk),
    .D(_030_),
    .Q(\adapter.adapter.apb.out_data[2] ));
 sky130_fd_sc_hd__dfxtp_1 _475_ (.CLK(clknet_3_0__leaf_clk),
    .D(_031_),
    .Q(\adapter.adapter.apb.out_data[3] ));
 sky130_fd_sc_hd__dfxtp_1 _476_ (.CLK(clknet_3_0__leaf_clk),
    .D(_032_),
    .Q(\adapter.adapter.apb.out_data[4] ));
 sky130_fd_sc_hd__dfxtp_1 _477_ (.CLK(clknet_3_0__leaf_clk),
    .D(_033_),
    .Q(\adapter.adapter.apb.out_data[5] ));
 sky130_fd_sc_hd__dfxtp_1 _478_ (.CLK(clknet_3_0__leaf_clk),
    .D(_034_),
    .Q(\adapter.adapter.apb.out_data[6] ));
 sky130_fd_sc_hd__dfxtp_1 _479_ (.CLK(clknet_3_0__leaf_clk),
    .D(_035_),
    .Q(\adapter.adapter.apb.out_data[7] ));
 sky130_fd_sc_hd__dfxtp_1 _480_ (.CLK(clknet_3_5__leaf_clk),
    .D(_036_),
    .Q(\adapter.adapter.previous_got_first_byte ));
 sky130_fd_sc_hd__dfxtp_1 _481_ (.CLK(clknet_3_4__leaf_clk),
    .D(_037_),
    .Q(\adapter.adapter.apb.bus_write ));
 sky130_fd_sc_hd__dfxtp_1 _482_ (.CLK(clknet_3_4__leaf_clk),
    .D(_038_),
    .Q(\adapter.adapter.apb.bus_state[0] ));
 sky130_fd_sc_hd__dfxtp_1 _483_ (.CLK(clknet_3_5__leaf_clk),
    .D(_039_),
    .Q(net19));
 sky130_fd_sc_hd__dfxtp_1 _484_ (.CLK(clknet_3_6__leaf_clk),
    .D(_040_),
    .Q(\adapter.i2cs.state_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _485_ (.CLK(clknet_3_4__leaf_clk),
    .D(_041_),
    .Q(\adapter.i2cs.data_valid_reg ));
 sky130_fd_sc_hd__dfxtp_1 _486_ (.CLK(clknet_3_6__leaf_clk),
    .D(_042_),
    .Q(\adapter.i2cs.data_out_reg_valid_reg ));
 sky130_fd_sc_hd__dfxtp_1 _487_ (.CLK(clknet_3_3__leaf_clk),
    .D(_043_),
    .Q(\adapter.i2cs.data_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _488_ (.CLK(clknet_3_2__leaf_clk),
    .D(_044_),
    .Q(\adapter.i2cs.data_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _489_ (.CLK(clknet_3_2__leaf_clk),
    .D(_045_),
    .Q(\adapter.i2cs.data_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _490_ (.CLK(clknet_3_2__leaf_clk),
    .D(_046_),
    .Q(\adapter.i2cs.data_reg[3] ));
 sky130_fd_sc_hd__dfxtp_1 _491_ (.CLK(clknet_3_2__leaf_clk),
    .D(_047_),
    .Q(\adapter.i2cs.data_reg[4] ));
 sky130_fd_sc_hd__dfxtp_1 _492_ (.CLK(clknet_3_2__leaf_clk),
    .D(_048_),
    .Q(\adapter.i2cs.data_reg[5] ));
 sky130_fd_sc_hd__dfxtp_1 _493_ (.CLK(clknet_3_2__leaf_clk),
    .D(_049_),
    .Q(\adapter.i2cs.data_reg[6] ));
 sky130_fd_sc_hd__dfxtp_1 _494_ (.CLK(clknet_3_2__leaf_clk),
    .D(_050_),
    .Q(\adapter.i2cs.data_reg[7] ));
 sky130_fd_sc_hd__dfxtp_1 _495_ (.CLK(clknet_3_6__leaf_clk),
    .D(_051_),
    .Q(\adapter.i2cs.mode_read_reg ));
 sky130_fd_sc_hd__dfxtp_1 _496_ (.CLK(clknet_3_4__leaf_clk),
    .D(_052_),
    .Q(\adapter.i2cs.s_axis_data_tready_reg ));
 sky130_fd_sc_hd__dfxtp_1 _497_ (.CLK(clknet_3_1__leaf_clk),
    .D(_053_),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _498_ (.CLK(clknet_3_2__leaf_clk),
    .D(_054_),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _499_ (.CLK(clknet_3_0__leaf_clk),
    .D(net93),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _500_ (.CLK(clknet_3_2__leaf_clk),
    .D(_056_),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[3] ));
 sky130_fd_sc_hd__dfxtp_1 _501_ (.CLK(clknet_3_0__leaf_clk),
    .D(net102),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[4] ));
 sky130_fd_sc_hd__dfxtp_1 _502_ (.CLK(clknet_3_0__leaf_clk),
    .D(net82),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[5] ));
 sky130_fd_sc_hd__dfxtp_1 _503_ (.CLK(clknet_3_0__leaf_clk),
    .D(net84),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[6] ));
 sky130_fd_sc_hd__dfxtp_1 _504_ (.CLK(clknet_3_3__leaf_clk),
    .D(net80),
    .Q(\adapter.i2cs.m_axis_data_tdata_reg[7] ));
 sky130_fd_sc_hd__dfxtp_1 _505_ (.CLK(clknet_3_6__leaf_clk),
    .D(net11),
    .Q(\adapter.i2cs.scl_i_filter[0] ));
 sky130_fd_sc_hd__dfxtp_1 _506_ (.CLK(clknet_3_7__leaf_clk),
    .D(net68),
    .Q(\adapter.i2cs.scl_i_filter[1] ));
 sky130_fd_sc_hd__dfxtp_1 _507_ (.CLK(clknet_3_7__leaf_clk),
    .D(net70),
    .Q(\adapter.i2cs.scl_i_filter[2] ));
 sky130_fd_sc_hd__dfxtp_1 _508_ (.CLK(clknet_3_7__leaf_clk),
    .D(net71),
    .Q(\adapter.i2cs.scl_i_filter[3] ));
 sky130_fd_sc_hd__dfxtp_1 _509_ (.CLK(clknet_3_6__leaf_clk),
    .D(net12),
    .Q(\adapter.i2cs.sda_i_filter[0] ));
 sky130_fd_sc_hd__dfxtp_1 _510_ (.CLK(clknet_3_7__leaf_clk),
    .D(net67),
    .Q(\adapter.i2cs.sda_i_filter[1] ));
 sky130_fd_sc_hd__dfxtp_1 _511_ (.CLK(clknet_3_7__leaf_clk),
    .D(net69),
    .Q(\adapter.i2cs.sda_i_filter[2] ));
 sky130_fd_sc_hd__dfxtp_1 _512_ (.CLK(clknet_3_7__leaf_clk),
    .D(net72),
    .Q(\adapter.i2cs.sda_i_filter[3] ));
 sky130_fd_sc_hd__dfxtp_2 _513_ (.CLK(clknet_3_7__leaf_clk),
    .D(_061_),
    .Q(\adapter.i2cs.scl_i_reg ));
 sky130_fd_sc_hd__dfxtp_2 _514_ (.CLK(clknet_3_7__leaf_clk),
    .D(net74),
    .Q(\adapter.i2cs.sda_i_reg ));
 sky130_fd_sc_hd__dfxtp_2 _515_ (.CLK(clknet_3_1__leaf_clk),
    .D(_063_),
    .Q(\adapter.i2cs.scl_o_reg ));
 sky130_fd_sc_hd__dfxtp_1 _516_ (.CLK(clknet_3_3__leaf_clk),
    .D(_064_),
    .Q(\adapter.i2cs.sda_o_reg ));
 sky130_fd_sc_hd__dfxtp_1 _517_ (.CLK(clknet_3_6__leaf_clk),
    .D(net75),
    .Q(\adapter.i2cs.last_scl_i_reg ));
 sky130_fd_sc_hd__dfxtp_1 _518_ (.CLK(clknet_3_6__leaf_clk),
    .D(net77),
    .Q(\adapter.i2cs.last_sda_i_reg ));
 sky130_fd_sc_hd__dfxtp_2 _519_ (.CLK(clknet_3_6__leaf_clk),
    .D(_065_),
    .Q(\adapter.i2cs.m_axis_data_tvalid_reg ));
 sky130_fd_sc_hd__buf_2 _520_ (.A(clknet_3_5__leaf_clk),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_1 _521_ (.A(net46),
    .X(net20));
 sky130_fd_sc_hd__buf_2 _522_ (.A(net47),
    .X(uio_oe[0]));
 sky130_fd_sc_hd__buf_2 _523_ (.A(net48),
    .X(uio_oe[1]));
 sky130_fd_sc_hd__buf_2 _524_ (.A(net49),
    .X(uio_oe[4]));
 sky130_fd_sc_hd__buf_2 _525_ (.A(net50),
    .X(uio_oe[5]));
 sky130_fd_sc_hd__buf_2 _526_ (.A(net51),
    .X(uio_oe[6]));
 sky130_fd_sc_hd__buf_2 _527_ (.A(net52),
    .X(uio_oe[7]));
 sky130_fd_sc_hd__buf_2 _528_ (.A(net53),
    .X(uio_out[0]));
 sky130_fd_sc_hd__buf_2 _529_ (.A(net54),
    .X(uio_out[1]));
 sky130_fd_sc_hd__clkbuf_1 _530_ (.A(\adapter.i2cs.scl_o_reg ),
    .X(net33));
 sky130_fd_sc_hd__clkbuf_1 _531_ (.A(\adapter.i2cs.sda_o_reg ),
    .X(net34));
 sky130_fd_sc_hd__buf_2 _532_ (.A(net55),
    .X(uio_out[4]));
 sky130_fd_sc_hd__buf_2 _533_ (.A(net56),
    .X(uio_out[5]));
 sky130_fd_sc_hd__buf_2 _534_ (.A(net57),
    .X(uio_out[6]));
 sky130_fd_sc_hd__buf_2 _535_ (.A(net58),
    .X(uio_out[7]));
 sky130_fd_sc_hd__buf_2 _536_ (.A(net59),
    .X(uo_out[0]));
 sky130_fd_sc_hd__buf_2 _537_ (.A(net60),
    .X(uo_out[1]));
 sky130_fd_sc_hd__buf_2 _538_ (.A(net61),
    .X(uo_out[2]));
 sky130_fd_sc_hd__buf_2 _539_ (.A(net62),
    .X(uo_out[3]));
 sky130_fd_sc_hd__buf_2 _540_ (.A(net63),
    .X(uo_out[4]));
 sky130_fd_sc_hd__buf_2 _541_ (.A(net64),
    .X(uo_out[5]));
 sky130_fd_sc_hd__buf_2 _542_ (.A(net65),
    .X(uo_out[6]));
 sky130_fd_sc_hd__buf_2 _543_ (.A(net66),
    .X(uo_out[7]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_99 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_100 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(PRDATA[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(PRDATA[1]),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(PRDATA[2]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(PRDATA[3]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(PRDATA[4]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(PRDATA[5]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(PRDATA[6]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_1 input8 (.A(PRDATA[7]),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(PREADY),
    .X(net9));
 sky130_fd_sc_hd__buf_1 input10 (.A(rst_n),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_1 input11 (.A(uio_in[2]),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_1 input12 (.A(uio_in[3]),
    .X(net12));
 sky130_fd_sc_hd__buf_2 output13 (.A(net13),
    .X(PADDR[0]));
 sky130_fd_sc_hd__buf_2 output14 (.A(net14),
    .X(PADDR[1]));
 sky130_fd_sc_hd__buf_2 output15 (.A(net15),
    .X(PADDR[2]));
 sky130_fd_sc_hd__buf_2 output16 (.A(net16),
    .X(PADDR[3]));
 sky130_fd_sc_hd__buf_2 output17 (.A(net17),
    .X(PADDR[4]));
 sky130_fd_sc_hd__clkbuf_1 output18 (.A(net18),
    .X(PCLK));
 sky130_fd_sc_hd__buf_2 output19 (.A(net19),
    .X(PENABLE));
 sky130_fd_sc_hd__buf_2 output20 (.A(net20),
    .X(PRESETn));
 sky130_fd_sc_hd__buf_2 output21 (.A(net21),
    .X(PSEL));
 sky130_fd_sc_hd__buf_2 output22 (.A(net22),
    .X(PWDATA[0]));
 sky130_fd_sc_hd__buf_2 output23 (.A(net23),
    .X(PWDATA[1]));
 sky130_fd_sc_hd__buf_2 output24 (.A(net24),
    .X(PWDATA[2]));
 sky130_fd_sc_hd__buf_2 output25 (.A(net25),
    .X(PWDATA[3]));
 sky130_fd_sc_hd__buf_2 output26 (.A(net26),
    .X(PWDATA[4]));
 sky130_fd_sc_hd__buf_2 output27 (.A(net27),
    .X(PWDATA[5]));
 sky130_fd_sc_hd__buf_2 output28 (.A(net28),
    .X(PWDATA[6]));
 sky130_fd_sc_hd__buf_2 output29 (.A(net29),
    .X(PWDATA[7]));
 sky130_fd_sc_hd__buf_2 output30 (.A(net30),
    .X(PWRITE));
 sky130_fd_sc_hd__buf_2 output31 (.A(net31),
    .X(uio_oe[2]));
 sky130_fd_sc_hd__buf_2 output32 (.A(net32),
    .X(uio_oe[3]));
 sky130_fd_sc_hd__buf_2 output33 (.A(net33),
    .X(uio_out[2]));
 sky130_fd_sc_hd__buf_2 output34 (.A(net34),
    .X(uio_out[3]));
 sky130_fd_sc_hd__buf_2 fanout35 (.A(_093_),
    .X(net35));
 sky130_fd_sc_hd__clkbuf_4 fanout36 (.A(_165_),
    .X(net36));
 sky130_fd_sc_hd__clkbuf_1 max_cap37 (.A(_075_),
    .X(net37));
 sky130_fd_sc_hd__buf_2 fanout38 (.A(\adapter.i2cs.state_reg[0] ),
    .X(net38));
 sky130_fd_sc_hd__dlymetal6s2s_1 fanout39 (.A(\adapter.i2cs.state_reg[0] ),
    .X(net39));
 sky130_fd_sc_hd__buf_2 fanout40 (.A(\adapter.i2cs.state_reg[2] ),
    .X(net40));
 sky130_fd_sc_hd__buf_2 fanout41 (.A(net42),
    .X(net41));
 sky130_fd_sc_hd__buf_2 fanout42 (.A(\adapter.i2cs.state_reg[1] ),
    .X(net42));
 sky130_fd_sc_hd__buf_2 fanout43 (.A(net44),
    .X(net43));
 sky130_fd_sc_hd__clkbuf_2 fanout44 (.A(net10),
    .X(net44));
 sky130_fd_sc_hd__buf_2 fanout45 (.A(net46),
    .X(net45));
 sky130_fd_sc_hd__buf_2 fanout46 (.A(net10),
    .X(net46));
 sky130_fd_sc_hd__conb_1 _522__47 (.LO(net47));
 sky130_fd_sc_hd__conb_1 _523__48 (.LO(net48));
 sky130_fd_sc_hd__conb_1 _524__49 (.LO(net49));
 sky130_fd_sc_hd__conb_1 _525__50 (.LO(net50));
 sky130_fd_sc_hd__conb_1 _526__51 (.LO(net51));
 sky130_fd_sc_hd__conb_1 _527__52 (.LO(net52));
 sky130_fd_sc_hd__conb_1 _528__53 (.LO(net53));
 sky130_fd_sc_hd__conb_1 _529__54 (.LO(net54));
 sky130_fd_sc_hd__conb_1 _532__55 (.LO(net55));
 sky130_fd_sc_hd__conb_1 _533__56 (.LO(net56));
 sky130_fd_sc_hd__conb_1 _534__57 (.LO(net57));
 sky130_fd_sc_hd__conb_1 _535__58 (.LO(net58));
 sky130_fd_sc_hd__conb_1 _536__59 (.LO(net59));
 sky130_fd_sc_hd__conb_1 _537__60 (.LO(net60));
 sky130_fd_sc_hd__conb_1 _538__61 (.LO(net61));
 sky130_fd_sc_hd__conb_1 _539__62 (.LO(net62));
 sky130_fd_sc_hd__conb_1 _540__63 (.LO(net63));
 sky130_fd_sc_hd__conb_1 _541__64 (.LO(net64));
 sky130_fd_sc_hd__conb_1 _542__65 (.LO(net65));
 sky130_fd_sc_hd__conb_1 _543__66 (.LO(net66));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_0__f_clk (.A(clknet_0_clk),
    .X(clknet_3_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_1__f_clk (.A(clknet_0_clk),
    .X(clknet_3_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_2__f_clk (.A(clknet_0_clk),
    .X(clknet_3_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_3__f_clk (.A(clknet_0_clk),
    .X(clknet_3_3__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_4__f_clk (.A(clknet_0_clk),
    .X(clknet_3_4__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_5__f_clk (.A(clknet_0_clk),
    .X(clknet_3_5__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_6__f_clk (.A(clknet_0_clk),
    .X(clknet_3_6__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_7__f_clk (.A(clknet_0_clk),
    .X(clknet_3_7__leaf_clk));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(\adapter.i2cs.sda_i_filter[0] ),
    .X(net67));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(\adapter.i2cs.scl_i_filter[0] ),
    .X(net68));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\adapter.i2cs.sda_i_filter[1] ),
    .X(net69));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\adapter.i2cs.scl_i_filter[1] ),
    .X(net70));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(\adapter.i2cs.scl_i_filter[2] ),
    .X(net71));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(\adapter.i2cs.sda_i_filter[2] ),
    .X(net72));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(\adapter.i2cs.sda_i_filter[3] ),
    .X(net73));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(_062_),
    .X(net74));
 sky130_fd_sc_hd__dlygate4sd3_1 hold9 (.A(\adapter.i2cs.scl_i_reg ),
    .X(net75));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(\adapter.i2cs.scl_i_filter[3] ),
    .X(net76));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(\adapter.i2cs.sda_i_reg ),
    .X(net77));
 sky130_fd_sc_hd__dlygate4sd3_1 hold12 (.A(\adapter.i2cs.bit_count_reg[3] ),
    .X(net78));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(\adapter.i2cs.m_axis_data_tdata_reg[7] ),
    .X(net79));
 sky130_fd_sc_hd__dlygate4sd3_1 hold14 (.A(_060_),
    .X(net80));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(\adapter.i2cs.m_axis_data_tdata_reg[5] ),
    .X(net81));
 sky130_fd_sc_hd__dlygate4sd3_1 hold16 (.A(_058_),
    .X(net82));
 sky130_fd_sc_hd__dlygate4sd3_1 hold17 (.A(\adapter.i2cs.m_axis_data_tdata_reg[6] ),
    .X(net83));
 sky130_fd_sc_hd__dlygate4sd3_1 hold18 (.A(_059_),
    .X(net84));
 sky130_fd_sc_hd__dlygate4sd3_1 hold19 (.A(\adapter.i2cs.data_out_reg_valid_reg ),
    .X(net85));
 sky130_fd_sc_hd__dlygate4sd3_1 hold20 (.A(\adapter.i2cs.mode_read_reg ),
    .X(net86));
 sky130_fd_sc_hd__dlygate4sd3_1 hold21 (.A(net29),
    .X(net87));
 sky130_fd_sc_hd__dlygate4sd3_1 hold22 (.A(net27),
    .X(net88));
 sky130_fd_sc_hd__dlygate4sd3_1 hold23 (.A(\adapter.i2cs.data_reg[1] ),
    .X(net89));
 sky130_fd_sc_hd__dlygate4sd3_1 hold24 (.A(net28),
    .X(net90));
 sky130_fd_sc_hd__dlygate4sd3_1 hold25 (.A(\adapter.i2cs.m_axis_data_tdata_reg[1] ),
    .X(net91));
 sky130_fd_sc_hd__dlygate4sd3_1 hold26 (.A(\adapter.i2cs.data_reg[2] ),
    .X(net92));
 sky130_fd_sc_hd__dlygate4sd3_1 hold27 (.A(_055_),
    .X(net93));
 sky130_fd_sc_hd__dlygate4sd3_1 hold28 (.A(\adapter.i2cs.data_reg[3] ),
    .X(net94));
 sky130_fd_sc_hd__dlygate4sd3_1 hold29 (.A(\adapter.i2cs.data_reg[7] ),
    .X(net95));
 sky130_fd_sc_hd__dlygate4sd3_1 hold30 (.A(\adapter.i2cs.data_reg[0] ),
    .X(net96));
 sky130_fd_sc_hd__dlygate4sd3_1 hold31 (.A(\adapter.i2cs.m_axis_data_tdata_reg[0] ),
    .X(net97));
 sky130_fd_sc_hd__dlygate4sd3_1 hold32 (.A(\adapter.i2cs.m_axis_data_tdata_reg[3] ),
    .X(net98));
 sky130_fd_sc_hd__dlygate4sd3_1 hold33 (.A(\adapter.i2cs.data_reg[6] ),
    .X(net99));
 sky130_fd_sc_hd__dlygate4sd3_1 hold34 (.A(\adapter.i2cs.data_reg[5] ),
    .X(net100));
 sky130_fd_sc_hd__dlygate4sd3_1 hold35 (.A(\adapter.i2cs.data_reg[4] ),
    .X(net101));
 sky130_fd_sc_hd__dlygate4sd3_1 hold36 (.A(_057_),
    .X(net102));
 sky130_fd_sc_hd__dlygate4sd3_1 hold37 (.A(net14),
    .X(net103));
 sky130_fd_sc_hd__dlygate4sd3_1 hold38 (.A(\adapter.adapter.apb.bus_write ),
    .X(net104));
 sky130_fd_sc_hd__dlygate4sd3_1 hold39 (.A(\adapter.adapter.apb.out_valid ),
    .X(net105));
 sky130_fd_sc_hd__dlygate4sd3_1 hold40 (.A(\adapter.adapter.address[1] ),
    .X(net106));
 sky130_fd_sc_hd__dlygate4sd3_1 hold41 (.A(\adapter.adapter.address[2] ),
    .X(net107));
 sky130_fd_sc_hd__dlygate4sd3_1 hold42 (.A(net22),
    .X(net108));
 sky130_fd_sc_hd__dlygate4sd3_1 hold43 (.A(\adapter.adapter.address[0] ),
    .X(net109));
 sky130_fd_sc_hd__dlygate4sd3_1 hold44 (.A(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .X(net110));
 sky130_fd_sc_hd__dlygate4sd3_1 hold45 (.A(\adapter.i2cs.bit_count_reg[2] ),
    .X(net111));
 sky130_fd_sc_hd__dlygate4sd3_1 hold46 (.A(net23),
    .X(net112));
 sky130_fd_sc_hd__dlygate4sd3_1 hold47 (.A(\adapter.i2cs.scl_o_reg ),
    .X(net113));
 sky130_fd_sc_hd__dlygate4sd3_1 hold48 (.A(\adapter.i2cs.bit_count_reg[1] ),
    .X(net114));
 sky130_fd_sc_hd__dlygate4sd3_1 hold49 (.A(net26),
    .X(net115));
 sky130_fd_sc_hd__dlygate4sd3_1 hold50 (.A(_023_),
    .X(net116));
 sky130_fd_sc_hd__dlygate4sd3_1 hold51 (.A(\adapter.adapter.address[4] ),
    .X(net117));
 sky130_fd_sc_hd__dlygate4sd3_1 hold52 (.A(_011_),
    .X(net118));
 sky130_fd_sc_hd__dlygate4sd3_1 hold53 (.A(net24),
    .X(net119));
 sky130_fd_sc_hd__dlygate4sd3_1 hold54 (.A(_021_),
    .X(net120));
 sky130_fd_sc_hd__dlygate4sd3_1 hold55 (.A(net16),
    .X(net121));
 sky130_fd_sc_hd__dlygate4sd3_1 hold56 (.A(\adapter.adapter.address[3] ),
    .X(net122));
 sky130_fd_sc_hd__dlygate4sd3_1 hold57 (.A(\adapter.adapter.apb.out_data[6] ),
    .X(net123));
 sky130_fd_sc_hd__dlygate4sd3_1 hold58 (.A(\adapter.i2cs.state_reg[2] ),
    .X(net124));
 sky130_fd_sc_hd__dlygate4sd3_1 hold59 (.A(net25),
    .X(net125));
 sky130_fd_sc_hd__dlygate4sd3_1 hold60 (.A(\adapter.adapter.apb.out_data[3] ),
    .X(net126));
 sky130_fd_sc_hd__dlygate4sd3_1 hold61 (.A(\adapter.adapter.apb.out_data[2] ),
    .X(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(PRDATA[1]));
 sky130_fd_sc_hd__diode_2 ANTENNA_2 (.DIODE(PRDATA[2]));
 sky130_fd_sc_hd__diode_2 ANTENNA_3 (.DIODE(PRDATA[3]));
 sky130_fd_sc_hd__diode_2 ANTENNA_4 (.DIODE(PRDATA[4]));
 sky130_fd_sc_hd__diode_2 ANTENNA_5 (.DIODE(\adapter.i2cs.m_axis_data_tdata_reg[4] ));
 sky130_fd_sc_hd__diode_2 ANTENNA_6 (.DIODE(net9));
 sky130_fd_sc_hd__diode_2 ANTENNA_7 (.DIODE(net31));
 sky130_fd_sc_hd__diode_2 ANTENNA_8 (.DIODE(net65));
 sky130_fd_sc_hd__diode_2 ANTENNA_9 (.DIODE(net65));
 sky130_fd_sc_hd__diode_2 ANTENNA_10 (.DIODE(net64));
 sky130_fd_sc_hd__diode_2 ANTENNA_11 (.DIODE(net64));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_34 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_102 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_202 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_278 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_306 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_334 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_1_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_95 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_150 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_185 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_279 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_18 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_45 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_146 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_179 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_205 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_240 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_306 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_325 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_334 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_9 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_13 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_94 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_261 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_279 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_44 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_168 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_178 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_227 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_243 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_277 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_329 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_34 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_162 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_173 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_184 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_192 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_201 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_250 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_266 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_300 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_321 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_333 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_135 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_146 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_158 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_174 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_195 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_212 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_270 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_306 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_323 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_62 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_216 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_245 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_249 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_281 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_330 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_334 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_168 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_195 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_210 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_280 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_305 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_325 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_17 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_154 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_164 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_176 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_195 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_235 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_276 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_334 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_17 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_22 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_79 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_148 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_161 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_171 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_194 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_214 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_332 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_101 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_158 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_163 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_175 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_192 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_207 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_251 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_305 ();
endmodule
