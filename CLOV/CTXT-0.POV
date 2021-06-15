

#include "colors.inc"  
#include "shapes.inc"  
#include "textures.inc"
#include "stones.inc"

camera 
   {
   location  <0, 0, -3.1>
   direction <0.0, 0.0, 1.5>       //  "wide-angle" view
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

light_source {<10, 10,  -20> color White}
light_source {<10, 100, -20> color White}





#declare mask = height_field 
   {
   gif "bit.gif" 
// water_level 0.4
   pigment
      {
      gradient <0, 1, 0>
      colour_map 
         {
         [0.0 1.01 colour Yellow colour Green]
         }
      }
   }

#declare t1 = intersection /*union*/
   {
   box {<0, -.1, 0.001> <1, 0, .999> pigment {White}}
   object {mask scale <1, 50, 1> translate <0, -2, 0> inverse}
   pigment {Green}
   }

declare t2 = difference
   {
   box {<0, -.1, 0> <1, 0, 1>}
   t1
   pigment {CadetBlue}
   }


//#declare origin = 


//object
//   {
//   t1
//   scale <2, 5, 1>
//   rotate <-30, 0, 0>
//   translate <-1, -.5, 0>
//   }

object
   {
// mask
   t1
   scale <2, 1, 1>
   translate <-1, -.5, 0>
   rotate <-30, 0, 0>
   }


