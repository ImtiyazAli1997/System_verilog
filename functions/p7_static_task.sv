module   tb;
  int k1,k2,k3;
 
 initial begin
    run(5,k1);
	//#1 run (7,k3);	//this starts at time=3 as the above run task is havinga  delay of 2units
  end
  
  
  initial begin
    #1 run (10,k2);	//this starts at time=1
  end
  
  
  task   run (input [3:0] arg,output int out);
  //task  automatic run (input [3:0] arg,output int out);			// to solve the different call 
    $display("[task run] Start of task input arg=%0d at time=%0t ",arg,$time);
    #2 
	out=5+arg;
    $display("[task run] End of task out out=%0d arg=%0d at time=%0t ",out,arg,$time);
  endtask
  
  
  
  
endmodule

/*
If you call a task run a second time while the first one is still waiting [bcz of delay], 
the second call will overwrite the arguments 

To avoid this we use automatic in task declaration so that 
each call is assigned a different memory for variable storage of respective call.


The keyword automatic will make the task reentrant,
otherwise it will be static by default. All items inside automatic
tasks are allocated dynamically for each invocation and not
shared between invocations of the same task running
concurrently. Note that automatic task items cannot be
accessed by hierarchical references.


functions tasks inside the class are automatic by default
functions tasks inside the module are static by default
->use automatic keyword explicitly to declare a task as automatic
->
 
*/