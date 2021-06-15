
#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"

light_source {<-31, 11, -90> color Gray90}
light_source {< 31, 12, -20> color White}

camera
   {
   location  <0, 0, -5>
   direction <0, 0, 1>
   look_at   <0,    0,   0>
   }

plane
   {
   z, 100
   texture 
      {
      pigment {color Black}
      }
   }

box   // the green base plate
   {
   <-3, -1, 0>, <2.2, 1, .1>
   texture
      {
      Stone18
      finish { reflection 0.18 }
      }
   }

box   // the sign
   {
   <-.7, -.7, -.1>, <.7, .7, .1>
   texture
      {
      Gold_Texture
      pigment {color Orange}
      }
   rotate <0, 0, 45>
   translate <-1.95, 0, 0>
   }


