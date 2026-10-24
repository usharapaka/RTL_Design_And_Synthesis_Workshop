module battery_safety_controller (alert,
    battery_present,
    clk,
    damage_detected,
    isolate,
    reset,
    safe,
    temp_fault,
    voltage_fault,
    warning,
    VPWR,
    VGND);
 output alert;
 input battery_present;
 input clk;
 input damage_detected;
 output isolate;
 input reset;
 output safe;
 input temp_fault;
 input voltage_fault;
 output warning;
 input VPWR;
 input VGND;

 sky130_fd_sc_hd__o31a_1 _39_ (.A1(net5),
    .A2(net4),
    .A3(net2),
    .B1(net1),
    .X(_16_));
 sky130_fd_sc_hd__or3b_4 _40_ (.A(\state[0] ),
    .B(net6),
    .C_N(_16_),
    .X(_17_));
 sky130_fd_sc_hd__inv_2 _41_ (.A(_17_),
    .Y(_18_));
 sky130_fd_sc_hd__inv_2 _42_ (.A(\fault_count[2] ),
    .Y(_19_));
 sky130_fd_sc_hd__inv_2 _43_ (.A(\fault_count[1] ),
    .Y(_20_));
 sky130_fd_sc_hd__inv_2 _44_ (.A(\fault_count[0] ),
    .Y(_21_));
 sky130_fd_sc_hd__or2_2 _45_ (.A(_20_),
    .B(_21_),
    .X(_22_));
 sky130_fd_sc_hd__or2_1 _46_ (.A(_19_),
    .B(_22_),
    .X(_23_));
 sky130_fd_sc_hd__inv_2 _47_ (.A(_23_),
    .Y(_24_));
 sky130_fd_sc_hd__inv_2 _48_ (.A(\fault_count[3] ),
    .Y(_25_));
 sky130_fd_sc_hd__o22a_1 _49_ (.A1(\fault_count[3] ),
    .A2(_24_),
    .B1(_25_),
    .B2(_23_),
    .X(_26_));
 sky130_fd_sc_hd__inv_2 _50_ (.A(_22_),
    .Y(_27_));
 sky130_fd_sc_hd__o31a_1 _51_ (.A1(\fault_count[3] ),
    .A2(\fault_count[2] ),
    .A3(_27_),
    .B1(\state[1] ),
    .X(_28_));
 sky130_fd_sc_hd__o21a_1 _52_ (.A1(net6),
    .A2(_28_),
    .B1(_16_),
    .X(_03_));
 sky130_fd_sc_hd__nor3_4 _53_ (.A(\state[2] ),
    .B(\state[0] ),
    .C(net6),
    .Y(net9));
 sky130_fd_sc_hd__and2b_1 _54_ (.A_N(\state[1] ),
    .B(net9),
    .X(_29_));
 sky130_fd_sc_hd__or2_2 _55_ (.A(_03_),
    .B(_29_),
    .X(_30_));
 sky130_fd_sc_hd__inv_2 _56_ (.A(_30_),
    .Y(_31_));
 sky130_fd_sc_hd__a32o_1 _57_ (.A1(_18_),
    .A2(_26_),
    .A3(_31_),
    .B1(\fault_count[3] ),
    .B2(_30_),
    .X(_15_));
 sky130_fd_sc_hd__inv_2 _58_ (.A(net3),
    .Y(_32_));
 sky130_fd_sc_hd__clkbuf_2 _59_ (.A(_32_),
    .X(_10_));
 sky130_fd_sc_hd__a211o_1 _60_ (.A1(_19_),
    .A2(_22_),
    .B1(_24_),
    .C1(_17_),
    .X(_33_));
 sky130_fd_sc_hd__o22ai_1 _61_ (.A1(_19_),
    .A2(_31_),
    .B1(_30_),
    .B2(_33_),
    .Y(_14_));
 sky130_fd_sc_hd__clkbuf_1 _62_ (.A(_10_),
    .X(_09_));
 sky130_fd_sc_hd__a211o_1 _63_ (.A1(_20_),
    .A2(_21_),
    .B1(_27_),
    .C1(_17_),
    .X(_34_));
 sky130_fd_sc_hd__o22ai_1 _64_ (.A1(_20_),
    .A2(_31_),
    .B1(_30_),
    .B2(_34_),
    .Y(_13_));
 sky130_fd_sc_hd__clkbuf_1 _65_ (.A(_10_),
    .X(_08_));
 sky130_fd_sc_hd__nor2_1 _66_ (.A(\fault_count[0] ),
    .B(_17_),
    .Y(_35_));
 sky130_fd_sc_hd__o22a_1 _67_ (.A1(_30_),
    .A2(_35_),
    .B1(\fault_count[0] ),
    .B2(_31_),
    .X(_12_));
 sky130_fd_sc_hd__clkbuf_1 _68_ (.A(_10_),
    .X(_07_));
 sky130_fd_sc_hd__clkbuf_1 _69_ (.A(_10_),
    .X(_06_));
 sky130_fd_sc_hd__clkbuf_1 _70_ (.A(_32_),
    .X(_05_));
 sky130_fd_sc_hd__clkbuf_1 _71_ (.A(_32_),
    .X(_04_));
 sky130_fd_sc_hd__o31a_1 _72_ (.A1(\fault_count[3] ),
    .A2(\fault_count[2] ),
    .A3(\fault_count[1] ),
    .B1(\state[2] ),
    .X(_36_));
 sky130_fd_sc_hd__a41o_1 _73_ (.A1(_25_),
    .A2(_19_),
    .A3(_22_),
    .A4(\state[1] ),
    .B1(_36_),
    .X(_37_));
 sky130_fd_sc_hd__and2_1 _74_ (.A(_16_),
    .B(_37_),
    .X(_01_));
 sky130_fd_sc_hd__and4_1 _75_ (.A(_25_),
    .B(_19_),
    .C(_20_),
    .D(\state[2] ),
    .X(_38_));
 sky130_fd_sc_hd__o21a_1 _76_ (.A1(\state[0] ),
    .A2(_38_),
    .B1(_16_),
    .X(_02_));
 sky130_fd_sc_hd__nor2_1 _77_ (.A(_16_),
    .B(_29_),
    .Y(_00_));
 sky130_fd_sc_hd__nor2_1 _78_ (.A(\state[1] ),
    .B(net6),
    .Y(net8));
 sky130_fd_sc_hd__clkbuf_1 _79_ (.A(_32_),
    .X(_11_));
 sky130_fd_sc_hd__clkbuf_1 _80_ (.A(net6),
    .X(net7));
 sky130_fd_sc_hd__dfstp_1 _81_ (.D(_00_),
    .Q(\state[0] ),
    .SET_B(_04_),
    .CLK(clknet_1_1_0_clk));
 sky130_fd_sc_hd__dfrtp_1 _82_ (.D(_01_),
    .Q(\state[1] ),
    .RESET_B(_05_),
    .CLK(clknet_1_1_0_clk));
 sky130_fd_sc_hd__dfrtp_4 _83_ (.D(_02_),
    .Q(\state[2] ),
    .RESET_B(_06_),
    .CLK(clknet_1_0_0_clk));
 sky130_fd_sc_hd__dfrtp_2 _84_ (.D(_03_),
    .Q(net6),
    .RESET_B(_07_),
    .CLK(clknet_1_0_0_clk));
 sky130_fd_sc_hd__dfrtp_1 _85_ (.D(_12_),
    .Q(\fault_count[0] ),
    .RESET_B(_08_),
    .CLK(clknet_1_0_0_clk));
 sky130_fd_sc_hd__dfrtp_1 _86_ (.D(_13_),
    .Q(\fault_count[1] ),
    .RESET_B(_09_),
    .CLK(clknet_1_0_0_clk));
 sky130_fd_sc_hd__dfrtp_1 _87_ (.D(_14_),
    .Q(\fault_count[2] ),
    .RESET_B(_10_),
    .CLK(clknet_1_1_0_clk));
 sky130_fd_sc_hd__dfrtp_4 _88_ (.D(_15_),
    .Q(\fault_count[3] ),
    .RESET_B(_11_),
    .CLK(clknet_1_1_0_clk));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_43 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(battery_present),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(damage_detected),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(reset),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(temp_fault),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(voltage_fault),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_2 output6 (.A(net6),
    .X(alert));
 sky130_fd_sc_hd__clkbuf_2 output7 (.A(net7),
    .X(isolate));
 sky130_fd_sc_hd__clkbuf_2 output8 (.A(net8),
    .X(safe));
 sky130_fd_sc_hd__clkbuf_2 output9 (.A(net9),
    .X(warning));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_1_0_0_clk (.A(clknet_0_clk),
    .X(clknet_1_0_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_1_1_0_clk (.A(clknet_0_clk),
    .X(clknet_1_1_0_clk));
endmodule
