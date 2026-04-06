Package zedboard_emio_gpio is

   procedure Initialise is
   begin
      DIRM_2 := DIRM_2 or 16#FF#; -- Set bottom 8 bits to 1 via bitwise or operation.
                                  -- We do this to not set or change any other bits.
                                  -- 1 indicates output.