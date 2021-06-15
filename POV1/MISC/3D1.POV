#include "Colors.inc"
#include "Textures.inc"

camera 
   {
   location  <-1+@delta 5 -25>
   direction <0 0 1.2071>
   up        <0 1 0>
   right     <1 0 0>
   look_at   <0 0 0>
   }



object 
   {
   light_source 
      {
      <10 50 -20> color red 1 green 1 blue 1
      }
   }


/*--- floor ---*/
object 
   {
   plane { <0 1 0> 0 }
   texture {color Blue reflection 0.3}
   }



/*--- Object ---*/
object 
   {
   sphere { <10.0 0.0 0.0> 2 }
   texture {color Red reflection 0.4}
   rotate <0 @rot 0>
   translate <0 2 0>
   }
