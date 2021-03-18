
module fillarray();
parameter initial_state = 12'b0000_0000_0000;
parameter task1_init = 12'b0000_0000_0001;
parameter task1_increment = 12'b0000_0000_0010;
parameter task1_increment_interm = 12'b0000_0000_0011;
parameter task1_done = 12'b0000_0000_0100;
parameter task1_write1 = 12'b0000_0001_0100;
parameter task1_write2 =12'b0000_0001_0101;

always_ff @(posedge CLOCK_50, posedge reset) begin
	if (reset) begin
		state <= initial_state;
		i <= 8'b0;
	end 
	else begin
		case (state)
			initial_state: begin
				LED[9:0] <= 10'b0;
				state <= task1_init;
			end 
			
			task1_init: begin 
				i <= 8'b0;
				state <= task1_write1;
				wren <= 1'b0;
			end 
            task1_write1: begin
                state <= task1_write2;
                address <= i[7:0];
				data <= i[7:0];
            end
            task1_write2: begin
                state <= task1_increment;
                wren <= 1'b1;
            end 
			
			task1_increment: begin
                wren <= 1'b0;
				i <=  i + 8'd1;
				LED[9:0] <= 10'b1111_0000_00;
				if (i == 8'd255) begin
					state <= task1_done;
				end
				else begin state <= task1_increment_interm;
				end
				end
				
				task1_increment_interm: state<= task1_write1;
				task1_done: begin state <= task2_init;
            
										wren <= 1'b0;
										LED[9:0] <= 10'b1111_0000_00;
							end