#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"

light_source {<-31, 11, -90> color White}

camera
   {
   location  <1.5, .5, -3>
   look_at   <0.5, .5,   .5>
   }


box
   {
   <0, 0, 0> <1, 1, 1>
   texture
      {
      Dark_Green_Glass
      }
   }
