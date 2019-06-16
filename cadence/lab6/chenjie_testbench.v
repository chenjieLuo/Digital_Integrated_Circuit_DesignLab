module chenjie_testbench();

// Input signal declaration
reg clk, reset, throttle, set, accel, coast, cancel, resume, brake ;

// Output
wire[7:0] speed;
wire[7:0] cruise_speed;
wire cruise_on;

always
begin
    #5 clk = ~clk;
end

// Code starts here
initial begin
clk = 0;
reset = 0;
throttle = 0;
set = 0;
accel = 0;
coast = 0;
cancel = 0;
resume = 0;
brake = 0;

#2 reset = 1;   //initialize output

#5 reset = 0;
throttle = 1;   //accelerate starts now to 30mph, 30*5*2 = 300 will be needed

#300 set = 1;
throttle = 0;

#10 set = 0;
#90 throttle = 1; //at this point the speed should be 20mph

#300 set = 1;
#10 set = 0;
#90 throttle = 0;   //at this point the speed should be 60mph

#150  brake = 1;
#100  brake = 0;
resume = 1;

#10 resume = 0;

#240  accel = 1;
#50  accel = 0;

#50  coast = 1;
#50 coast = 0;

#50  cancel = 1;

#10 cancel = 0;

end
chenjie_module module1(clk,reset,throttle,set,accel,coast,cancel, resume, brake, speed, cruise_speed, cruise_on);
endmodule // End
