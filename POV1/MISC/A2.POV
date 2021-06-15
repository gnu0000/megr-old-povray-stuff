#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#define {@XLen=10}
#define {@YLen=10}
#define {@ZLen=10}
#define {@PostRadius=.5}
#define {@BumpRadius=1.5}



camera 
   {
   location  <.1  1.5  -5>
   direction <0.0  0.0   1.3>
   up        <0.0  1.0   0.0>
   right     <1.33 0.0   0.0>
   look_at   <.1   1.3   0>
   }

object {light_source { <200 30 -300> colour White }}

object {light_source { <-200 400 -300> colour White}}


// #declare ZPost = object
//    {
//    intersection {Disk_Z}
// //   texture {color Gray90 reflection 0.5}
//    texture {color Red}
//    bounded_by{box{<-1.001 -1.001 -1.001> <1.001 1.001 1.001>}}
//    scale     <@PostRadius @PostRadius @ZLen/2>
//    translate <0 0 @ZLen/2>
//    }
// 
// #declare Bump = object
//    {
//    sphere {<0 0 0> @BumpRadius}
//    texture {color Blue}
//    }
// 
// 
// #declare Node = composite
//    {
//    object {Bump}
//    object {XPost}
//    object {YPost}
//    object {ZPost}
//    }
// 
// #declare NodeStrip = composite
//    {
//    composite {Node translate <0       0  0>}
//    composite {Node translate <@XLen   0  0>}
//    composite {Node translate <@XLen*2 0  0>}
//    composite {Node translate <@XLen*3 0  0>}
// 
//    bounded_by{box {<-@BumpRadius -@BumpRadius -@BumpRadius>
//                    < @XLen*4      @YLen        @ZLen> }}
//    }
// 
// #declare NodeLevel = composite
//    {
//    composite {NodeStrip translate <0 0  0      >}
//    composite {NodeStrip translate <0 0  @ZLen  >}
//    composite {NodeStrip translate <0 0  @ZLen*2>}
//    composite {NodeStrip translate <0 0  @ZLen*3>}
//    }

#declare Lense = object
   {
   intersection
      {
      sphere { <0 0 0> 10 translate <0 0 9.7>}
      sphere { <0 0 0> 10 translate <0 0 -9.7>}
      }
   texture {Glass color red .92 green 1 blue .96  alpha 0.7}
   scale <.25 .25 .25>
   }


object
   {
   difference
      {
      box {<-1 -1 -1> <1 1 1>}
      sphere { <0 0 0> 1.4 }
      }
   texture {Red_Marble scale <1 1 1>}
   }


object
   {
   Lense
   translate <.1 1.3 -3>
   }



