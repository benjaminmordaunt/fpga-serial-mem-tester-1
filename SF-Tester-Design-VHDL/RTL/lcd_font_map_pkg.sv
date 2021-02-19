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

package lcd_font_map_pkg;
	typedef logic text_sprite_t_1bit [7:0][7:0];
	
	localparam text_sprite_t [2:0] txt_GO = '{
		'{'h3C, 'h66, 'h03, 'h03, 'h73, 'h66, 'h7C, 'h00},
		'{'h1C, 'h36, 'h63, 'h63, 'h63, 'h36, 'h1C, 'h00},
		'{8{'h00}}
	};

	// 8*8 font maps taken from https://github.com/dhepper/font8x8/blob/master/font8x8_basic.h
	function text_sprite_t map_char;
		input h_digit[3:0];
		begin
			case (h_digit)
				
			endcase
		end
	endfunction
endpackage