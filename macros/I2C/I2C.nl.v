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
 wire \adapter.state[0] ;
 wire \adapter.state[1] ;
 wire \adapter.state[2] ;
 wire \adapter.state[3] ;
 wire \adapter.state[4] ;
 wire \adapter.state[5] ;
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
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
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

 sky130_fd_sc_hd__inv_2 _182_ (.A(\adapter.i2cs.sda_o_reg ),
    .Y(net32));
 sky130_fd_sc_hd__inv_2 _183_ (.A(\adapter.i2cs.scl_o_reg ),
    .Y(net31));
 sky130_fd_sc_hd__inv_2 _184_ (.A(\adapter.i2cs.sda_i_reg ),
    .Y(_044_));
 sky130_fd_sc_hd__inv_2 _185_ (.A(\adapter.i2cs.scl_i_reg ),
    .Y(_045_));
 sky130_fd_sc_hd__inv_2 _186_ (.A(net37),
    .Y(_046_));
 sky130_fd_sc_hd__inv_2 _187_ (.A(net9),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _188_ (.A(\adapter.state[0] ),
    .Y(_048_));
 sky130_fd_sc_hd__inv_2 _189_ (.A(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .Y(_049_));
 sky130_fd_sc_hd__or2_1 _190_ (.A(\adapter.state[2] ),
    .B(\adapter.state[5] ),
    .X(net30));
 sky130_fd_sc_hd__o211a_1 _191_ (.A1(net82),
    .A2(_047_),
    .B1(net30),
    .C1(net38),
    .X(_005_));
 sky130_fd_sc_hd__or2_1 _192_ (.A(\adapter.state[4] ),
    .B(\adapter.state[1] ),
    .X(_050_));
 sky130_fd_sc_hd__o211a_1 _193_ (.A1(_047_),
    .A2(net77),
    .B1(_050_),
    .C1(net38),
    .X(_004_));
 sky130_fd_sc_hd__and4bb_1 _194_ (.A_N(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .B_N(\adapter.i2cs.s_axis_data_tready_reg ),
    .C(\adapter.state[3] ),
    .D(net38),
    .X(_051_));
 sky130_fd_sc_hd__a31o_1 _195_ (.A1(net38),
    .A2(net9),
    .A3(\adapter.state[5] ),
    .B1(_051_),
    .X(_052_));
 sky130_fd_sc_hd__inv_2 _196_ (.A(_052_),
    .Y(_053_));
 sky130_fd_sc_hd__nor2_2 _197_ (.A(_048_),
    .B(_049_),
    .Y(_054_));
 sky130_fd_sc_hd__nand2_1 _198_ (.A(\adapter.state[0] ),
    .B(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .Y(_055_));
 sky130_fd_sc_hd__a22o_1 _199_ (.A1(net67),
    .A2(_052_),
    .B1(_054_),
    .B2(net38),
    .X(_003_));
 sky130_fd_sc_hd__nand2_1 _200_ (.A(net9),
    .B(\adapter.state[4] ),
    .Y(_056_));
 sky130_fd_sc_hd__o311a_1 _201_ (.A1(_048_),
    .A2(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .A3(\adapter.i2cs.s_axis_data_tready_reg ),
    .B1(_056_),
    .C1(net39),
    .X(_057_));
 sky130_fd_sc_hd__o21ai_1 _202_ (.A1(net67),
    .A2(_053_),
    .B1(_057_),
    .Y(_002_));
 sky130_fd_sc_hd__and3_1 _203_ (.A(net39),
    .B(\adapter.i2cs.m_axis_data_tvalid_reg ),
    .C(net98),
    .X(_001_));
 sky130_fd_sc_hd__o2111a_1 _204_ (.A1(\adapter.state[0] ),
    .A2(\adapter.state[3] ),
    .B1(_049_),
    .C1(net39),
    .D1(net89),
    .X(_000_));
 sky130_fd_sc_hd__or2_1 _205_ (.A(\adapter.state[5] ),
    .B(\adapter.state[4] ),
    .X(net19));
 sky130_fd_sc_hd__or2_1 _206_ (.A(net30),
    .B(_050_),
    .X(net21));
 sky130_fd_sc_hd__and2b_1 _207_ (.A_N(net35),
    .B(net37),
    .X(_058_));
 sky130_fd_sc_hd__nand2b_1 _208_ (.A_N(net35),
    .B(net37),
    .Y(_059_));
 sky130_fd_sc_hd__nand2_1 _209_ (.A(_046_),
    .B(net35),
    .Y(_060_));
 sky130_fd_sc_hd__nor2_1 _210_ (.A(net36),
    .B(_059_),
    .Y(_061_));
 sky130_fd_sc_hd__and3b_1 _211_ (.A_N(net35),
    .B(net36),
    .C(net37),
    .X(_062_));
 sky130_fd_sc_hd__xnor2_1 _212_ (.A(net36),
    .B(_058_),
    .Y(_063_));
 sky130_fd_sc_hd__and2b_1 _213_ (.A_N(\adapter.i2cs.last_scl_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .X(_064_));
 sky130_fd_sc_hd__nand2b_1 _214_ (.A_N(\adapter.i2cs.last_scl_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .Y(_065_));
 sky130_fd_sc_hd__or3b_1 _215_ (.A(net37),
    .B(\adapter.i2cs.state_reg[2] ),
    .C_N(net35),
    .X(_066_));
 sky130_fd_sc_hd__or3b_1 _216_ (.A(\adapter.i2cs.state_reg[1] ),
    .B(\adapter.i2cs.state_reg[0] ),
    .C_N(\adapter.i2cs.state_reg[2] ),
    .X(_067_));
 sky130_fd_sc_hd__a21oi_1 _217_ (.A1(_066_),
    .A2(_067_),
    .B1(_064_),
    .Y(_068_));
 sky130_fd_sc_hd__or2_1 _218_ (.A(\adapter.i2cs.bit_count_reg[1] ),
    .B(\adapter.i2cs.bit_count_reg[0] ),
    .X(_069_));
 sky130_fd_sc_hd__nor3_1 _219_ (.A(\adapter.i2cs.bit_count_reg[3] ),
    .B(\adapter.i2cs.bit_count_reg[2] ),
    .C(_069_),
    .Y(_070_));
 sky130_fd_sc_hd__or4_1 _220_ (.A(\adapter.i2cs.bit_count_reg[3] ),
    .B(\adapter.i2cs.bit_count_reg[2] ),
    .C(\adapter.i2cs.bit_count_reg[1] ),
    .D(\adapter.i2cs.bit_count_reg[0] ),
    .X(_071_));
 sky130_fd_sc_hd__o21a_1 _221_ (.A1(net35),
    .A2(net36),
    .B1(_046_),
    .X(_072_));
 sky130_fd_sc_hd__a221o_1 _222_ (.A1(_060_),
    .A2(_063_),
    .B1(_070_),
    .B2(_072_),
    .C1(_068_),
    .X(_073_));
 sky130_fd_sc_hd__and3_1 _223_ (.A(\adapter.i2cs.state_reg[1] ),
    .B(\adapter.i2cs.state_reg[0] ),
    .C(net36),
    .X(_074_));
 sky130_fd_sc_hd__o21a_1 _224_ (.A1(\adapter.i2cs.sda_i_reg ),
    .A2(_065_),
    .B1(_074_),
    .X(_075_));
 sky130_fd_sc_hd__and3b_1 _225_ (.A_N(\adapter.i2cs.last_sda_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .C(\adapter.i2cs.sda_i_reg ),
    .X(_076_));
 sky130_fd_sc_hd__and2b_1 _226_ (.A_N(\adapter.i2cs.scl_i_reg ),
    .B(\adapter.i2cs.last_scl_i_reg ),
    .X(_077_));
 sky130_fd_sc_hd__nand2b_1 _227_ (.A_N(\adapter.i2cs.scl_i_reg ),
    .B(\adapter.i2cs.last_scl_i_reg ),
    .Y(_078_));
 sky130_fd_sc_hd__nor2_1 _228_ (.A(net31),
    .B(_077_),
    .Y(_079_));
 sky130_fd_sc_hd__nand2_1 _229_ (.A(\adapter.i2cs.scl_o_reg ),
    .B(_078_),
    .Y(_080_));
 sky130_fd_sc_hd__and3b_1 _230_ (.A_N(net37),
    .B(net35),
    .C(net36),
    .X(_081_));
 sky130_fd_sc_hd__nand3b_2 _231_ (.A_N(net37),
    .B(net35),
    .C(net36),
    .Y(_082_));
 sky130_fd_sc_hd__and3_1 _232_ (.A(\adapter.i2cs.scl_o_reg ),
    .B(_078_),
    .C(_081_),
    .X(_083_));
 sky130_fd_sc_hd__or3_2 _233_ (.A(_075_),
    .B(_076_),
    .C(_083_),
    .X(_084_));
 sky130_fd_sc_hd__nor2_2 _234_ (.A(\adapter.i2cs.data_valid_reg ),
    .B(_082_),
    .Y(_085_));
 sky130_fd_sc_hd__a22o_1 _235_ (.A1(_061_),
    .A2(_078_),
    .B1(_080_),
    .B2(_085_),
    .X(_086_));
 sky130_fd_sc_hd__o41a_1 _236_ (.A1(net37),
    .A2(_073_),
    .A3(_084_),
    .A4(_086_),
    .B1(\adapter.i2cs.bit_count_reg[0] ),
    .X(_087_));
 sky130_fd_sc_hd__and3b_2 _237_ (.A_N(\adapter.i2cs.sda_i_reg ),
    .B(\adapter.i2cs.scl_i_reg ),
    .C(\adapter.i2cs.last_sda_i_reg ),
    .X(_088_));
 sky130_fd_sc_hd__or4_1 _238_ (.A(\adapter.i2cs.bit_count_reg[0] ),
    .B(_073_),
    .C(_084_),
    .D(_086_),
    .X(_089_));
 sky130_fd_sc_hd__or3b_1 _239_ (.A(_087_),
    .B(_088_),
    .C_N(_089_),
    .X(_006_));
 sky130_fd_sc_hd__a2111oi_1 _240_ (.A1(_069_),
    .A2(_072_),
    .B1(_073_),
    .C1(_084_),
    .D1(_086_),
    .Y(_090_));
 sky130_fd_sc_hd__a211o_1 _241_ (.A1(net76),
    .A2(_089_),
    .B1(_090_),
    .C1(_088_),
    .X(_007_));
 sky130_fd_sc_hd__o41a_1 _242_ (.A1(_069_),
    .A2(_073_),
    .A3(_084_),
    .A4(_086_),
    .B1(\adapter.i2cs.bit_count_reg[2] ),
    .X(_091_));
 sky130_fd_sc_hd__o21a_1 _243_ (.A1(\adapter.i2cs.bit_count_reg[2] ),
    .A2(_069_),
    .B1(_072_),
    .X(_092_));
 sky130_fd_sc_hd__or4_1 _244_ (.A(_073_),
    .B(_084_),
    .C(_086_),
    .D(_092_),
    .X(_093_));
 sky130_fd_sc_hd__or3b_1 _245_ (.A(_088_),
    .B(_091_),
    .C_N(_093_),
    .X(_008_));
 sky130_fd_sc_hd__and3b_1 _246_ (.A_N(_088_),
    .B(_093_),
    .C(net97),
    .X(_009_));
 sky130_fd_sc_hd__nor2_2 _247_ (.A(_076_),
    .B(_088_),
    .Y(_094_));
 sky130_fd_sc_hd__or2_1 _248_ (.A(_076_),
    .B(_088_),
    .X(_095_));
 sky130_fd_sc_hd__nor2_1 _249_ (.A(_065_),
    .B(_071_),
    .Y(_096_));
 sky130_fd_sc_hd__or3_1 _250_ (.A(_065_),
    .B(_066_),
    .C(_071_),
    .X(_097_));
 sky130_fd_sc_hd__or4bb_1 _251_ (.A(\adapter.i2cs.data_reg[0] ),
    .B(\adapter.i2cs.data_reg[2] ),
    .C_N(\adapter.i2cs.data_reg[3] ),
    .D_N(\adapter.i2cs.data_reg[1] ),
    .X(_098_));
 sky130_fd_sc_hd__or4b_1 _252_ (.A(\adapter.i2cs.data_reg[4] ),
    .B(\adapter.i2cs.data_reg[6] ),
    .C(_098_),
    .D_N(\adapter.i2cs.data_reg[5] ),
    .X(_099_));
 sky130_fd_sc_hd__nor2_1 _253_ (.A(_097_),
    .B(_099_),
    .Y(_100_));
 sky130_fd_sc_hd__and3b_2 _254_ (.A_N(net36),
    .B(net35),
    .C(net37),
    .X(_101_));
 sky130_fd_sc_hd__inv_2 _255_ (.A(_101_),
    .Y(_102_));
 sky130_fd_sc_hd__a211oi_4 _256_ (.A1(net9),
    .A2(\adapter.state[5] ),
    .B1(\adapter.state[0] ),
    .C1(_049_),
    .Y(_103_));
 sky130_fd_sc_hd__nor2_1 _257_ (.A(_079_),
    .B(_103_),
    .Y(_104_));
 sky130_fd_sc_hd__o21a_1 _258_ (.A1(_079_),
    .A2(_103_),
    .B1(_101_),
    .X(_105_));
 sky130_fd_sc_hd__a21oi_1 _259_ (.A1(\adapter.i2cs.mode_read_reg ),
    .A2(_077_),
    .B1(_059_),
    .Y(_106_));
 sky130_fd_sc_hd__a2111o_1 _260_ (.A1(_065_),
    .A2(_074_),
    .B1(_105_),
    .C1(_106_),
    .D1(_062_),
    .X(_107_));
 sky130_fd_sc_hd__and2b_1 _261_ (.A_N(_067_),
    .B(_096_),
    .X(_108_));
 sky130_fd_sc_hd__a41o_1 _262_ (.A1(\adapter.i2cs.data_valid_reg ),
    .A2(_070_),
    .A3(_080_),
    .A4(_081_),
    .B1(_108_),
    .X(_109_));
 sky130_fd_sc_hd__o311a_1 _263_ (.A1(_100_),
    .A2(_107_),
    .A3(_109_),
    .B1(_094_),
    .C1(net40),
    .X(_010_));
 sky130_fd_sc_hd__nor2_1 _264_ (.A(_067_),
    .B(_096_),
    .Y(_110_));
 sky130_fd_sc_hd__and2_1 _265_ (.A(_101_),
    .B(_104_),
    .X(_111_));
 sky130_fd_sc_hd__o31a_1 _266_ (.A1(_044_),
    .A2(_045_),
    .A3(\adapter.i2cs.last_scl_i_reg ),
    .B1(_074_),
    .X(_112_));
 sky130_fd_sc_hd__and3_1 _267_ (.A(\adapter.i2cs.mode_read_reg ),
    .B(_061_),
    .C(_077_),
    .X(_113_));
 sky130_fd_sc_hd__or4_1 _268_ (.A(_062_),
    .B(_081_),
    .C(_112_),
    .D(_113_),
    .X(_114_));
 sky130_fd_sc_hd__o311a_1 _269_ (.A1(_110_),
    .A2(_111_),
    .A3(_114_),
    .B1(_094_),
    .C1(net40),
    .X(_011_));
 sky130_fd_sc_hd__nor2_1 _270_ (.A(_066_),
    .B(_096_),
    .Y(_115_));
 sky130_fd_sc_hd__a31o_1 _271_ (.A1(\adapter.i2cs.data_valid_reg ),
    .A2(_070_),
    .A3(_080_),
    .B1(_082_),
    .X(_116_));
 sky130_fd_sc_hd__a211o_1 _272_ (.A1(_058_),
    .A2(_077_),
    .B1(_088_),
    .C1(_112_),
    .X(_117_));
 sky130_fd_sc_hd__or4b_1 _273_ (.A(_105_),
    .B(_115_),
    .C(_117_),
    .D_N(_116_),
    .X(_118_));
 sky130_fd_sc_hd__and3b_1 _274_ (.A_N(_076_),
    .B(_118_),
    .C(net40),
    .X(_012_));
 sky130_fd_sc_hd__nand2b_1 _275_ (.A_N(_062_),
    .B(_066_),
    .Y(_119_));
 sky130_fd_sc_hd__and3_4 _276_ (.A(net9),
    .B(\adapter.state[4] ),
    .C(\adapter.i2cs.s_axis_data_tready_reg ),
    .X(_120_));
 sky130_fd_sc_hd__inv_2 _277_ (.A(_120_),
    .Y(_121_));
 sky130_fd_sc_hd__nor2_1 _278_ (.A(_082_),
    .B(_120_),
    .Y(_122_));
 sky130_fd_sc_hd__or4_1 _279_ (.A(_075_),
    .B(_106_),
    .C(_119_),
    .D(_122_),
    .X(_123_));
 sky130_fd_sc_hd__nor3_1 _280_ (.A(_105_),
    .B(_110_),
    .C(_123_),
    .Y(_124_));
 sky130_fd_sc_hd__a2111o_1 _281_ (.A1(_046_),
    .A2(net36),
    .B1(_105_),
    .C1(_110_),
    .D1(_123_),
    .X(_125_));
 sky130_fd_sc_hd__o211a_1 _282_ (.A1(\adapter.i2cs.data_valid_reg ),
    .A2(_124_),
    .B1(_125_),
    .C1(_094_),
    .X(_013_));
 sky130_fd_sc_hd__o32a_1 _283_ (.A1(_079_),
    .A2(_102_),
    .A3(_103_),
    .B1(net35),
    .B2(\adapter.i2cs.state_reg[1] ),
    .X(_126_));
 sky130_fd_sc_hd__nor2_1 _284_ (.A(_110_),
    .B(_126_),
    .Y(_127_));
 sky130_fd_sc_hd__a211o_1 _285_ (.A1(\adapter.i2cs.data_valid_reg ),
    .A2(_101_),
    .B1(_110_),
    .C1(_126_),
    .X(_128_));
 sky130_fd_sc_hd__o211a_1 _286_ (.A1(net83),
    .A2(_127_),
    .B1(_128_),
    .C1(_094_),
    .X(_014_));
 sky130_fd_sc_hd__and4b_4 _287_ (.A_N(_068_),
    .B(_072_),
    .C(_094_),
    .D(_097_),
    .X(_129_));
 sky130_fd_sc_hd__and2b_1 _288_ (.A_N(_122_),
    .B(_129_),
    .X(_130_));
 sky130_fd_sc_hd__nor2_4 _289_ (.A(_083_),
    .B(_085_),
    .Y(_131_));
 sky130_fd_sc_hd__or2_1 _290_ (.A(_083_),
    .B(_085_),
    .X(_132_));
 sky130_fd_sc_hd__nor2_1 _291_ (.A(net1),
    .B(_121_),
    .Y(_133_));
 sky130_fd_sc_hd__o221a_1 _292_ (.A1(_044_),
    .A2(_081_),
    .B1(_131_),
    .B2(_133_),
    .C1(_129_),
    .X(_134_));
 sky130_fd_sc_hd__o21ba_1 _293_ (.A1(net103),
    .A2(_130_),
    .B1_N(_134_),
    .X(_015_));
 sky130_fd_sc_hd__o21ai_4 _294_ (.A1(_120_),
    .A2(_131_),
    .B1(_129_),
    .Y(_135_));
 sky130_fd_sc_hd__or2_1 _295_ (.A(\adapter.i2cs.data_reg[0] ),
    .B(_132_),
    .X(_136_));
 sky130_fd_sc_hd__a21o_1 _296_ (.A1(net2),
    .A2(_120_),
    .B1(_131_),
    .X(_137_));
 sky130_fd_sc_hd__a32o_1 _297_ (.A1(_129_),
    .A2(_136_),
    .A3(_137_),
    .B1(_135_),
    .B2(net87),
    .X(_016_));
 sky130_fd_sc_hd__or2_1 _298_ (.A(\adapter.i2cs.data_reg[1] ),
    .B(_132_),
    .X(_138_));
 sky130_fd_sc_hd__a21o_1 _299_ (.A1(net3),
    .A2(_120_),
    .B1(_131_),
    .X(_139_));
 sky130_fd_sc_hd__a32o_1 _300_ (.A1(_129_),
    .A2(_138_),
    .A3(_139_),
    .B1(_135_),
    .B2(net91),
    .X(_017_));
 sky130_fd_sc_hd__or2_1 _301_ (.A(\adapter.i2cs.data_reg[2] ),
    .B(_132_),
    .X(_140_));
 sky130_fd_sc_hd__a21o_1 _302_ (.A1(net4),
    .A2(_120_),
    .B1(_131_),
    .X(_141_));
 sky130_fd_sc_hd__a32o_1 _303_ (.A1(_129_),
    .A2(_140_),
    .A3(_141_),
    .B1(_135_),
    .B2(net85),
    .X(_018_));
 sky130_fd_sc_hd__or2_1 _304_ (.A(\adapter.i2cs.data_reg[3] ),
    .B(_132_),
    .X(_142_));
 sky130_fd_sc_hd__a21o_1 _305_ (.A1(net5),
    .A2(_120_),
    .B1(_131_),
    .X(_143_));
 sky130_fd_sc_hd__a32o_1 _306_ (.A1(_129_),
    .A2(_142_),
    .A3(_143_),
    .B1(_135_),
    .B2(net86),
    .X(_019_));
 sky130_fd_sc_hd__or2_1 _307_ (.A(\adapter.i2cs.data_reg[4] ),
    .B(_132_),
    .X(_144_));
 sky130_fd_sc_hd__a21o_1 _308_ (.A1(net6),
    .A2(_120_),
    .B1(_131_),
    .X(_145_));
 sky130_fd_sc_hd__a32o_1 _309_ (.A1(_129_),
    .A2(_144_),
    .A3(_145_),
    .B1(_135_),
    .B2(net84),
    .X(_020_));
 sky130_fd_sc_hd__or2_1 _310_ (.A(\adapter.i2cs.data_reg[5] ),
    .B(_132_),
    .X(_146_));
 sky130_fd_sc_hd__a21o_1 _311_ (.A1(net7),
    .A2(_120_),
    .B1(_131_),
    .X(_147_));
 sky130_fd_sc_hd__a32o_1 _312_ (.A1(_129_),
    .A2(_146_),
    .A3(_147_),
    .B1(_135_),
    .B2(net88),
    .X(_021_));
 sky130_fd_sc_hd__or2_1 _313_ (.A(\adapter.i2cs.data_reg[6] ),
    .B(_132_),
    .X(_148_));
 sky130_fd_sc_hd__a21o_1 _314_ (.A1(net8),
    .A2(_120_),
    .B1(_131_),
    .X(_149_));
 sky130_fd_sc_hd__a32o_1 _315_ (.A1(_129_),
    .A2(_148_),
    .A3(_149_),
    .B1(_135_),
    .B2(net93),
    .X(_022_));
 sky130_fd_sc_hd__nand2_1 _316_ (.A(_094_),
    .B(_100_),
    .Y(_150_));
 sky130_fd_sc_hd__mux2_1 _317_ (.A0(\adapter.i2cs.sda_i_reg ),
    .A1(net80),
    .S(_150_),
    .X(_023_));
 sky130_fd_sc_hd__a32o_1 _318_ (.A1(_044_),
    .A2(_064_),
    .A3(_074_),
    .B1(_085_),
    .B2(_121_),
    .X(_151_));
 sky130_fd_sc_hd__o211a_1 _319_ (.A1(_113_),
    .A2(_151_),
    .B1(net40),
    .C1(_094_),
    .X(_024_));
 sky130_fd_sc_hd__and4_4 _320_ (.A(\adapter.i2cs.data_valid_reg ),
    .B(_094_),
    .C(_101_),
    .D(_104_),
    .X(_152_));
 sky130_fd_sc_hd__mux2_1 _321_ (.A0(net101),
    .A1(\adapter.i2cs.data_reg[0] ),
    .S(_152_),
    .X(_025_));
 sky130_fd_sc_hd__mux2_1 _322_ (.A0(net104),
    .A1(net87),
    .S(_152_),
    .X(_026_));
 sky130_fd_sc_hd__mux2_1 _323_ (.A0(net100),
    .A1(net91),
    .S(_152_),
    .X(_027_));
 sky130_fd_sc_hd__mux2_1 _324_ (.A0(net94),
    .A1(net85),
    .S(_152_),
    .X(_028_));
 sky130_fd_sc_hd__mux2_1 _325_ (.A0(net92),
    .A1(net86),
    .S(_152_),
    .X(_029_));
 sky130_fd_sc_hd__mux2_1 _326_ (.A0(net74),
    .A1(\adapter.i2cs.data_reg[5] ),
    .S(_152_),
    .X(_030_));
 sky130_fd_sc_hd__mux2_1 _327_ (.A0(net78),
    .A1(\adapter.i2cs.data_reg[6] ),
    .S(_152_),
    .X(_031_));
 sky130_fd_sc_hd__mux2_1 _328_ (.A0(net70),
    .A1(\adapter.i2cs.data_reg[7] ),
    .S(_152_),
    .X(_032_));
 sky130_fd_sc_hd__a31o_1 _329_ (.A1(\adapter.i2cs.scl_i_filter[1] ),
    .A2(\adapter.i2cs.scl_i_filter[2] ),
    .A3(\adapter.i2cs.scl_i_filter[3] ),
    .B1(\adapter.i2cs.scl_i_reg ),
    .X(_153_));
 sky130_fd_sc_hd__or3_1 _330_ (.A(\adapter.i2cs.scl_i_filter[1] ),
    .B(\adapter.i2cs.scl_i_filter[2] ),
    .C(net72),
    .X(_154_));
 sky130_fd_sc_hd__a22o_1 _331_ (.A1(net62),
    .A2(_153_),
    .B1(_154_),
    .B2(net69),
    .X(_033_));
 sky130_fd_sc_hd__a31o_1 _332_ (.A1(\adapter.i2cs.sda_i_filter[1] ),
    .A2(\adapter.i2cs.sda_i_filter[2] ),
    .A3(\adapter.i2cs.sda_i_filter[3] ),
    .B1(\adapter.i2cs.sda_i_reg ),
    .X(_155_));
 sky130_fd_sc_hd__or3_1 _333_ (.A(\adapter.i2cs.sda_i_filter[1] ),
    .B(\adapter.i2cs.sda_i_filter[2] ),
    .C(net73),
    .X(_156_));
 sky130_fd_sc_hd__a22o_1 _334_ (.A1(net61),
    .A2(_155_),
    .B1(_156_),
    .B2(net68),
    .X(_034_));
 sky130_fd_sc_hd__or2_1 _335_ (.A(_081_),
    .B(_101_),
    .X(_157_));
 sky130_fd_sc_hd__and3_1 _336_ (.A(_080_),
    .B(_094_),
    .C(_157_),
    .X(_158_));
 sky130_fd_sc_hd__a21o_1 _337_ (.A1(_082_),
    .A2(_103_),
    .B1(_085_),
    .X(_159_));
 sky130_fd_sc_hd__mux2_1 _338_ (.A0(net31),
    .A1(_159_),
    .S(_158_),
    .X(_160_));
 sky130_fd_sc_hd__nand2_1 _339_ (.A(net40),
    .B(_160_),
    .Y(_035_));
 sky130_fd_sc_hd__nor2_1 _340_ (.A(_058_),
    .B(_157_),
    .Y(_161_));
 sky130_fd_sc_hd__and3_1 _341_ (.A(\adapter.i2cs.scl_o_reg ),
    .B(_078_),
    .C(_101_),
    .X(_162_));
 sky130_fd_sc_hd__a2111o_1 _342_ (.A1(_062_),
    .A2(_078_),
    .B1(_083_),
    .C1(_095_),
    .D1(_162_),
    .X(_163_));
 sky130_fd_sc_hd__o31a_1 _343_ (.A1(_086_),
    .A2(_161_),
    .A3(_163_),
    .B1(\adapter.i2cs.sda_o_reg ),
    .X(_164_));
 sky130_fd_sc_hd__a211o_1 _344_ (.A1(\adapter.i2cs.data_reg[7] ),
    .A2(_081_),
    .B1(_101_),
    .C1(_062_),
    .X(_165_));
 sky130_fd_sc_hd__or4b_1 _345_ (.A(_086_),
    .B(_161_),
    .C(_163_),
    .D_N(_165_),
    .X(_166_));
 sky130_fd_sc_hd__nand3b_1 _346_ (.A_N(_164_),
    .B(_166_),
    .C(net40),
    .Y(_036_));
 sky130_fd_sc_hd__o21bai_1 _347_ (.A1(_095_),
    .A2(_108_),
    .B1_N(net83),
    .Y(_167_));
 sky130_fd_sc_hd__o311a_1 _348_ (.A1(_095_),
    .A2(_103_),
    .A3(_108_),
    .B1(_167_),
    .C1(net38),
    .X(_037_));
 sky130_fd_sc_hd__o21a_1 _349_ (.A1(\adapter.state[5] ),
    .A2(\adapter.state[4] ),
    .B1(net9),
    .X(_168_));
 sky130_fd_sc_hd__or2_1 _350_ (.A(_054_),
    .B(_168_),
    .X(_169_));
 sky130_fd_sc_hd__a21oi_1 _351_ (.A1(net13),
    .A2(_168_),
    .B1(_054_),
    .Y(_170_));
 sky130_fd_sc_hd__a21o_1 _352_ (.A1(net22),
    .A2(_054_),
    .B1(_170_),
    .X(_171_));
 sky130_fd_sc_hd__o211a_1 _353_ (.A1(net105),
    .A2(_169_),
    .B1(_171_),
    .C1(net39),
    .X(_038_));
 sky130_fd_sc_hd__nand2b_1 _354_ (.A_N(net14),
    .B(_170_),
    .Y(_172_));
 sky130_fd_sc_hd__and3_1 _355_ (.A(net14),
    .B(net13),
    .C(_168_),
    .X(_173_));
 sky130_fd_sc_hd__nand2_1 _356_ (.A(_055_),
    .B(_173_),
    .Y(_174_));
 sky130_fd_sc_hd__o2111a_1 _357_ (.A1(net23),
    .A2(_055_),
    .B1(_172_),
    .C1(_174_),
    .D1(net38),
    .X(_039_));
 sky130_fd_sc_hd__a21o_1 _358_ (.A1(net15),
    .A2(_173_),
    .B1(_054_),
    .X(_175_));
 sky130_fd_sc_hd__a21oi_1 _359_ (.A1(net14),
    .A2(net13),
    .B1(net15),
    .Y(_176_));
 sky130_fd_sc_hd__a2bb2o_1 _360_ (.A1_N(_175_),
    .A2_N(_176_),
    .B1(net24),
    .B2(_054_),
    .X(_177_));
 sky130_fd_sc_hd__o211a_1 _361_ (.A1(net15),
    .A2(_169_),
    .B1(_177_),
    .C1(net39),
    .X(_040_));
 sky130_fd_sc_hd__a31o_1 _362_ (.A1(net16),
    .A2(net15),
    .A3(_173_),
    .B1(_054_),
    .X(_178_));
 sky130_fd_sc_hd__a21bo_1 _363_ (.A1(net25),
    .A2(_054_),
    .B1_N(_178_),
    .X(_179_));
 sky130_fd_sc_hd__o211a_1 _364_ (.A1(net96),
    .A2(_175_),
    .B1(_179_),
    .C1(net38),
    .X(_041_));
 sky130_fd_sc_hd__nand2_1 _365_ (.A(net26),
    .B(_054_),
    .Y(_180_));
 sky130_fd_sc_hd__o211ai_1 _366_ (.A1(net17),
    .A2(_054_),
    .B1(_178_),
    .C1(_180_),
    .Y(_181_));
 sky130_fd_sc_hd__o211a_1 _367_ (.A1(net95),
    .A2(_178_),
    .B1(_181_),
    .C1(net38),
    .X(_042_));
 sky130_fd_sc_hd__o31a_1 _368_ (.A1(net37),
    .A2(net99),
    .A3(net36),
    .B1(net38),
    .X(_043_));
 sky130_fd_sc_hd__dfxtp_1 _369_ (.CLK(clknet_2_1__leaf_clk),
    .D(_006_),
    .Q(\adapter.i2cs.bit_count_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _370_ (.CLK(clknet_2_1__leaf_clk),
    .D(_007_),
    .Q(\adapter.i2cs.bit_count_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _371_ (.CLK(clknet_2_1__leaf_clk),
    .D(_008_),
    .Q(\adapter.i2cs.bit_count_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _372_ (.CLK(clknet_2_1__leaf_clk),
    .D(_009_),
    .Q(\adapter.i2cs.bit_count_reg[3] ));
 sky130_fd_sc_hd__dfxtp_1 _373_ (.CLK(clknet_2_0__leaf_clk),
    .D(_010_),
    .Q(\adapter.i2cs.state_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _374_ (.CLK(clknet_2_2__leaf_clk),
    .D(_011_),
    .Q(\adapter.i2cs.state_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _375_ (.CLK(clknet_2_3__leaf_clk),
    .D(_002_),
    .Q(\adapter.state[0] ));
 sky130_fd_sc_hd__dfxtp_1 _376_ (.CLK(clknet_2_3__leaf_clk),
    .D(net90),
    .Q(\adapter.state[1] ));
 sky130_fd_sc_hd__dfxtp_1 _377_ (.CLK(clknet_2_2__leaf_clk),
    .D(_001_),
    .Q(\adapter.state[2] ));
 sky130_fd_sc_hd__dfxtp_1 _378_ (.CLK(clknet_2_3__leaf_clk),
    .D(_003_),
    .Q(\adapter.state[3] ));
 sky130_fd_sc_hd__dfxtp_1 _379_ (.CLK(clknet_2_2__leaf_clk),
    .D(_004_),
    .Q(\adapter.state[4] ));
 sky130_fd_sc_hd__dfxtp_1 _380_ (.CLK(clknet_2_2__leaf_clk),
    .D(_005_),
    .Q(\adapter.state[5] ));
 sky130_fd_sc_hd__dfxtp_1 _381_ (.CLK(clknet_2_3__leaf_clk),
    .D(_012_),
    .Q(\adapter.i2cs.state_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _382_ (.CLK(clknet_2_2__leaf_clk),
    .D(_013_),
    .Q(\adapter.i2cs.data_valid_reg ));
 sky130_fd_sc_hd__dfxtp_1 _383_ (.CLK(clknet_2_2__leaf_clk),
    .D(_014_),
    .Q(\adapter.i2cs.data_out_reg_valid_reg ));
 sky130_fd_sc_hd__dfxtp_1 _384_ (.CLK(clknet_2_1__leaf_clk),
    .D(_015_),
    .Q(\adapter.i2cs.data_reg[0] ));
 sky130_fd_sc_hd__dfxtp_1 _385_ (.CLK(clknet_2_1__leaf_clk),
    .D(_016_),
    .Q(\adapter.i2cs.data_reg[1] ));
 sky130_fd_sc_hd__dfxtp_1 _386_ (.CLK(clknet_2_1__leaf_clk),
    .D(_017_),
    .Q(\adapter.i2cs.data_reg[2] ));
 sky130_fd_sc_hd__dfxtp_1 _387_ (.CLK(clknet_2_1__leaf_clk),
    .D(_018_),
    .Q(\adapter.i2cs.data_reg[3] ));
 sky130_fd_sc_hd__dfxtp_1 _388_ (.CLK(clknet_2_0__leaf_clk),
    .D(_019_),
    .Q(\adapter.i2cs.data_reg[4] ));
 sky130_fd_sc_hd__dfxtp_1 _389_ (.CLK(clknet_2_0__leaf_clk),
    .D(_020_),
    .Q(\adapter.i2cs.data_reg[5] ));
 sky130_fd_sc_hd__dfxtp_1 _390_ (.CLK(clknet_2_0__leaf_clk),
    .D(_021_),
    .Q(\adapter.i2cs.data_reg[6] ));
 sky130_fd_sc_hd__dfxtp_1 _391_ (.CLK(clknet_2_1__leaf_clk),
    .D(_022_),
    .Q(\adapter.i2cs.data_reg[7] ));
 sky130_fd_sc_hd__dfxtp_1 _392_ (.CLK(clknet_2_2__leaf_clk),
    .D(net81),
    .Q(\adapter.i2cs.mode_read_reg ));
 sky130_fd_sc_hd__dfxtp_1 _393_ (.CLK(clknet_2_2__leaf_clk),
    .D(_024_),
    .Q(\adapter.i2cs.s_axis_data_tready_reg ));
 sky130_fd_sc_hd__dfxtp_1 _394_ (.CLK(clknet_2_0__leaf_clk),
    .D(net102),
    .Q(net22));
 sky130_fd_sc_hd__dfxtp_1 _395_ (.CLK(clknet_2_0__leaf_clk),
    .D(_026_),
    .Q(net23));
 sky130_fd_sc_hd__dfxtp_1 _396_ (.CLK(clknet_2_0__leaf_clk),
    .D(_027_),
    .Q(net24));
 sky130_fd_sc_hd__dfxtp_1 _397_ (.CLK(clknet_2_1__leaf_clk),
    .D(_028_),
    .Q(net25));
 sky130_fd_sc_hd__dfxtp_1 _398_ (.CLK(clknet_2_1__leaf_clk),
    .D(_029_),
    .Q(net26));
 sky130_fd_sc_hd__dfxtp_1 _399_ (.CLK(clknet_2_0__leaf_clk),
    .D(net75),
    .Q(net27));
 sky130_fd_sc_hd__dfxtp_1 _400_ (.CLK(clknet_2_0__leaf_clk),
    .D(net79),
    .Q(net28));
 sky130_fd_sc_hd__dfxtp_1 _401_ (.CLK(clknet_2_0__leaf_clk),
    .D(net71),
    .Q(net29));
 sky130_fd_sc_hd__dfxtp_1 _402_ (.CLK(clknet_2_3__leaf_clk),
    .D(net11),
    .Q(\adapter.i2cs.scl_i_filter[0] ));
 sky130_fd_sc_hd__dfxtp_1 _403_ (.CLK(clknet_2_3__leaf_clk),
    .D(net62),
    .Q(\adapter.i2cs.scl_i_filter[1] ));
 sky130_fd_sc_hd__dfxtp_1 _404_ (.CLK(clknet_2_3__leaf_clk),
    .D(net63),
    .Q(\adapter.i2cs.scl_i_filter[2] ));
 sky130_fd_sc_hd__dfxtp_1 _405_ (.CLK(clknet_2_3__leaf_clk),
    .D(net65),
    .Q(\adapter.i2cs.scl_i_filter[3] ));
 sky130_fd_sc_hd__dfxtp_1 _406_ (.CLK(clknet_2_2__leaf_clk),
    .D(net12),
    .Q(\adapter.i2cs.sda_i_filter[0] ));
 sky130_fd_sc_hd__dfxtp_1 _407_ (.CLK(clknet_2_3__leaf_clk),
    .D(net61),
    .Q(\adapter.i2cs.sda_i_filter[1] ));
 sky130_fd_sc_hd__dfxtp_1 _408_ (.CLK(clknet_2_3__leaf_clk),
    .D(net64),
    .Q(\adapter.i2cs.sda_i_filter[2] ));
 sky130_fd_sc_hd__dfxtp_1 _409_ (.CLK(clknet_2_3__leaf_clk),
    .D(net66),
    .Q(\adapter.i2cs.sda_i_filter[3] ));
 sky130_fd_sc_hd__dfxtp_2 _410_ (.CLK(clknet_2_3__leaf_clk),
    .D(_033_),
    .Q(\adapter.i2cs.scl_i_reg ));
 sky130_fd_sc_hd__dfxtp_2 _411_ (.CLK(clknet_2_3__leaf_clk),
    .D(_034_),
    .Q(\adapter.i2cs.sda_i_reg ));
 sky130_fd_sc_hd__dfxtp_1 _412_ (.CLK(clknet_2_1__leaf_clk),
    .D(_035_),
    .Q(\adapter.i2cs.scl_o_reg ));
 sky130_fd_sc_hd__dfxtp_1 _413_ (.CLK(clknet_2_1__leaf_clk),
    .D(_036_),
    .Q(\adapter.i2cs.sda_o_reg ));
 sky130_fd_sc_hd__dfxtp_1 _414_ (.CLK(clknet_2_3__leaf_clk),
    .D(net69),
    .Q(\adapter.i2cs.last_scl_i_reg ));
 sky130_fd_sc_hd__dfxtp_1 _415_ (.CLK(clknet_2_3__leaf_clk),
    .D(net68),
    .Q(\adapter.i2cs.last_sda_i_reg ));
 sky130_fd_sc_hd__dfxtp_1 _416_ (.CLK(clknet_2_3__leaf_clk),
    .D(_037_),
    .Q(\adapter.i2cs.m_axis_data_tvalid_reg ));
 sky130_fd_sc_hd__dfxtp_1 _417_ (.CLK(clknet_2_2__leaf_clk),
    .D(_038_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_1 _418_ (.CLK(clknet_2_3__leaf_clk),
    .D(_039_),
    .Q(net14));
 sky130_fd_sc_hd__dfxtp_1 _419_ (.CLK(clknet_2_2__leaf_clk),
    .D(_040_),
    .Q(net15));
 sky130_fd_sc_hd__dfxtp_1 _420_ (.CLK(clknet_2_2__leaf_clk),
    .D(_041_),
    .Q(net16));
 sky130_fd_sc_hd__dfxtp_1 _421_ (.CLK(clknet_2_2__leaf_clk),
    .D(_042_),
    .Q(net17));
 sky130_fd_sc_hd__dfxtp_1 _422_ (.CLK(clknet_2_3__leaf_clk),
    .D(_043_),
    .Q(\adapter.i2cs.busy_reg ));
 sky130_fd_sc_hd__buf_2 _423_ (.A(clknet_2_2__leaf_clk),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_1 _424_ (.A(net39),
    .X(net20));
 sky130_fd_sc_hd__buf_2 _425_ (.A(net41),
    .X(uio_oe[0]));
 sky130_fd_sc_hd__buf_2 _426_ (.A(net42),
    .X(uio_oe[1]));
 sky130_fd_sc_hd__buf_2 _427_ (.A(net43),
    .X(uio_oe[4]));
 sky130_fd_sc_hd__buf_2 _428_ (.A(net44),
    .X(uio_oe[5]));
 sky130_fd_sc_hd__buf_2 _429_ (.A(net45),
    .X(uio_oe[6]));
 sky130_fd_sc_hd__buf_2 _430_ (.A(net46),
    .X(uio_oe[7]));
 sky130_fd_sc_hd__buf_2 _431_ (.A(net47),
    .X(uio_out[0]));
 sky130_fd_sc_hd__buf_2 _432_ (.A(net48),
    .X(uio_out[1]));
 sky130_fd_sc_hd__clkbuf_1 _433_ (.A(\adapter.i2cs.scl_o_reg ),
    .X(net33));
 sky130_fd_sc_hd__clkbuf_1 _434_ (.A(\adapter.i2cs.sda_o_reg ),
    .X(net34));
 sky130_fd_sc_hd__buf_2 _435_ (.A(net49),
    .X(uio_out[4]));
 sky130_fd_sc_hd__buf_2 _436_ (.A(net50),
    .X(uio_out[5]));
 sky130_fd_sc_hd__buf_2 _437_ (.A(net51),
    .X(uio_out[6]));
 sky130_fd_sc_hd__buf_2 _438_ (.A(net52),
    .X(uio_out[7]));
 sky130_fd_sc_hd__buf_2 _439_ (.A(net53),
    .X(uo_out[0]));
 sky130_fd_sc_hd__buf_2 _440_ (.A(net54),
    .X(uo_out[1]));
 sky130_fd_sc_hd__buf_2 _441_ (.A(net55),
    .X(uo_out[2]));
 sky130_fd_sc_hd__buf_2 _442_ (.A(net56),
    .X(uo_out[3]));
 sky130_fd_sc_hd__buf_2 _443_ (.A(net57),
    .X(uo_out[4]));
 sky130_fd_sc_hd__buf_2 _444_ (.A(net58),
    .X(uo_out[5]));
 sky130_fd_sc_hd__buf_2 _445_ (.A(net59),
    .X(uo_out[6]));
 sky130_fd_sc_hd__buf_2 _446_ (.A(net60),
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
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_19 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_20 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_21 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_22 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_85 ();
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
 sky130_fd_sc_hd__clkbuf_4 input9 (.A(PREADY),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(rst_n),
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
 sky130_fd_sc_hd__buf_2 fanout35 (.A(\adapter.i2cs.state_reg[0] ),
    .X(net35));
 sky130_fd_sc_hd__buf_2 fanout36 (.A(\adapter.i2cs.state_reg[2] ),
    .X(net36));
 sky130_fd_sc_hd__buf_2 fanout37 (.A(\adapter.i2cs.state_reg[1] ),
    .X(net37));
 sky130_fd_sc_hd__buf_2 fanout38 (.A(net40),
    .X(net38));
 sky130_fd_sc_hd__dlymetal6s2s_1 fanout39 (.A(net40),
    .X(net39));
 sky130_fd_sc_hd__buf_2 fanout40 (.A(net10),
    .X(net40));
 sky130_fd_sc_hd__conb_1 _425__41 (.LO(net41));
 sky130_fd_sc_hd__conb_1 _426__42 (.LO(net42));
 sky130_fd_sc_hd__conb_1 _427__43 (.LO(net43));
 sky130_fd_sc_hd__conb_1 _428__44 (.LO(net44));
 sky130_fd_sc_hd__conb_1 _429__45 (.LO(net45));
 sky130_fd_sc_hd__conb_1 _430__46 (.LO(net46));
 sky130_fd_sc_hd__conb_1 _431__47 (.LO(net47));
 sky130_fd_sc_hd__conb_1 _432__48 (.LO(net48));
 sky130_fd_sc_hd__conb_1 _435__49 (.LO(net49));
 sky130_fd_sc_hd__conb_1 _436__50 (.LO(net50));
 sky130_fd_sc_hd__conb_1 _437__51 (.LO(net51));
 sky130_fd_sc_hd__conb_1 _438__52 (.LO(net52));
 sky130_fd_sc_hd__conb_1 _439__53 (.LO(net53));
 sky130_fd_sc_hd__conb_1 _440__54 (.LO(net54));
 sky130_fd_sc_hd__conb_1 _441__55 (.LO(net55));
 sky130_fd_sc_hd__conb_1 _442__56 (.LO(net56));
 sky130_fd_sc_hd__conb_1 _443__57 (.LO(net57));
 sky130_fd_sc_hd__conb_1 _444__58 (.LO(net58));
 sky130_fd_sc_hd__conb_1 _445__59 (.LO(net59));
 sky130_fd_sc_hd__conb_1 _446__60 (.LO(net60));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(\adapter.i2cs.sda_i_filter[0] ),
    .X(net61));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(\adapter.i2cs.scl_i_filter[0] ),
    .X(net62));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\adapter.i2cs.scl_i_filter[1] ),
    .X(net63));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\adapter.i2cs.sda_i_filter[1] ),
    .X(net64));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(\adapter.i2cs.scl_i_filter[2] ),
    .X(net65));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(\adapter.i2cs.sda_i_filter[2] ),
    .X(net66));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(\adapter.i2cs.busy_reg ),
    .X(net67));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(\adapter.i2cs.sda_i_reg ),
    .X(net68));
 sky130_fd_sc_hd__dlygate4sd3_1 hold9 (.A(\adapter.i2cs.scl_i_reg ),
    .X(net69));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(net29),
    .X(net70));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(_032_),
    .X(net71));
 sky130_fd_sc_hd__dlygate4sd3_1 hold12 (.A(\adapter.i2cs.scl_i_filter[3] ),
    .X(net72));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(\adapter.i2cs.sda_i_filter[3] ),
    .X(net73));
 sky130_fd_sc_hd__dlygate4sd3_1 hold14 (.A(net27),
    .X(net74));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(_030_),
    .X(net75));
 sky130_fd_sc_hd__dlygate4sd3_1 hold16 (.A(\adapter.i2cs.bit_count_reg[1] ),
    .X(net76));
 sky130_fd_sc_hd__dlygate4sd3_1 hold17 (.A(\adapter.state[1] ),
    .X(net77));
 sky130_fd_sc_hd__dlygate4sd3_1 hold18 (.A(net28),
    .X(net78));
 sky130_fd_sc_hd__dlygate4sd3_1 hold19 (.A(_031_),
    .X(net79));
 sky130_fd_sc_hd__dlygate4sd3_1 hold20 (.A(\adapter.i2cs.mode_read_reg ),
    .X(net80));
 sky130_fd_sc_hd__dlygate4sd3_1 hold21 (.A(_023_),
    .X(net81));
 sky130_fd_sc_hd__dlygate4sd3_1 hold22 (.A(\adapter.state[2] ),
    .X(net82));
 sky130_fd_sc_hd__dlygate4sd3_1 hold23 (.A(\adapter.i2cs.data_out_reg_valid_reg ),
    .X(net83));
 sky130_fd_sc_hd__dlygate4sd3_1 hold24 (.A(\adapter.i2cs.data_reg[5] ),
    .X(net84));
 sky130_fd_sc_hd__dlygate4sd3_1 hold25 (.A(\adapter.i2cs.data_reg[3] ),
    .X(net85));
 sky130_fd_sc_hd__dlygate4sd3_1 hold26 (.A(\adapter.i2cs.data_reg[4] ),
    .X(net86));
 sky130_fd_sc_hd__dlygate4sd3_1 hold27 (.A(\adapter.i2cs.data_reg[1] ),
    .X(net87));
 sky130_fd_sc_hd__dlygate4sd3_1 hold28 (.A(\adapter.i2cs.data_reg[6] ),
    .X(net88));
 sky130_fd_sc_hd__dlygate4sd3_1 hold29 (.A(\adapter.i2cs.s_axis_data_tready_reg ),
    .X(net89));
 sky130_fd_sc_hd__dlygate4sd3_1 hold30 (.A(_000_),
    .X(net90));
 sky130_fd_sc_hd__dlygate4sd3_1 hold31 (.A(\adapter.i2cs.data_reg[2] ),
    .X(net91));
 sky130_fd_sc_hd__dlygate4sd3_1 hold32 (.A(net26),
    .X(net92));
 sky130_fd_sc_hd__dlygate4sd3_1 hold33 (.A(\adapter.i2cs.data_reg[7] ),
    .X(net93));
 sky130_fd_sc_hd__dlygate4sd3_1 hold34 (.A(net25),
    .X(net94));
 sky130_fd_sc_hd__dlygate4sd3_1 hold35 (.A(net17),
    .X(net95));
 sky130_fd_sc_hd__dlygate4sd3_1 hold36 (.A(net16),
    .X(net96));
 sky130_fd_sc_hd__dlygate4sd3_1 hold37 (.A(\adapter.i2cs.bit_count_reg[3] ),
    .X(net97));
 sky130_fd_sc_hd__dlygate4sd3_1 hold38 (.A(\adapter.state[3] ),
    .X(net98));
 sky130_fd_sc_hd__dlygate4sd3_1 hold39 (.A(\adapter.i2cs.state_reg[0] ),
    .X(net99));
 sky130_fd_sc_hd__dlygate4sd3_1 hold40 (.A(net24),
    .X(net100));
 sky130_fd_sc_hd__dlygate4sd3_1 hold41 (.A(net22),
    .X(net101));
 sky130_fd_sc_hd__dlygate4sd3_1 hold42 (.A(_025_),
    .X(net102));
 sky130_fd_sc_hd__dlygate4sd3_1 hold43 (.A(\adapter.i2cs.data_reg[0] ),
    .X(net103));
 sky130_fd_sc_hd__dlygate4sd3_1 hold44 (.A(net23),
    .X(net104));
 sky130_fd_sc_hd__dlygate4sd3_1 hold45 (.A(net13),
    .X(net105));
 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(PRDATA[4]));
 sky130_fd_sc_hd__diode_2 ANTENNA_2 (.DIODE(net22));
 sky130_fd_sc_hd__diode_2 ANTENNA_3 (.DIODE(PRDATA[3]));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_10 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_139 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_162 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_192 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_234 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_272 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_279 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_297 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_306 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_334 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_146 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_167 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_177 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_185 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_194 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_264 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_289 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_1_314 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_8 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_172 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_179 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_195 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_205 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_222 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_306 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_333 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_32 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_162 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_184 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_191 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_199 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_222 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_230 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_12 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_107 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_156 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_166 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_189 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_205 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_239 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_269 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_334 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_38 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_136 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_152 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_158 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_164 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_202 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_247 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_325 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_334 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_6_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_48 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_117 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_161 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_188 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_205 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_230 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_250 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_333 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_123 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_145 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_160 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_169 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_181 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_187 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_193 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_201 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_218 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_260 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_278 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_281 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_16 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_127 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_139 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_150 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_160 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_167 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_186 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_194 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_202 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_211 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_222 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_234 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_246 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_274 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_304 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_324 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_332 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_16 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_22 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_32 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_110 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_139 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_153 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_159 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_183 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_195 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_197 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_205 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_269 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_305 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_316 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_320 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_324 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_332 ();
endmodule
