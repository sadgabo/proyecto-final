`timescale 1ns/1ns

module SignExtend(
    input [15:0]SignIn,
    output reg[31:0]SignOut
);

always @*
begin
    if(SignIn[15])
        SignOut={16'd1,SignIn};
    else
        SignOut={16'd0,SignIn};
end
endmodule
