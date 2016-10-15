// BCDtoSSeg_TB.v
`timescale 1ns/1ps
`define SIMULATION

module Sensor_TB;
parameter tck              = 10;       // clock period in ns
parameter clk_freq = 1000000000 / tck; // Frequenzy in HZ

	reg 	reset; //entrada
	reg 	clk; //entrada
	reg	Sensor;

	Sensor s1(clk,Sensor);
	/* Clocking device */
	initial         clk <= 0;
	always #(tck/2) clk <= ~clk;


	initial begin: TEST_WAVE
		$dumpfile("Sensor_TB.vcd");
		$dumpvars(-1, s1);
	
	#0  reset <= 1;
	#1 Sensor <= 0;
	#40 reset <= 0;

	#1 Sensor <= 1;
	#100 Sensor <= 0;


	#(tck*20000) $finish; //tiempo simulación

	end
endmodule
