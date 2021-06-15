
#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"


// Sky
sphere 
   { <0, 0, 0>, 1
   texture 
      {
      pigment 
         {
         rgb <1, 1, 1>
         }
      finish {ambient 1 diffuse 0}
      }
   scale 1000
   }

#declare T_Tex = texture
   {
   pigment { rgb <1, 0.8, 0.6> }
   finish 
      {
      specular 0.35 roughness 0.10 // Med Dull
      }
//   finish {ambient 1 diffuse 0}
   }


#declare words = union
   {
   text 
      { 
      ttf "c:\windows\fonts\gothicb.ttf" "Craig" .5, 0
      texture {T_Tex}
      translate -x*1.2
      }
   }

object {words scale <1, 1.75, 1>}

camera 
   {
   location  <-.14, 0, -2.5>
   direction <0.0, 0.0, 1.0>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0.07, 0.3, 0>
   }

light_source { <100, 300, -550.0> colour White }
