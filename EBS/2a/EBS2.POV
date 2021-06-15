/*
 * EBS - Info Tech animation (2.0)
 *
 * This is a scene file / script for generating an animation
 *
 * bla bla bla...
 *
 *
 * External Variables used:
 *  clock - 00 thru 114
 *
 * Internal variables based on clock
 *  step  - this is the same as the clock variable
 *  riple - causes wave motions in water     0 to 1
 *  EBSht - height of EBS letters - varies from 0 to 10.5
 *  EBSRot- rotation of EBS letters          0 to 360
 *  SHLRot- rotation of shell thingies
 *  BASRot- rotation of main shell (that image is sitting on)
 *  lookx - look at x position
 *  looky - look at y position
 *  lookz - look at z position
 *  xloc  - x location of camera
 *  yloc  - y location of camera
 *  zloc  - z location of camera
 */
#include "Shapes.inc"
#include "chars.inc"
#include "Colors.inc"
#include "Textures.inc"
#include "Stones.inc"


/*
 * set frames to be the number of frames in the animation
 * render with with /Clock = 1 to /Clock=frames
 */
#declare frames       = 100;
#declare step         = clock * 114 / frames;

#declare pi           = 3.1415926535;
#declare ColumnHt     = 25;          // height of column spheres
#declare ColumnPos    = 15;          // position of columns (X and Y)
#declare BallRadius   = 6;           // radius of spheres
#declare ArmWidth     = 1;           //
#declare DiskThickness= 1.00005;     //
#declare DiskPos      = 13.19868416; // DiskPos = 13.69868416 is correct
#declare DiskScale    = 0.5;
#declare ShellTop     = (DiskPos + DiskThickness) * DiskScale;

#declare riple = (step/7)%1;
#declare EBSht = (step >= 17 ? (step-17)/15 * 9 : 0);
#declare EBSht = (step >= 32 ? 9 : EBSht);
#declare EBSRot= (step >= 33 ? (step-33)*15 : 0)%360;
#declare ShlRot= 180 + step*15;
#declare BASRot= (step >= 102 ? (step-102)*15 : 0);

#declare lookx = (step <=20 ? -15 + step/20 * 15 : 0);
#declare lookz = (step <=20 ? -15 + step/20 * 15 : 0);
#declare looky = (step <=20 ? ShellTop + ColumnHt * (1-step/20): ShellTop);

//
// All this stuff is to move the camera
//
#declare xloc  = -25.1 +                       10 * cos((step^2/24+3*step)/(4*16)*pi);
#declare yloc  = ColumnHt + ShellTop+3 + ColumnHt * sin((step^2/24+3*step)/(4*16)*pi);
#declare zloc  = -15.1 -                       15 * sin((step^2/24+3*step)/(4*48)*pi);

#declare xloc  = (step >= 24 ? -25 +          2*(step-24)    : xloc);
#declare yloc  = (step >= 24 ? ShellTop + 3 - 3*(step-24)/20 : yloc);
#declare zloc  = (step >= 24 ? -30                           : zloc);

#declare xloc  = (step >= 44 ?  15 + 15 * cos ((step-44)/22 * pi - pi/2)            : xloc);
#declare yloc  = (step >= 44 ? ShellTop - ShellTop * sin ((step-44)/22 * pi) * 0.9  : yloc);
#declare zloc  = (step >= 44 ? -15 + 14 * sin ((step-44)/22 * pi - pi/2)            : zloc);

#declare xloc  = (step >= 66 ? 15 - (step-66)/48 * 16               : xloc);
#declare yloc  = (step >= 66 ? ShellTop + 1.3^(step-66) * .01018217 : yloc);
#declare zloc  = (step >= 66 ? -1                                   : zloc);

/***************************************************************************/
/*                                                                         */
/* Textures used in the scene                                              */
/*                                                                         */
/***************************************************************************/

#declare Mithril  = texture 
   {
   pigment {color Gray70   quick_color Red} 
   finish {reflection 0.5}
   }
#declare Mithril2 = texture 
   {
   pigment {color Gray40   quick_color Green} 
   finish {reflection 0.7}
   }
#declare Mithril3 = texture 
   {
   pigment {color Gray15   quick_color Blue} 
   finish {reflection 0.05}
   }
#declare TopTex   = texture 
   {
   Stone3 scale <.08, .08, .08>
   pigment {quick_color Gray50} 
   }
#declare SphereTex = texture 
   {
   Glass
   finish {reflection .125 ior 1.55}
   pigment {quick_color Yellow} 
   }
#declare BasinTex = texture 
   {
   Stone13
   pigment {quick_color Gray30} 
   }

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/***************************************************************************/


#declare _Disk = union
   {
   cylinder {<0, 0, 0>, <0, 1.00005, 0>, 3   texture {TopTex}}
   cylinder {<0, 0, 0>, <0, 1.00004, 0>, 4.5 texture {Mithril3}}
   cylinder {<0, -0.0001, 0>, <0, 1, 0>, 5   texture {Mithril}}

//box {<-.1, 0, 0> <.1, 1.00006, 3> texture {MathG}} // for debug
   }

#declare _Slice = intersection
   {
   plane {z,  1/13}
   plane {z, -1/13 inverse}
   }

#declare _Arm = intersection
   {
   sphere {<0, 0, 0> 15 + ArmWidth/2 }
   sphere {<0, 0, 0> 15 - ArmWidth/2 inverse}
   box {<0,  2.99, -1.5>, <15 + ArmWidth/2, 15 + ArmWidth/2, 1.5>}
   cylinder {<0, 15 - ArmWidth, 0> <0, 15 + ArmWidth, 0>, 5 inverse}

   object {_Slice translate <0, 0, -1.5> inverse}
   object {_Slice translate <0, 0, -1  > inverse}
   object {_Slice translate <0, 0, -.5 > inverse}
   object {_Slice translate <0, 0, 0   > inverse}
   object {_Slice translate <0, 0, .5  > inverse}
   object {_Slice translate <0, 0, 1   > inverse}
   object {_Slice translate <0, 0, 1.5 > inverse}

   texture  {Mithril}
   bounded_by {box {<4.95, 0, -1.5>, <15 + ArmWidth/2, 15 + ArmWidth/2, 1.5>}}
   }

#declare _Ring = intersection
   {
   sphere {<0, 0, 0> 15 + ArmWidth/2}
   sphere {<0, 0, 0> 15 - ArmWidth/2 inverse}
   plane  {y, 3}
   plane  {y, -3 inverse}

   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*0 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*1 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*2 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*3 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*4 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*5 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*6 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*7 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*8 inverse}
   cylinder {<-16.1, 0, 0> <16.1, 0, 0> 2.25 rotate y*18*9 inverse}

   texture  {Mithril}
   }


#declare Shell = union
   {
   object {_Disk translate <0, DiskPos, 0>}
   object {_Ring}
   object {_Arm rotate y*72*0}
   object {_Arm rotate y*72*1}
   object {_Arm rotate y*72*2}
   object {_Arm rotate y*72*3}
   object {_Arm rotate y*72*4}
   bounded_by {sphere {<0, 0, 0> 17}}
   scale DiskScale
   }

#declare _Column = intersection
   {
   object
      {
      Hyperboloid_Y
      scale <1, 5, 1>
      translate <0, ColumnHt/2, 0>
      }
   plane {-y  0}
   plane { y  ColumnHt}
   sphere {<0, ColumnHt, 0> BallRadius inverse}
   }

#declare _Post = union
   {
   object   {_Column}
   cylinder {<0, 0, 0>, <0, 2, 0>, 3}

   sphere   
      {
      <0, ColumnHt, 0> BallRadius
      texture {SphereTex}
      }
   object   {Shell rotate y*ShlRot translate y*ColumnHt}
   texture  {Mithril}
   }


#declare _ITICutout = union
   {
   object {char_I scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*0}
   object {char_N scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*8}
   object {char_F scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*20}
   object {char_O scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*30}
   object {char_T scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*46}
   object {char_E scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*58}
   object {char_C scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*68}
   object {char_H scale <3/7, 3/5, 1> translate <0, -12.5, -.5> rotate z*78}
   rotate -z*38
   rotate x*90
   }

#declare _Pool = union
   {
   object  /*--- ring ---*/
      {
      difference
         {
         cylinder {<0,  0, 0>, <0, 1.3, 0>, 13}
         cylinder {<0, .6, 0>, <0, 2, 0>,    9}
         cylinder {<0,  0, 0>, <0, 2, 0>,  7.5}

         object {_ITICutout translate <0, 1.3, 0> rotate y*0}
         object {_ITICutout translate <0, 1.3, 0> rotate y*120}
         object {_ITICutout translate <0, 1.3, 0> rotate y*240}
         }
      texture {BasinTex}
      }

   object  /*--- coloring for embossed letters ---*/
      {
      difference
         {
         cylinder {<0,  0, 0>, <0, 1.29, 0>, 12.9}
         cylinder {<0,  0, 0>, <0, 2, 0>,    9.1}
         }
      texture {Mithril3}
      }

   object /*--- water ---*/
      {
      cylinder {<0, -.001, 0>, <0, .5, 0>, 9}
      texture {Water  normal {ripples 1 phase riple} scale <8, 8, 8>}
      }

   object /*--- water bottom ---*/
      {
      cylinder {<0, -.001, 0>, <0, .49, 0>, 9}
      pigment {color Blue}
      }
   }

#declare Stand = union
   {       
   object {_Post translate < ColumnPos, 0,  ColumnPos>}
   object {_Post translate <-ColumnPos, 0,  ColumnPos>}
   object {_Post translate < ColumnPos, 0, -ColumnPos>}
   object {_Post translate <-ColumnPos, 0, -ColumnPos>}
   object {_Pool}
   }


/***************************************************************************/
/*                                                                         */
/*                                                                         */
/***************************************************************************/

#declare _half = intersection
   {
   torus {1, 0.5 rotate x*90}
  
   box {<0, -1.5, -.5> <1.5, 1.5, .5>}
   bounded_by {box {<0, -1.5, -.5> <1.5, 1.5, .5>}}
   }

#declare _quarter = intersection
   {
   object {_half}
   box {<0, 0, -.5> <1.5, 1.5, .5>}
   bounded_by {box {<0, 0, -.5> <1.5, 1.5, .5>}}
   }

#declare _E = merge
   {
   cylinder {<0, 0, 0> <0, 4, 0> .5}
   cylinder {<0, 4, 0> <3, 4, 0> .5}
   cylinder {<0, 2, 0> <2, 2, 0> .5}
   cylinder {<0, 0, 0> <3, 0, 0> .5}
   sphere {<0, 4, 0> .5}
   sphere {<0, 0, 0> .5}
   sphere {<3, 4, 0> .5}
   sphere {<2, 2, 0> .5}
   sphere {<3, 0, 0> .5}
   translate <-1.5, .5, 0>
   bounded_by {box {<-2, 0, -.5> <2, 5, .5>}}
   }

#declare _B = merge
   {
   cylinder {<0, 0, 0> <0, 4, 0> .5}
   cylinder {<0, 4, 0> <2.0001, 4, 0> .5} // slight overlaps for merge
   cylinder {<0, 2, 0> <2.0001, 2, 0> .5}
   cylinder {<0, 0, 0> <2.0001, 0, 0> .5}
   object {_half translate <2, 3, 0>}
   object {_half translate <2, 1, 0>}
   sphere {<0, 4, 0> .5}
   sphere {<2, 2, 0> .5025}  // removes an edge shadow (cause unknown)
   sphere {<0, 0, 0> .5}
   translate <-1.5, .5, 0>
   bounded_by {box {<-2, 0, -.5> <2, 5, .5>}}
   }

#declare _S = merge
   {
   cylinder {<.9999, 4, 0> <2.0001, 4, 0> .5} // slight overlaps for merge
   cylinder {<.9999, 2, 0> <2.0001, 2, 0> .5}
   cylinder {<.9999, 0, 0> <2.0001, 0, 0> .5}
   object {_half rotate z*180 translate <1, 3, 0>}
   object {_half translate <2, 1, 0>}
   object {_quarter translate <2, 3, 0>}
   object {_quarter rotate z*180 translate <1, 1, 0>}
   translate <-1.5, .5, 0>
   bounded_by {box {<-2, 0, -.5> <2, 5, .5>}}
   }

#declare EBS = union
   {
   object { _E rotate y*EBSRot  translate -x*5}
   object { _B rotate y*EBSRot  translate x*0 }
   object { _S rotate y*EBSRot  translate x*5 }
   translate <0, EBSht-5.5, 0>
   texture {Mithril2} 
   }


/***************************************************************************/
/*                                                                         */
/* Object in the scene come next                                           */
/*                                                                         */
/***************************************************************************/

#declare Sky_Top = 100000
#include "Clouds.inc"

/*--- lights ---*/
object {light_source { <21000, 68000, -60000> color White }}

/*--- camera ---*/
camera 
   { 
   location  <xloc, yloc, zloc>
   direction <0,   0, 1.0>
   up        <0,   1, 0>
   right     <8/5, 0, 0>
   look_at   <lookx, looky, lookz>
   }

/*--- action ---*/
object {Stand} // The objects


object {EBS}   // The spinning EBS letters

object         // The ground / monster shell
   {
   Shell
   rotate y*BASRot
   translate <0, -ShellTop, 0>
   scale 1000
   }

