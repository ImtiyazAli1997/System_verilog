module tb;

	string str1,str2;


	initial begin
		str1 = "Lucid VLSI" ;
		$display("str1=%s",str1);
		$display("str1=%s", str1[0] ); //L
		$display("length=%0d",str1.len); //10
		$display("getc=%s",str1.getc(1)); //str1[1]
	  
		str2=str1;//Copy
		
		$display("str2=%s",str2);
	  
		if (str1 == str2)
			$display ("str1 Matched str2");                                  
		else 
			$display("str1 Not matched str2");
	  
		
		if (str1[0] == "L")
			$display ("str1 Matched L");                                  
		else 
			$display("str1 Not matched L");
	  
		if (str1 == "Lucid VLSI")
			$display ("str1 Matched Lucid VLSI");                                  
		else 
			$display("str1 Not matched Lucid VLSI");
	  
		//if Return value = 0 then it indicates str1 is equal to str2
	  
		if(! str1.compare(str2)) 
			$display ("str1 Matched str2");                                  
		else 
			$display("str1 Not matched str2");
	  
		str2="LUCID VLSI";
	  
		if(! str1.icompare(str2)) 
			$display ("str1 Matched str2");                                 
		else 
			$display("str1 Not matched str2");
	  
		str2=str1.substr(6,9);
		$display("substring str2=%s",str2);
	  
		str2=str2.tolower();
		$display("tolower   str2=%s",str2);
	  
		str2=str2.toupper();
		$display("toupper   str2=%s",str2);
	end
  
endmodule
//str.compare return values are as follows"
//if Return value = 0 then it indicates str1 is equal to str2
//if Return value < 0 then it indicates str1 is less than str2.
//if Return value > 0 then it indicates str2 is less than str1.