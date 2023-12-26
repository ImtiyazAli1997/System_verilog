module tb;
	string str1,str2;
	
	initial begin
		str1="Justin Bieber";
		$display("str1=%s",str1);						//str1=Justin Bieber	
		$display("str1[0]=%s",str1[0]);					//str1[0]=J
		$display("str1 length =%0d",str1.len);			// str1 length =13
		$display("index 8 of str1=%s",str1.getc(8));	//index 8 of str1=   i
		str2=str1;//copying one string to other			//str2="Justin Bieber"
		
		if(!str1.compare(str2))
			$display("str1 Matched str2");				//str1 Matched str2
		else
			$display("str1 does not match str2");

		str2 = "JUSTIN Bieber";							//str2 = "JUSTIN Bieber"; str1="Justin Bieber"
		
		if(!str1.compare(str2))							//the upper case doesn't match here [case sensitive comparison]
			$display("str1 Matched str2");
		else
			$display("str1 does not match str2");		//str1 does not match str2
			
		if(!str1.icompare(str2))						//[not a case sensitive comparison]
			$display("str1 Matched str2");				//str1 does not match str2
		else
			$display("str1 does not match str2");
														//str2 = "JUSTIN Bieber"
		str2= str2.substr(3,5);//TIN
		$display("str2=%s",str2);						//str2=TIN
		
		str2= str2.tolower();//tin
		$display("str2=%s",str2);						//str2=tin
		
		str2= str1.substr(7,12);//Bieber
		$display("str2=%s",str2);						//str2=Bieber
		
		str2= str2.toupper();
		$display("str2=%s",str2);//BIEBER				//str2=BIEBER
	end
endmodule