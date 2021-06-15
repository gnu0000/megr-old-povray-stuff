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
   location  <0,   .8,  -6>
   direction <0.0, 0.0, 1.5>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

light_source { <50, 80, -20.0> colour White }

sphere
   {
   <0, 0, 0>, 1

   texture
      {
      finish {ambient .5}
      pigment {White}
      }
   texture
      {
      finish {ambient 1}
      pigment 
         { 
         image_map 
            { 
            gif "AA-3.gif"  map_type 1
            filter all .65
            }
         }
      }

   rotate <0, -clock * 360, 0>
   }



sphere
   {
   <0, 0, 0>, 100000

   texture
      {
      finish {ambient .5}
      pigment {Gray05}
      }
   texture
      {
      finish {ambient 1}
      pigment 
         { 
         image_map 
            { 
            gif "AA-3.gif"  map_type 1
            filter all .85
            }
         }
      }

   rotate <0, -clock * 360, 0>
   }



plane
   {
   z, 0
   texture
      {
      finish {ambient 1}
      pigment { image_map { gif "AA-3.gif"  } }
      scale <8, 8, 8>
      }
   rotate <90, 0, 0>
   translate <4, -3, 1.5>
   }


