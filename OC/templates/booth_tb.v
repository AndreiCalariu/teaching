module booth_tb;
   

   wire [7:0] outbus_tb;
   reg [7:0]  inbus_tb;
   reg [15:0] product;
   reg [7:0]  product_msb;
   reg [7:0]  product_lsb;
   reg [2:0]  enable_tb;
   
   booth multiplier(
		    .inbus(inbus_tb),
		    .outbus(outbus_tb),
		    .enable(enable_tb)
		    );

   initial begin

      

      enable_tb<=3'b001;//initialize
      #1 inbus_tb<=8'b00010001;//set M on inbus
      #1 enable_tb<=3'b011;//load M
      #1 inbus_tb<=8'b00000011;//set Q on inbus
      #1 enable_tb<=3'b010;//load Q 
      #1 enable_tb<=3'b100;//run algorithm
      #5 enable_tb<=3'b101;
      #1 product_msb<=outbus_tb;
      #5 enable_tb<=3'b110;
      #1 product_lsb<=outbus_tb;
      #1 product<={product_msb,product_lsb};


      
      

      
   end

endmodule // booth_tb
