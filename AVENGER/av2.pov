#include "colors.inc"  
#include "shapes.inc"  
#include "shapes2.inc"  
#include "textures.inc"
#include "stones1.inc"

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

camera 
   {
   location  <0,   5,   -6>
   direction <0.0, 0.0, 1.2>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

light_source { <50, 80, -20.0> colour White }

torus
   {
   2, 1
   

   texture
      {
      finish {ambient 1}
      pigment 
         { 
         image_map 
            { 
            gif "AA-3.gif"  map_type 5
            }
         }
      }
   rotate <0, -clock * 360, 0>
   }

