class rand_baud extends uvm_sequence#(uart_seq_item);
  `uvm_object_utils(rand_baud)
  
  uart_seq_item tr;
 
  function new(string name = "rand_baud");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = uart_seq_item::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
   
        tr.rst       = 1'b0;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  
 
endclass