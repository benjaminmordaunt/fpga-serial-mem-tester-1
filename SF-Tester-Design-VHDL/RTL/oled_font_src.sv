--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (c) 2021 Benjamin Mordaunt
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--------------------------------------------------------------------------------
-- \file lcd_font_map_pkg.v
--
-- \brief A package of functions for converting between internal signal values
--        and character pixel maps for display on an OLED rgb panel
--------------------------------------------------------------------------------

import lcd_font_map_pkg::*;

// This module accepts x,y input from the coordinate decoder
module oled_font_src(clk, reset, frame_begin, x, y, pixel_data);

parameter Width = 96;
parameter Height = 64;

localparam PixelCount = Width * Height;
localparam PixelCountWidth = $clog2(PixelCount);
localparam PixelsPerCharacter = 64;

input clk, reset, frame_begin;
input [$clog2(Width-1)-1:0] x;
input [$clog2(Height-1)-1:0] y;
output [15:0] pixel_data;

reg [2:0] char_r = x[2:0];
reg [2:0] char_c = y[2:0];
reg [6:0] character_index = {y[$clog2(Width-1):3], x[$clog2(Height-1):3]}; // Screen can store 96 8x8 characters.

always @(negedge clk) begin
	if(reset)
		pixel_data <= 16'b0;
	else if(frame_begin) begin
		pixel_data <= txt_GO[character_index][char_c][char_r] ? 16'hFFFFFF : 16'b0;
	end
end

endmodule
