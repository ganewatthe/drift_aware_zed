function [sel_o, valid_o, fifo_rd_o] = state_machine(fifo_data_valid_i, fifo_rd_underflow_i)
  persistent state, state = xl_state(0, {xlUnsigned, 2, 0});
  persistent count, count = xl_state(0, {xlUnsigned, 5, 0});
  
    switch state
        case 0  % reset state
            sel_o = false;
            valid_o = false;
            fifo_rd_o = false; 
            count = 0;
            state = 1;
        case 1  % read start state
            fifo_rd_o = true;   % assert fifo read signal high
            sel_o = false;
            valid_o = false;
            count = 0;
            state = 2;
        case 2  % wait state for first value
            if fifo_rd_underflow_i == true
                fifo_rd_o = true;
                sel_o = false;
                valid_o = false;
            elseif fifo_data_valid_i == true
                fifo_rd_o = true;
                sel_o = true;
                valid_o = true;
                count = 1;
                state = 3;
            else
                fifo_rd_o = true;
                sel_o = false;
                valid_o = false;
                count = 0;
                state = 2;  % wait in state 2 till the first data is present
            end
        case 3  % count for 25 dma transfers = 64 bytes = 25*4 16bit values 
            if count < 25 
                if fifo_rd_underflow_i == true
                    fifo_rd_o = true;
                    sel_o = true;
                    valid_o = false;
                    state = 3;
                elseif fifo_data_valid_i == true
                    fifo_rd_o = true;
                    sel_o = true;
                    valid_o = true;
                    count = count + 1;
                    state = 3;
                else
                    fifo_rd_o = true;
                    sel_o = true;
                    valid_o = false;
                    state = 3;
                end
            else
                fifo_rd_o = false;
                sel_o = false;
                valid_o = false;
                count = 0;
                state = 0;
            end
        otherwise
            fifo_rd_o = false;
            sel_o = false;
            valid_o = false;
            count = 0;
            state = 0;       
    end     
  end
