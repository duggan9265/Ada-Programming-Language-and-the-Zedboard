-- Package to control the EMIO GPIO Bank 2 of the Zedboard.
-- We are only able to control 8 LEDs.
-- As this is memory mapping, we use address binding via representation clauses
-- (as opposed to Access types).
-- Access Types, essentially pointers, are typically only utilised when the
-- address is dynamic (not known at compile time).

-- I extensively use comments as I am learning as I go!
-- I intentionally qualify everything to understand which function is apart
-- of which package.

with System; -- A top-level Ada package
with System.Storage_Elements; -- A child package of Storage.
with Interfaces; --defines types with exact sizes

package zedboard_emio_gpio is

   procedure Initialise;
   procedure Set_LEDs (Value : Interfaces.Unsigned_8);

private
   -- The following is all private to hide the Hardware details.

   -- Declare the GPIO Control register base address.
   -- To_Address is a type conversion as
   -- "Address" is a particular type and we have
   -- a hex literal that has to be converted.
   -- We use constant as the values are fixed by Hardware.
   GPIO_Control_Reg_Base : constant System.Address :=
     System.Storage_Elements.To_Address (16#E000_A000#);

   Data_2_Addr : constant System.Address :=
     GPIO_Control_Reg_Base + System.Storage_Elements.Storage_Offset (16#48#);
   DIRM_2_Addr : constant System.Address :=
     GPIO_Control_Reg_Base + System.Storage_Elements.Storage_Offset (16#284#);
   OEN_2_Addr  : constant System.Address :=
     GPIO_Control_Reg_Base + System.Storage_Elements.Storage_Offset (16#288#);

   -- Now the representation clauses:

   Data_2 : Interfaces.Unsigned_32;
   for Data_2'Address use Data_2_Addr;
   pragma Volatile (Data_2); -- Need this according to chat gpt
   -- suppress any optimizations that would interfere
   --  with the correct reading of the volatile variables.
   DIRM_2 : Interfaces.Unsigned_32;
   for DIRM_2'Address use DIRM_2_Addr;
   pragma Volatile (DIRM_2);

   OEN_2 : Interfaces.Unsigned_32;
   for OEN_2'Address use OEN_2_Addr;
   pragma Volatile (OEN_2);

end zedboard_emio_gpio;
