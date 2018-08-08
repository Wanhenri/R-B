load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/time_axis_labels.ncl"
;load "./read-data-br-cor.ncl"
load "./read-data-br-cor-modify-v1-0-0.ncl"


begin

  ;x1 = (/1,2,3,4/)
  x1 = (/1,2,3/)

 wks = gsn_open_wks( "ps", "rms-bias-br_new" )
print("OK")
 plot = new(10,graphic)

;----------------------------------------------------------------
;; plots  --> 1 BIAS 
;----------------------------------------------------------------
 opc                         = True
 opc@trXMinF                 = 1
 opc@trXMaxF                 = 4
 opc@gsnDraw                 = False
 opc@gsnFrame                = False
 opc@tmXTOn                  = False                                      ; Turn off top tickmarks
 opc@tmYROn                  = False                                      ; Turn off top tickmarks
 opc@tmYLOn                  = True                                      ; Turn off top tickmarks

 ;opc@xyDashPatterns          = (/0,0,2,0/)                           ; Make curves all solid
 opc@xyDashPatterns          = (/0,0,2/)                           ; Make curves all solid
 opc@xyMarkLineMode          = "Lines"                     ; Markers *and* lines
 opc@xyLineThicknessF        = 0.5

 ;opc@xyLineColors            = (/"dodgerblue1","red","red","forestgreen"/) ;line color
 opc@xyLineColors            = (/"dodgerblue1","red","forestgreen"/) ;line color
 opc@tmXBMajorThicknessF     = 0.8
 opc@tmYLMajorThicknessF     = 0.8
 opc@tmXBMajorLengthF              = 0.0001
 print("OK")
 opc@tmXBMajorLengthF        = 0.004
 opc@tmBorderThicknessF      = 0.5
 opc@tmXBMode                = "Explicit" 
 opc@tmXBLabelFontHeightF    = 0.018
 opc@tmYLLabelFontHeightF    = 0.018
  opc@tmXBValues              = x1
 ;opc@tmXBLabels              = (/"24 h","72 h","120 h","168 h"/)
 opc@tmXBLabels              = (/"24 h","48h","72h"/)
 opc@tmXBLabelJust           = "CenterCenter" 
 opc@tiYAxisString          = "BIAS (mm/day)"
 opc@vpWidthF         = 0.7                                       ; Set width and height of plot.
 opc@vpHeightF        = 0.4

;;;

;opc@lgItemOrder            = (/2,1,0/) 
 ;opc@xyExplicitLegendLabels =(/"  BAM-ARA","  BAM-GDN","  BAM-RAS","  GFS"/)
 opc@xyExplicitLegendLabels =(/"BAM-DAS","BAM","GFS"/)

;;***; add a legend  ********
 opc@pmLegendDisplayMode    = "Always"              ; turn on legend
 opc@pmLegendSide           = "Top"                 ; Change location of
 opc@pmLegendParallelPosF   = .78;  lado direito                   ; move units right
 opc@pmLegendOrthogonalPosF = -.38                  ; more neg = down
 opc@pmLegendWidthF         = 0.08                   ; Change width and
 opc@pmLegendHeightF        = 0.14                  ; height of legend.
 opc@lgLabelFontHeightF     = .016                  ; change font height
 opc@lgPerimOn              = False                 ; no box around

 ;opc@lgItemOrder            = (/4,3,2,1,0/)               ; reverse legend
 ;opc@lgItemOrder            = (/3,2,1,0/)               ; reverse legend
 ;opc@lgItemOrder            = (/0,1,2,3/)               ; reverse legend


;----------------------------------------------------------------
;; plots  -->  BIAS
;----------------------------------------------------------------
 opc@trYMinF                 = -1;>>-2
 opc@trYMaxF                 = 1 ;>>2 ;>>10 
 opc@pmLegendDisplayMode    = "Always"              ; turn on legend
 plot(0)=gsn_csm_xy(wks,x1,biasl,opc)   ;-->

 opc@trYMinF                 = -1
 opc@trYMaxF                 = 2 
 opc@pmLegendDisplayMode    = "Never"              ; turn on legend
 plot(2)=gsn_csm_xy(wks,x1,biass,opc)

 opc@trYMinF                 = -3
 opc@trYMaxF                 = 1 

 plot(4)=gsn_csm_xy(wks,x1,biasc,opc)    ;--> 

 opc@trYMinF                 = 0
 opc@trYMaxF                 = 3
 plot(6)=gsn_csm_xy(wks,x1,biasn,opc)

 opc@trYMinF                 = -1
 opc@trYMaxF                 = 2
 opc@tiXAxisString          = "Lead time (hours)"
 
 plot(8)=gsn_csm_xy(wks,x1,biasa,opc)

;----------------------------------------------------------------
;; plots  --> ETS
;----------------------------------------------------------------
 delete(opc@trYMinF)
 delete(opc@trYMaxF)

 opc@trYMinF                 = 1.6
 opc@trYMaxF                 = 4
 ;opc@tiYAxisString          = "Debiased RMSE (mm/day)"
 opc@tiYAxisString          = "URMSE (mm/day)"
 opc@pmLegendDisplayMode    = "Never"              ; turn on legend
 delete(opc@tiXAxisString)

 plot(1)=gsn_csm_xy(wks,x1,rmsl,opc)   ;-->

 opc@trYMinF                 = 1
 opc@trYMaxF                 = 3
 opc@pmLegendDisplayMode    = "Never"              ; turn on legend

 plot(3)=gsn_csm_xy(wks,x1,rmss,opc)

 opc@trYMinF                 = 1.3
 opc@trYMaxF                 = 5
 plot(5)=gsn_csm_xy(wks,x1,rmsc,opc)    ;-->

 opc@trYMinF                 = 0
 opc@trYMaxF                 = 4;10
 plot(7)=gsn_csm_xy(wks,x1,rmsn,opc)

 opc@trYMinF                 = 1
 opc@trYMaxF                 = 5
 opc@tiXAxisString          =  "Lead time (hours)"

 plot(9)=gsn_csm_xy(wks,x1,rmsa,opc)


;************************************************
;;create panel 
;************************************************
 resPanel                                  = True                 ; panel mods desired
 resPanel@gsnFrame                         = True ;False
 resPanel@amJust                           = "TopRight" ;"TopLeft";
 resPanel@amParallelPosF                   = 0.024;-0.10                ;move right left
 resPanel@amOrthogonalPosF                 = -0.49 ; 35                 ;move up down   
 resPanel@gsnPanelFigureStringsFontHeightF = 0.010                ; make small
 resPanel@gsnPanelFigureStringsPerimOn     = False



 resPanel@gsnPanelFigureStrings            = (/"a) La Plata (B1)        ",\
                                                "a')                              ",\
                                               "b) Southeast (B2)     ",\
                                                "b')                              ", \
                                               "c) Central-West (B3) ",\
                                                "c')                              ",\
                                               "d) Northeast (B4)      ",\
                                                "d')                              ",\ 
                                               "e) Amazon (B5)        ",\
                                                "e')                              "/)

  resPanel@gsnPanelXWhiteSpacePercent = 2.5 
  ;resPanel@gsnPanelYWhiteSpacePercent = 3.5 
  resPanel@gsnPanelYWhiteSpacePercent = 4.5 

  gsn_panel(wks,plot,(/5,2/),resPanel)
  delete(wks)
  system("convert -trim -density 300 -rotate -360 rms-bias-br_new.ps rms-bias-br_new.png ; rm rms-bias-br_new.ps")


 print("OK")

end
