module chenjie_module (
clk    , // clock signal (positive edge triggered)
reset    , // reset signal (positive edge triggered)
throttle   ,
set     ,
accel    ,
coast   ,
cancel  ,
resume  ,
brake   ,
speed   ,   // output of spped
cruise_speed    ,//output of cruise_speed
cruise_on   ////curise status
);

// Input declaration
input clk, reset, throttle, set, accel, coast, cancel, resume, brake ;
// Output declaration
output speed, cruise_speed, cruise_on;

// Output should be also declared as reg type
reg [7:0]   speed;
reg [7:0]   cruise_speed;
reg [7:0]   cached_speed;
reg cruise_on;

// Code starts here
always @(posedge clk)
begin
if (reset)
begin
    speed = 8'b0;
    cruise_speed = 8'b0;
    cruise_on = 1'b0;
end
if (throttle)
    speed = speed + 1'b1;
else
begin
    if (cruise_on)
    begin
        if (accel)
            cruise_speed = cruise_speed + 1'b1;
        if (coast && cruise_speed > 45)
            cruise_speed = cruise_speed - 1'b1;
        if (speed < cruise_speed)
            speed = speed + 1'b1;
        if (speed > cruise_speed)
            speed = speed -1'b1;
    end
    else
    begin
        if (!brake && speed > 0)
            speed = speed -1'b1;
    end
end
if (cancel)
    cruise_on = 1'b0;
if (set && speed >45)
begin
    cruise_on = 1'b1;
    cruise_speed = cached_speed;
end
if (resume && speed > 0 && cruise_speed >=45)
    cruise_on = 1'b1;
if (brake)
begin
    cruise_on = 1'b0;
    speed = speed - 2;
end
end

always @(posedge set)
begin
    if (speed > 45)
	cached_speed = speed;
end

endmodule // End
