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
	typedef text_sprite_t_1bit   text_sprite_t;
	typedef text_sprite_t        text_string_t [2:0];
	typedef text_string_t [15:0] text_string_colrd_t; // Coloured text string (white - 'hFFFFFF)
	
	// 8*8 font maps taken from https://github.com/dhepper/font8x8/blob/master/font8x8_basic.h
	localparam text_string_t txt_GO = '{
		'{'h3C, 'h66, 'h03, 'h03, 'h73, 'h66, 'h7C, 'h00}, // G
		'{'h1C, 'h36, 'h63, 'h63, 'h63, 'h36, 'h1C, 'h00}, // O
		'{8{'h00}}                                         // (space)
	};
	
	localparam text_string_t txt_ERS = '{
		'{'h7F, 'h46, 'h16, 'h1E, 'h16, 'h46, 'h7F, 'h00}, // E
		'{'h3F, 'h66, 'h66, 'h3E, 'h36, 'h66, 'h67, 'h00}, // R
		'{'h1E, 'h33, 'h07, 'h0E, 'h38, 'h33, 'h1E, 'h00}  // S
	};

	parameter DIM_8CHAR_ROW   = 1;
	parameter DIM_8CHAR_COL   = 2;
	parameter DIM_8CHAR_CHARS = 3;

	function text_string_t populate_string_from_ascii;
		logic text_sprite_t_1bit colored_char;
		input logic [7:0][3:0] h_ascii;
		ref text_string_colrd_t o_string;
		
		case (h_ascii)
			'h474F20: begin // "GO "
				for(int i = 0; i < $size(o_string, DIM_8CHAR_CHARS); i++) begin
					for(int j = 0; j < $size(o_string, DIM_8CHAR_COL); j++) begin
						for(int h = 0; h < $size(o_string, DIM_8CHAR_ROW); h++) begin
							o_string[i][j][h] = txt_GO[i][j][h] ? 'hFFFFFF : 16'b0; 
						end
					end
				end
			end
			'h455253: begin // "ERS"
				for(int i = 0; i < $size(o_string, DIM_8CHAR_CHARS); i++) begin
					for(int j = 0; j < $size(o_string, DIM_8CHAR_COL); j++) begin
						for(int h = 0; h < $size(o_string, DIM_8CHAR_ROW); h++) begin
							o_string[i][j][h] = txt_ERS[i][j][h] ? 'hFFFFFF : 16'b0; 
						end
					end
				end
			end
		endcase
	endfunction
endpackage
