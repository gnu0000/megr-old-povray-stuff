#include "colors.inc"  
#include "shapes.inc"  
#include "shapes2.inc"  
#include "textures.inc"
#include "stones1.inc"


light_source { <1, 5, -50.0> colour White }


camera 
   {
   location  <.5,  .8, -6>
   direction <0.0, 0.0, 1.2>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

#declare CountO=0
#while (CountO < 180)

   #declare Count=0
   #while (Count < 3.14159 * 2)
      object
         {
         sphere {<2 * sin (Count), 2 * cos(Count), 0> .25}
         texture {T_Stone18 scale <3, 3, 3>}
         rotate <0, CountO, 0>
         }
         #declare Count = Count + 3.14159/15
   #end

   #declare CountO = CountO + 20
#end

