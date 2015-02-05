-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"
-- CREATED		"Wed Feb 04 14:43:40 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY lab2 IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reg_write :  IN  STD_LOGIC;
		label_write :  IN  STD_LOGIC;
		label_read :  IN  STD_LOGIC;
		rd :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		rs1 :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		rs2 :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		write_data :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		regA_o :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		regB_o :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END lab2;

ARCHITECTURE bdf_type OF lab2 IS 

COMPONENT register_file
	PORT(clk : IN STD_LOGIC;
		 reg_write : IN STD_LOGIC;
		 label_write : IN STD_LOGIC;
		 label_read : IN STD_LOGIC;
		 rd : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 rs1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 rs2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 write_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 regA_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 regB_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : register_file
PORT MAP(clk => clk,
		 reg_write => reg_write,
		 label_write => label_write,
		 label_read => label_read,
		 rd => rd,
		 rs1 => rs1,
		 rs2 => rs2,
		 write_data => write_data,
		 regA_o => regA_o,
		 regB_o => regB_o);


END bdf_type;