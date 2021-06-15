
#include "colors.inc"  
#include "shapes.inc"  
#include "textures.inc"
#include "stones.inc"

camera 
   {
   location  <0, 0, -2.8>
   direction <0.0, 0.0, 1.5>       //  "wide-angle" view
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

light_source {<10, 10,  -20> color White}
light_source {<10, 100, -20> color White}





#declare mask = height_field 
   {
   gif "cloverlf.gif" 
   }

#declare words = intersection /*union*/
   {
   box {<.001, -.1, .001> <.75, 0, .48>}

   height_field 
      {
      gif "cloverlf.gif" 
      scale <1, 50, 1> 
      translate <0, -2, 0> 
//      inverse
      }
   pigment {White}
   bounded_by {box {<.001, -.1, .001> <.75, 0, .48>}}
   }

object
   {
   t1
   scale <2, 1, 1>
   translate <-1, 0, 0>
   rotate <-30, 0, 0>
   }


