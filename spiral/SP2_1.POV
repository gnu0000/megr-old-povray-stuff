#include "colors.inc"

camera 
   {
   location  <0, 0, -3>
   direction <0, 0, 1>
   look_at   <0, 0, 0>
   }

plane 
   {
   z, 2
   texture
      {
      pigment {color White}
      finish {ambient 1}
      }
   }

cylinder
   {
   <0, 0, -6> <0, 0, 6> 1 open

   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 1
         color_map
            {
            [ 0    Clear]
            [.005  Blue]
            [.210  Blue]
            [.2101 Clear]
            }
         ramp_wave
         }
      }
   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 1
         color_map
            {
            [ 0    Clear]
            [.005  Orange]
            [.210  Orange]
            [.2101 Clear]
            }
         ramp_wave
         translate z*.5
         }
      }
   scale <.1, 1.3, .3>
   rotate y*90;
   }


