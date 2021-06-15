#include "colors.inc"
#include "textures.inc"
#include "table.inc"

//#include "axis.inc"   // for testing

#default
   {
   finish 
      {
      ambient .6
      diffuse .4
      }
   }


//   location  <2,   0,  1>
//   location  <6/12,  1,  11/12>
//   look_at   <1.1,   1.3,  1>
//   look_at   <4/12, 16/12,  11/12>
//   look_at   <11/12, 20/12,  18/12>

//   location  <2,   3.75,  -5>
//   look_at   <2,   1.3,  1>

camera 
   {
   location  <1,   -.5, -6>
   direction <0,   0,  1.5>
   up        <0,   1,  0>
   right     <4/3, 0,  0>
   look_at   <3,   1.5,  .5>
   }

//light_source {<500, 2000, -500> color White}
//light_source {<0, 7.8, -10> color White}
light_source {<3, .21, 0> color White}

sphere 
   {<0, 0, 0>, 10000
   pigment {LightBlue}
   finish  {Luminous  ambient 0.8  diffuse 0.0}
   }

object
   {
   WorkTable
   scale <1/12, 1/12, 1/12>
   }

