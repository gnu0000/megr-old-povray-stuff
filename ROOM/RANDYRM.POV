#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "table.inc"

default
   {
   finish
      {
      ambient .6
      }
   }


camera 
   {
   location  <150, 150, -250>
   direction <0,   0,  1.5>
   up        <0,   1,  0>
   right     <4/3, 0,  0>
   look_at   <172,  130, 0>
   }

light_source {<150, 150, -250> color White}

#declare stack = union
   {
   object {WorkTable}
   object {WorkTable translate <0, 0, 0>}
   object {WorkTable translate <0, 30, 0>}
   object {WorkTable translate <0, 60, 0>}
   object {WorkTable translate <0, 90, 0>}
   object {WorkTable translate <0, 120,0>}
   object {WorkTable translate <0, 150,0>}
   object {WorkTable translate <0, 180,0>}
   object {WorkTable translate <0, 210,0>}
   object {WorkTable translate <0, 240,0>}
   object {WorkTable translate <0, 270,0>}
   }

//object {stack}
object {stack translate <73, 0, 0>}
object {stack translate <146, 0, 0>}
object {stack translate <219, 0, 0>}
