#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

#include "table.inc"

camera 
   {
   location  <-9,  4.4, 5>
   direction <0,   0,  .6>
   up        <0,   1,  0>
   right     <4/3, 0,  0>
   look_at   <9,   4,  4>
   }


light_source {<500, 2000, -500> color Yellow}

light_source 
   {
   <0, 7.5, 0> color White
   looks_like 
      {
      sphere 
         {
         <0, 0, 0>, .25  
         pigment {White}
         finish  {ambient 1}
         no_shadow
         }
      }
   }


// Sky sphere 
sphere 
   { <0, 0, 0>, 10000
   pigment 
      {
      bozo
      turbulence 0.5
      colour_map 
         {
         [0.0 0.6   colour rgb <.5, .5, 1> color rgb <.5, .5, 1>]
         [0.6 0.8   colour rgb <.5, .5, 1> color White]
         [0.8 1.001 colour White           color rgb <.8, .8, .8>]
         }
      scale <1000.0, 500.0, 1000.0>
      quick_color red 0.5 green 0.5 blue 1.0
      }
   finish 
      {
      Luminous
      ambient 0.8
      diffuse 0.0
      }
   }

#declare WallTexture = texture
   {
   Stone14
   scale <.1, .1, .1>
   }


//  lead pane windows -  this is slow
//  ---------------------------------


#declare FrameW = .025
#declare FrameBar = box
   {
   <0, 0, 0> <1, FrameW, FrameW>
   texture
      {
      pigment {Gray20}
      finish  {Metal}
      }
   }


#declare WindowX = 1   * (1-FrameW*4/3)
#declare WindowY = 4/3 * (1-FrameW*4/3)
#declare Angle = 70
#declare pane = difference
   {
   box {<0, 0, 0> <1, 4/3, .06> translate <0, 0, -.045>}
   plane {y  0 rotate <Angle, 0, 0>}
   plane {-y 0 rotate <-Angle, 0, 0> translate <0, 4/3, 0>}
   plane {x  0 rotate <0, -Angle, 0> }
   plane {-x 0 rotate <0, Angle, 0> translate <1, 0, 0>}

   bounded_by {box {<0, 0, 0> <1, 4/3, .06> translate <0, 0, -.045>}}
   texture {Glass3}
//   texture {pigment {Blue}}
   scale <1-FrameW*4/3, 1-FrameW*4/3, 1>
   }


#declare X1 = FrameW
#declare X2 = X1 + WindowX + FrameW
#declare X3 = X2 + WindowX + FrameW
#declare Y1 = FrameW
#declare Y2 = Y1 + WindowY + FrameW
#declare Y3 = Y2 + WindowY + FrameW

#declare Window = union
   {
   object {pane translate <X1, Y1, 0>}
   object {pane translate <X2, Y1, 0>}
   object {pane translate <X3, Y1, 0>}
   object {pane translate <X1, Y2, 0>}
   object {pane translate <X2, Y2, 0>}
   object {pane translate <X3, Y2, 0>}
   object {pane translate <X1, Y3, 0>}
   object {pane translate <X2, Y3, 0>}
   object {pane translate <X3, Y3, 0>}

   merge  // the window frame
      {
      object {FrameBar rotate <0, 0, 90> scale <1, 4, 1> translate <0, 0, 0>}
      object {FrameBar rotate <0, 0, 90> scale <1, 4, 1> translate <X1+WindowX, 0, 0>}
      object {FrameBar rotate <0, 0, 90> scale <1, 4, 1> translate <X2+WindowX, 0, 0>}
      object {FrameBar rotate <0, 0, 90> scale <1, 4, 1> translate <X3+WindowX, 0, 0>}
      object {FrameBar scale <3, 1, 1> translate <0, 0,          0>}
      object {FrameBar scale <3, 1, 1> translate <0, Y1+WindowY, 0>}
      object {FrameBar scale <3, 1, 1> translate <0, Y2+WindowY, 0>}
      object {FrameBar scale <3, 1, 1> translate <0, Y3+WindowY, 0>}
      }
   }


//#declare Window = object
//   {
//   box {<0, 0, 0> <3, 4, .02>   pigment {White filter 1}}
//   }


#declare BaseBoard = union
   {
   box {<0, 0, 0> <1, .25, .1>}
   cylinder {<0, .25, 0> <1, .25, 0> .1}
   texture {Stone18}
   }


#declare FrontWall = union
   {
   difference
      {
      box {<0, 0, 0>  <20, 8, .5>}         // the wall
      box {<6,    3, -.1> <9,     7, 1>}   // window hole
      box {<9.25, 3, -.1> <12.25, 7, 1>}   // window hole
      texture {WallTexture}
      }
   object {Window translate <6,    3, .2>} // window
   object {Window translate <9.25, 3, .2>} // window
   
   box                                     // window sill
      {
      <5.8, 2.85, -.2> <12.45, 3.0001, .5> 
      texture {Stone8}
      }
   }


#declare BackWall  = object
   {
   box {<0, 0, 0>  <20, 8, .5>}
   texture {WallTexture}
   }

#declare LeftWall  = object
   {
   box {<0, 0, 0> <.5, 8, 15>}
   texture {WallTexture}
   }

#declare RightWall = object
   {
   box {<0, 0, 0> <.5, 8, 15>}
   texture {WallTexture}
   }

#declare Ceiling = object
   {
   box {<0, 8, 0> <20, 8.5, 15>}
   pigment {Gray90}
   normal {bumps .5 scale <.03, .03, .03>}
   }

#declare Floor = object
   {
   box {<0, -.1, 0> <20, .001, 15>}
   texture 
      {
      pigment {checker color White color Black}
      }
   }


#declare Room = union
   {
   object {BackWall  translate <0,  0, 0>} 
   object {FrontWall translate <0,  0, 15>}
   object {LeftWall  translate <0,  0, 0>}
   object {RightWall translate <20, 0, 0>}

   object {Ceiling   translate <0,  0, 0>}
   object {Floor     translate <0,  0, 0>}

   object {BaseBoard                   scale <20, 1, 1> translate <0, 0, 0>}
   object {BaseBoard rotate <0,180, 0> scale <20, 1, 1> translate <0, 0, 15>}
   object {BaseBoard rotate <0, 90, 0> scale <15, 1, 1> translate <20,0, 0>}
   object {BaseBoard rotate <0,-90, 0> scale <15, 1, 1> translate <0, 0, 0>}
   }


object
   {
   Room
   translate <-10, 0, -7.5>
   }

object
   {
   WorkTable
   scale <1/12, 1/12, 1/12>     // cvt scale from inches to feet
   translate <-3, 0, 4.5>       // put it by the window
   }

plane 
   {
   y 0
   pigment {DarkGreen}
   }

