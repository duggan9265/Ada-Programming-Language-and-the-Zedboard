with Interfaces; use Interfaces; -- need the use clause to use or, +, and operations etc.
                                 -- compiler gives error otherwise.

Package Body zedboard_emio_gpio is

   procedure Initialise is
   begin
      DIRM_2 := DIRM_2 or 16#FF#; -- Set bottom 8 bits to 1 via bitwise or operation.
                                  -- 1 indicates output.
                                  -- We do this to not set or change any other bits.
                                  -- We could have used the MASK_DATA_LSW also.
      
      OEN_2 := OEN_2 or 16#FF#;   -- 1 indicates output is enabled
   end Initialise;

   procedure Set_LEDs(Value : Interfaces.Unsigned_8) is
   begin
      Data_2 := (Data_2 and not 16#FF#) or Interfaces.Unsigned_32 (Value);
   end Set_LEDs;                           -- Interfaces.Unsigned_32 (Value) is a type conversion
                                           -- Converts 8-bit Value to 32 bits unsigned.


end zedboard_emio_gpio;