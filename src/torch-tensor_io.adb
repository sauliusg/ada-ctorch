-- A few implementation notes (by ChatGPT):
-- 
-- I deliberately use zero-based tensor indices in the output headers
-- ([0,1,2]) because PyTorch itself is zero-based.
-- 
-- The code assumes tensor dimensions are reported as sizes while
-- indexing uses 0 .. Size-1.
--
-- In a production binding I would introduce a tensor iterator in the
-- C++ layer rather than repeatedly calling Get_Int64/Get_Float64 for
-- every element. The above is architecturally clean but can become
-- expensive for large tensors because every printed element crosses
-- the Ada/C++ boundary.
--
-- If you expect tensors larger than a few thousand elements to be
-- printed routinely, it is worth adding a glue function that exports
-- an entire contiguous tensor buffer to Ada before formatting. That
-- will reduce I/O overhead dramatically.

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Long_Float_Text_IO;

with Torch; use Torch;

package body Torch.Tensor_IO is

   use Ada.Text_IO;

   procedure Put
     (Item : in Tensor;
      Fore : in Ada.Text_IO.Field := 0;
      Aft  : in Ada.Text_Io.Field := Ada.Float_Text_IO.Default_Aft;
      Exp  : in Ada.Text_Io.Field := Ada.Float_Text_IO.Default_Exp)
   is

      Shape_V : constant Int64_Array := Sizes (Item);
      Rank_V  : constant Int64_T := Dim (Item);

      subtype Index_Array is Int64_Array;

      ----------------------------------------------------------------
      -- Print scalar value
      ----------------------------------------------------------------
      procedure Print_Value (Indices : Index_Array) is
      begin
         case Category (Element_Type (Item)) is

            when Boolean_Category =>
               declare
                  V : constant Boolean :=
                    (Get_Int64 (Item, Indices) /= 0);
               begin
                  Put (Boolean'Image (V));
               end;

            when Integer_Category =>
               Ada.Integer_Text_IO.Put
                 (Integer (Get_Int64 (Item, Indices)),
                  Width => Fore);

            when Floating_Point_Category =>
               Ada.Long_Float_Text_IO.Put
                 (Get_Float64 (Item, Indices),
                  Fore => Fore,
                  Aft  => Aft,
                  Exp  => Exp);

            when Complex_Category =>
               -- Placeholder: assumes flattened representation or later complex API
               Ada.Text_IO.Put ("<complex>");

         end case;
      end Print_Value;

      ----------------------------------------------------------------
      -- 1D
      ----------------------------------------------------------------
      procedure Print_1D is
         Idx : Index_Array (1 .. 1);
      begin
         for I in 0 .. Shape_V (1) - 1 loop
            Idx (1) := I;
            Print_Value (Idx);

            if I /= Shape_V (1) - 1 then
               Put (' ');
            end if;
         end loop;

         New_Line;
      end Print_1D;

      ----------------------------------------------------------------
      -- 2D
      ----------------------------------------------------------------
      procedure Print_2D is
         Idx : Index_Array (1 .. 2);
      begin
         for Row in 0 .. Shape_V (1) - 1 loop
            Idx (1) := Row;

            for Col in 0 .. Shape_V (2) - 1 loop
               Idx (2) := Col;
               Print_Value (Idx);

               if Col /= Shape_V (2) - 1 then
                  Put (' ');
               end if;
            end loop;

            New_Line;
         end loop;
      end Print_2D;

      -------------------------------------------------------------------------
      -- Header printout
      -------------------------------------------------------------------------
      
      procedure Print_Header (Indices : Index_Array) is
      begin
         Put ("[");
         for I in Indices'Range loop
            Ada.Integer_Text_IO.Put (Integer (Indices (I)), Width => 0);
            if I /= Indices'Last then
               Put (",");
            end if;
         end loop;
         Put_Line ("]");
      end Print_Header;

      ----------------------------------------------------------------
      -- Recursive slice printer
      ----------------------------------------------------------------

      Fixed_Count : constant Int64_T :=
        (if Rank_V > 2 then Rank_V - 2 else 0);

      Fixed_Idx : Index_Array (1 .. (if Fixed_Count = 0 then 1 else Fixed_Count));
      
      procedure Print_Plane is
         Full_Idx : Index_Array (1 .. Rank_V);
      begin
         if Rank_V > 2 then
            Print_Header (Fixed_Idx);
         end if;

         for Row in 0 .. Shape_V (Rank_V - 1) - 1 loop
            for K in Fixed_Idx'Range loop
               Full_Idx (K) := Fixed_Idx (K);
            end loop;

            Full_Idx (Rank_V - 1) := Row;

            for Col in 0 .. Shape_V (Rank_V) - 1 loop
               Full_Idx (Rank_V) := Col;
               Print_Value (Full_Idx);
               if Col /= Shape_V (Rank_V) - 1 then
                  Put (' ');
               end if;
            end loop;
            New_Line;
         end loop;
      end Print_Plane;

      procedure Enumerate_Planes (Level : Int64_T) is
      begin
         if Level > Fixed_Count then
            Print_Plane;
         else
            for I in 0 .. Shape_V (Level) - 1 loop
               Fixed_Idx (Level) := I;
               Enumerate_Planes (Level + 1);
               if Fixed_Count > 0 and then I < Shape_V (Level) - 1 then
                  New_Line;
               end if;
            end loop;
         end if;
      end Enumerate_Planes;
      
   begin
      case Rank_V is
         when 0 =>
            declare
               Idx : Index_Array (1 .. 0);
            begin
               Print_Value (Idx);
               New_Line;
            end;

         when 1 =>
            Print_1D;

         when 2 =>
            Print_2D;

         when others =>
            Enumerate_Planes (1);
      end case;
   end Put;

end Torch.Tensor_IO;
