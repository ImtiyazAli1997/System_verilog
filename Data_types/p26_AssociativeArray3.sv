module tb;
	int fruits_10 [string];

	initial begin

		fruits_10 = '{ "apple":4,
						"orange":10,
						"plum":9,
						"guava" : 1};
	
		$display("fruits =%0p",fruits_10);
		// size() : [NOTworking]Print the number of items in the given dynamic array
		$display ("fruits l0.size() = %0d", $size(fruits_10));

		// num() : Another function to print number of items in given array
		$display ("fruits_10.num() = %0d", fruits_10.num());

		// exists() : Check if a particular key exists in this dynamic array
		if (fruits_10.exists ("orange"))
			$display ("Found %0d orange!", fruits_10["orange"]);

		if (!fruits_10.exists ("apricots"))
			$display ("Sorry, season for apricots is over ...");

		
		// Note: String indices are taken in alphabetical order
		// irst() : Get the first element in the array
		begin
			string f;
			// This function returns true if it succeeded and first key is stored
			// in the provided string
			if (fruits_10. first (f))
			$display ("fruits_le.first [%s] = %0d", f, fruits_10[f]);
		end

		//1ast() : Get the last element in the array

		begin
			string f;
			if (fruits_10.last (f))
			$display ("fruits_le.last [%s] = %0d", f, fruits_10[f]);
		end

		// prev() : Get the previous element in the array
		begin
			string f = "orange";
			if (fruits_10.prev (f))
			$display ("fruits_le.prev [%s] = %0d", f, fruits_10[f]);
		end

		// next() : Get the next item in the array
		begin
			string f = "orange";
			if (fruits_10.next (f))
			$display ("fruits_le.next [%s] = %0d", f, fruits_10[f]);
		end

	end
endmodule

