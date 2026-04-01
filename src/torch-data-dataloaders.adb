package body Torch.Data.Dataloaders is
   
   overriding
   procedure Finalize (L : in out Data_Loader_Type) is
   begin
      if L.Shadow_Data_Loader /= null then
         Delete_MNIST_Data_Loader_Sequential_Sampler (L.Shadow_Data_Loader);
      end if;
   end;
   
   
end;
