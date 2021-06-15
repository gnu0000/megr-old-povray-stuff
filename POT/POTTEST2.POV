#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

light_source {<-71, 7, -90> color Gray80}
light_source {< 31, 12, -20> color White}

camera 
   {
   location  <.5,    .5,  -1>
   direction <0.0,  0.0,  2.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <.5,    .5,  1>
   }

height_field  
   {
   pot "p1.pot"
   water_level 0.0
   pigment { White }

   finish 
      {
      crand 0.025         // dither  - not used often, but this image needs it. 
      ambient 0.2         // Very dark shadows
      diffuse 0.8         // Whiten the whites
      phong 0.75          // Fairly shiny
      phong_size 100.0    // with tight highlights
      specular 1.0
      roughness 0.005
      }
   }


height_field  
   {
   pot "p2.pot"
   water_level 0.0
   pigment { Green }

   finish 
      {
      crand 0.025         // dither  - not used often, but this image needs it. 
      ambient 0.2         // Very dark shadows
      diffuse 0.8         // Whiten the whites
      phong 0.75          // Fairly shiny
      phong_size 100.0    // with tight highlights
      specular 1.0
      roughness 0.005
      }
   translate <0, .5, 0>
   }
