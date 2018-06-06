
module circuit_tb;

	reg       [3:0]   inbus;      //input data
    reg               le;             //latch-enable
    reg               lt;             //lamp-test->displays 8
    reg               bl;             //blanking-> blank
    wire   [7:0]   outbus;

    segments_decoder segments_dec(
    	.inbus (inbus),
    	.le    (le),
    	.lt    (lt),
    	.bl    (bl),
    	.outbus(outbus)
    	);

    initial begin
        
        //Lamp Test
        le<=1'b0;//latch is transparent
        bl<=1'b1;//blanking is disabled
        inbus<=4'b0000;//0 on inbus
        lt<=1'b0;//lamp test enabled
        #25
        

        #50
        //Blanking Test
        le<=1'b0;//latch is transparent
        bl<=1'b0;//blanking is enabled
		inbus<=4'b0000;//0 on inbus
        lt<=1'b1;//lamp test disabled
        #25
                

        #50
        //test all values
        le<=1'b0;//latch is transparent
        bl<=1'b1;//blanking is disabled
        lt<=1'b1; //lamp test is disabled
        
        #25
        inbus<=4'b0000;
        #25
        
		
		#25
        inbus<=4'b0001;
        #25
        

		#25
        inbus<=4'b0010;
        #25
        

        #25
        inbus<=4'b0011;
        #25
        

        #25
        inbus<=4'b0100;
        #25
        

        #25
        inbus<=4'b0101;
        #25
        

        #25
        inbus<=4'b0110;
        #25
        

        #25
        inbus<=4'b0111;
        #25
        

        #25
        inbus<=4'b1000;
        #25
        
        inbus<=4'b1001;
        


    end // initial



endmodule // circuit_tb
