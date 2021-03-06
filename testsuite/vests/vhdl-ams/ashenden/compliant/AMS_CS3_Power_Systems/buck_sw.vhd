
-- Copyright (C) 2002 Morgan Kaufmann Publishers, Inc

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity buck_sw is
  generic ( Vd : voltage := 0.7;       -- diode voltage
            Vramp : voltage := 2.5 );  -- p-p amplitude of ramp voltage
  port ( terminal input, output, ref, ctrl: electrical );
end entity buck_sw;

----------------------------------------------------------------

architecture average of buck_sw is

  quantity Vout across Iout through output to ref;
  quantity Vin across input to ref;
  quantity Vctrl across ctrl to ref;

begin

  Vout == Vctrl * Vin / Vramp - Vd;  -- averaged equation

end architecture average;
