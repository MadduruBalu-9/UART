class test extends uvm_test;
`uvm_component_utils(test)
 
function new(input string inst = "test", uvm_component c);
super.new(inst,c);
endfunction

env e;
rand_baud rb;

  
  
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
   e       = env::type_id::create("env",this);
   rb      = rand_baud::type_id::create("rb");
  
  
endfunction
 
virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
rb.start(e.a.seqr);
#20;
phase.drop_objection(this);
endtask

endclass
