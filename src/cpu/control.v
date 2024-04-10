`default_nettype none
`timescale 1ns/1ns

module control(
  input wire CLK,
  input wire RESETn,

  input wire RUN,

  input wire [3:0] OPCODE,
  input wire CF,
  input wire ZF,

  output wire CLR, HLT, CE, SU,
  output wire AIn, BIn, OIn, IIn, Jn, FIn, MIn, RI,
  output wire AOn, BOn, IOn, COn, EOn, ROn, NOn,

  output wire T0
);

  // FIXME: consider latching flags to an internal register on timestep 0
  wire reset_counter;
  reg [2:0] counter;

  assign T0 = counter == 3'b0 | counter == 3'b111;
  assign reset_counter = counter == 3'd5;

  // counter increments on *falling* edge of CLK, out of phase with the rest of the machine
  always @(negedge CLK or negedge RESETn)
    begin
      if (~RESETn)
        counter <= 3'b111;
      else if (~RUN)
        counter <= 3'b111;
      else
        if (reset_counter)
          counter <= 3'b0;
        else
          counter <= counter + 1;
    end

  // uniform preamble for all instructions:
  // 0: put program counter on bus, load into address register: COn=0, MIn=0
  // 1: put memory value onto bus, load into instruction register, increment program counter: CE=1, ROn=0, IIn=0
  wire isPreamble = counter[2:1] == 2'b0 & RESETn;
  wire pCOn, pMIn, pCE, pROn, pIIn;
  assign pCOn = counter[0] ? 1'b1 : 1'b0;
  assign pMIn = counter[0] ? 1'b1 : 1'b0;
  assign pCE  = counter[0] ? 1'b1 : 1'b0;
  assign pROn = counter[0] ? 1'b0 : 1'b1;
  assign pIIn = counter[0] ? 1'b0 : 1'b1;

  // microcode for per-instruction behaviors
  wire mHLT, mCE, mSU;
  wire mAIn, mBIn, mOIn, mIIn, mJn, mFIn, mMIn, mRI;
  wire mAOn, mBOn, mIOn, mCOn, mEOn, mROn, mNOn;
  wire [2:0] mCounter;
  assign mCounter = counter - 3'b010;
  microcode mc(
    OPCODE, {CF, ZF}, mCounter[1:0],
    mHLT, mCE, mSU,
    mAIn, mBIn, mOIn, mIIn, mJn, mFIn, mMIn, mRI,
    mAOn, mBOn, mIOn, mCOn, mEOn, mROn, mNOn
  );

  assign CLR = 1'b0;
  assign HLT = isPreamble ? 1'b0 : mHLT;
  assign CE  = isPreamble ? pCE : mCE;
  assign SU  = isPreamble ? 1'b0 : mSU;
  assign AIn = isPreamble ? 1'b1 : mAIn;
  assign BIn = isPreamble ? 1'b1 : mBIn;
  assign OIn = isPreamble ? 1'b1 : mOIn;
  assign IIn = isPreamble ? pIIn : mIIn;
  assign Jn  = isPreamble ? 1'b1 : mJn;
  assign FIn = isPreamble ? 1'b1 : mFIn;
  assign MIn = isPreamble ? pMIn : mMIn;
  assign RI  = isPreamble ? 1'b0 : mRI;
  assign AOn = isPreamble ? 1'b1 : mAOn;
  assign BOn = isPreamble ? 1'b1 : mBOn;
  assign IOn = isPreamble ? 1'b1 : mIOn;
  assign COn = isPreamble ? pCOn : mCOn;
  assign EOn = isPreamble ? 1'b1 : mEOn;
  assign ROn = isPreamble ? pROn : mROn;
  assign NOn = isPreamble ? 1'b1 : mNOn;
endmodule
