with Ada.Real_Time.Delays;
with zedboard_emio_gpio;
with Interfaces;

procedure Main is
begin
   zedboard_emio_gpio.Initialise;

   loop
      zedboard_emio_gpio.Set_LEDs (16#AA#);
      delay 1.0;
   end loop;
end Main;