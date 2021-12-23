module lab3_g23_p1(
	input logic clk,reset,en,
	input logic [7:0] psc,
	input logic yon,
	output logic tick,
	output logic [7:0] count
);



always_ff @(posedge clk)
begin
begin
if (yon == 0)
begin 
if (reset == 0)
count <= 0;
else if(en)

begin
if (count == psc)
begin
count <=0;
tick =1;
end
else 
begin

count<=count +1'b1;
tick =0;

end
end
end
end



if (yon == 1)
begin 
if (reset == 0)
count <= psc;
else if(en)

begin
if (count == 0)
begin
count <=psc;
tick =1;
end
else 
begin

count<=count - 1'b1;
tick =0;

end
end
end
end


endmodule



