classdef QCcodes < int16
   enumeration
      Bad(0)
      BadProcess(hex2dec('28'))
      Good(hex2dec('80'))
      Maintenance(hex2dec('A4'))
      Simulation (hex2dec('60'))
      Uncertain(hex2dec('68'))
      UncertainProcess(hex2dec('78'))
   end
end