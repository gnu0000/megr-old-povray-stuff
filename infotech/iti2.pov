#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

camera 
   {
   location  <.25,  1.5, -13>
   direction <0,   0,  4.5>
   up        <0,   1,  0>
   right     <1.2, 0,  0>
   look_at   <0,   1.35,  0>
   }

light_source {<-20, +200, -50> color White}

#declare _Yellow = color red 1    green 1    blue .580
#declare _Purple = color red .337 green .254 blue .648
#declare _Teal   = color red .137 green .545 blue .510

#declare _DeepBlue = color red .145 green .102 blue .271

text
   {
   ttf "c:\win\fonts\gara.ttf" "info tech" .3, 0

   texture 
      {
      pigment 
         {
         gradient <1, 1, 0 > 
         color_map 
            {
            [.00 color _Yellow]
            [.25 color _Teal  ]
            [.50 color _Yellow]
            [.75 color _Purple]
            [1.0 color _Yellow]
            }
         scale .5
         }

      finish 
         {
         specular  0.2
         roughness 0.5
         ambient   0.2
         diffuse   0.8
         }
      translate y * clock
      }
   scale <1, 4, 1>
   translate <-1.7, 0, 0>
   }

plane
   {
   z, 5
   
   texture
      {
      pigment {White}
      finish {ambient 1}
      }
   }
