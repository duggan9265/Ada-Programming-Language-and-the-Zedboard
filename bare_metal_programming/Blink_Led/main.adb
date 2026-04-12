with zedboard_emio_gpio;
with Interfaces;
with Ada.Real_time; use Ada.Real_time;

procedure Main is

D : Time_Span := Ada.Real_Time.Seconds(5); -- D is of Type Time_Span, Seconds is a function.
                                           -- Nanoseconds also exists for example
Next : Time := Ada.Real_Time.Clock + D;    -- WHat is dif between clock and clock time?

begin
   zedboard_emio_gpio.Initialise;

   Delay until Next;
   Next := Next + D;
   loop
         zedboard_emio_gpio.Set_LEDs (16#AA#);
         Delay until Next;
         Next := Next + D;

         zedboard_emio_gpio.Set_LEDs (16#00#);
         Delay until Next;
         Next := Next + D;              
   end loop;
end Main;