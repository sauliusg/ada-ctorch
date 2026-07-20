package Torch.Datasets.MNIST is
   
   function Make_MNIST (Dir_Name : String;
                        Mode : Dataset_Mode := Train)
                       return Dataset;
   
   function Make_Normalised_MNIST (Dir_Name : String;
                                   X, Y : Long_Float;
                                   Mode : Dataset_Mode := Train)
                                  return Dataset;
   
   function Make_Stacked_MNIST (Dir_Name : String;
                                Mode : Dataset_Mode := Train) 
                               return Dataset;
   
   function Make_Normalised_Stacked_MNIST
     (
      Dir_Name : String;
      X, Y : Long_Float;
      Mode : Dataset_Mode := Train)
     return Dataset;
     
end;
