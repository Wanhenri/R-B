begin
  ;>>>SMG
  arq_SMG_1 = addfile ("MAY2015_24Z_12Z_SMG.nc", "r")
  arq_SMG_2 = addfile ("MAY2015_48Z_12Z_SMG.nc", "r")
  arq_SMG_3 = addfile ("MAY2015_72Z_12Z_SMG.nc", "r")
    new1_24=arq_SMG_1->prec
    new1_48=arq_SMG_2->prec
    new1_72=arq_SMG_3->prec
      new1_24@_FillValue=-9.99e+08
      new1_48@_FillValue=-9.99e+08
      new1_72@_FillValue=-9.99e+08
;*
;*
;*
  ;>>>NCEP
  arq_NCEP_1 = addfile ("MAY2015_24Z_12Z_NCEP.nc", "r")
  arq_NCEP_2 = addfile ("MAY2015_48Z_12Z_NCEP.nc", "r")
  arq_NCEP_3 = addfile ("MAY2015_72Z_12Z_NCEP.nc", "r")
    new2_24=arq_NCEP_1->prec
    new2_48=arq_NCEP_2->prec
    new2_72=arq_NCEP_3->prec
      new2_24@_FillValue=-9.99e+08
      new2_48@_FillValue=-9.99e+08
      new2_72@_FillValue=-9.99e+08
;*
;*
;*
  ;>>>GFS
  arq_GFS_1 = addfile ("prev.2015.mar.24h_seldate.nc", "r")
  arq_GFS_2 = addfile ("prev.2015.mar.48h_seldate.nc", "r")
  arq_GFS_3 = addfile ("prev.2015.mar.72h_seldate.nc", "r")
    gfs_24=arq_GFS_1->APCP_surface
    gfs_48=arq_GFS_2->APCP_surface
    gfs_72=arq_GFS_3->APCP_surface
      gfs_24@_FillValue=-9.99e+08
      gfs_48@_FillValue=-9.99e+08
      gfs_72@_FillValue=-9.99e+08
;*
;*
;*
;>>>IMERG
 arq_IMERG_1 = addfile ("GPM_REC_ACUM_24h_grib2.nc", "r")
 tmpa=arq_IMERG_1->PREC_surface
;*
;*
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><
;;*****  medias na area
 ;>>>la plata basin
 ;media do observado
 aa5o=dim_avg_Wrap(dim_avg_Wrap(tmpa(:,{-36:-24},{295:315})))
 ;*
 ;>>>24h
 n5m24=dim_avg_Wrap(dim_avg_Wrap(new1_24(:,{-36:-24},{295:315})))
 aa5m24=dim_avg_Wrap(dim_avg_Wrap(new2_24(:,{-36:-24},{295:315})))
 gfs5m24=dim_avg_Wrap(dim_avg_Wrap(gfs_24(:,{-36:-24},{295:315})))
 ;>>>48h
 n5m48=dim_avg_Wrap(dim_avg_Wrap(new1_48(:,{-36:-24},{295:315})))
 aa5m48=dim_avg_Wrap(dim_avg_Wrap(new2_48(:,{-36:-24},{295:315})))
 gfs5m48=dim_avg_Wrap(dim_avg_Wrap(gfs_48(:,{-36:-24},{295:315})))
 ;:::72h
 n5m72=dim_avg_Wrap(dim_avg_Wrap(new1_72(:,{-36:-24},{295:315})))
 aa5m72=dim_avg_Wrap(dim_avg_Wrap(new2_72(:,{-36:-24},{295:315})))
 gfs5m72=dim_avg_Wrap(dim_avg_Wrap(gfs_72(:,{-36:-24},{295:315})))
;>
print("recorte la plata OK")
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><
 ;>>>sudeste
 ;media do observado
 aa4o=dim_avg_Wrap(dim_avg_Wrap(tmpa(:,{-24:-12},{310:325})))
 ;*
 ;>>>24h
 n4m24=dim_avg_Wrap(dim_avg_Wrap(new1_24(:,{-24:-12},{310:325})))
 gfs4m24=dim_avg_Wrap(dim_avg_Wrap(gfs_24(:,{-24:-12},{310:325})))
 aa4m24=dim_avg_Wrap(dim_avg_Wrap(new2_24(:,{-24:-12},{310:325})))
 ;>>>48h 
 n4m48=dim_avg_Wrap(dim_avg_Wrap(new1_48(:,{-24:-12},{310:325})))
 gfs4m48=dim_avg_Wrap(dim_avg_Wrap(gfs_48  (:,{-24:-12},{310:325})))
 aa4m48=dim_avg_Wrap(dim_avg_Wrap(new2_48(:,{-24:-12},{310:325})))
 ;>>>72h
 n4m72=dim_avg_Wrap(dim_avg_Wrap(new1_72(:,{-24:-12},{310:325})))
 gfs4m72=dim_avg_Wrap(dim_avg_Wrap(gfs_72  (:,{-24:-12},{310:325})))
 aa4m72=dim_avg_Wrap(dim_avg_Wrap(new2_72(:,{-24:-12},{310:325})))
;>
print("recorte sudeste OK")
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><
;>>>centro oeste
;media do observado
 aa3o=dim_avg_Wrap(dim_avg_Wrap(tmpa(:,{-24:-12},{295:310})))
;*
;>>>24h
 n3m24=dim_avg_Wrap(dim_avg_Wrap(new1_24(:,{-24:-12},{295:310})))
 gfs3m24=dim_avg_Wrap(dim_avg_Wrap(gfs_24(:,{-24:-12},{295:310})))
 aa3m24=dim_avg_Wrap(dim_avg_Wrap(new2_24(:,{-24:-12},{295:310})))
;>>>48h
 n3m48=dim_avg_Wrap(dim_avg_Wrap(new1_48(:,{-24:-12},{295:310})))
 gfs3m48=dim_avg_Wrap(dim_avg_Wrap(gfs_48  (:,{-24:-12},{295:310})))
 aa3m48=dim_avg_Wrap(dim_avg_Wrap(new2_48(:,{-24:-12},{295:310})))
;>>>72h 
 n3m72=dim_avg_Wrap(dim_avg_Wrap(new1_72(:,{-24:-12},{295:310})))
 gfs3m72=dim_avg_Wrap(dim_avg_Wrap(gfs_72  (:,{-24:-12},{295:310})))
 aa3m72=dim_avg_Wrap(dim_avg_Wrap(new2_72(:,{-24:-12},{295:310})))
;>
print("recorte centralw OK")
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><
;nordeste
;media do observado
 aa2o=dim_avg_Wrap(dim_avg_Wrap(tmpa(:,{-12:0},{310:325})))
;*
;>>>24h 
 n2m24=dim_avg_Wrap(dim_avg_Wrap(new1_24(:,{-12:0},{310:325})))
 gfs2m24=dim_avg_Wrap(dim_avg_Wrap(gfs_24(:,{-12:0},{310:325})))
 aa2m24=dim_avg_Wrap(dim_avg_Wrap(new2_24(:,{-12:0},{310:325})))
;>>>48h 
 n2m48=dim_avg_Wrap(dim_avg_Wrap(new1_48(:,{-12:0},{310:325})))
 gfs2m48=dim_avg_Wrap(dim_avg_Wrap(gfs_48  (:,{-12:0},{310:325})))
 aa2m48=dim_avg_Wrap(dim_avg_Wrap(new2_48(:,{-12:0},{310:325})))
;>>>72h 
 n2m72=dim_avg_Wrap(dim_avg_Wrap(new1_72(:,{-12:0},{310:325})))
 gfs2m72=dim_avg_Wrap(dim_avg_Wrap(gfs_72  (:,{-12:0},{310:325})))
 aa2m72=dim_avg_Wrap(dim_avg_Wrap(new2_72(:,{-12:0},{310:325})))
;>
print("recorte nordeste OK")
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><
;amazonia
;media do observado
 aa1o=dim_avg_Wrap(dim_avg_Wrap(tmpa(:,{-12:0},{295:310})))
;*
;>>>24h 
 n1m24=dim_avg_Wrap(dim_avg_Wrap(new1_24(:,{-12:0},{295:310})))
 gfs1m24=dim_avg_Wrap(dim_avg_Wrap(gfs_24(:,{-12:0},{295:310})))
 aa1m24=dim_avg_Wrap(dim_avg_Wrap(new2_24(:,{-12:0},{295:310})))
;>>>48h
 n1m48=dim_avg_Wrap(dim_avg_Wrap(new1_48(:,{-12:0},{295:310})))
 gfs1m48=dim_avg_Wrap(dim_avg_Wrap(gfs_48(:,{-12:0},{295:310})))
 aa1m48=dim_avg_Wrap(dim_avg_Wrap(new2_48(:,{-12:0},{295:310})))
;>>>72h
 n1m72=dim_avg_Wrap(dim_avg_Wrap(new1_72(:,{-12:0},{295:310})))
 gfs1m72=dim_avg_Wrap(dim_avg_Wrap(gfs_72(:,{-12:0},{295:310})))
 aa1m72=dim_avg_Wrap(dim_avg_Wrap(new2_72(:,{-12:0},{295:310})))
;>
print("recorte amazon OK")
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>><><><><><
;;>>>>>>>>>>>>>>>>> RMS  - modelo x merge
;
 MRmse1l = dim_rmsd_n_Wrap(aa5m24,aa5o,0)    
 MRmse2l = dim_rmsd_n_Wrap(aa5m48,aa5o,0)    
 MRmse3l = dim_rmsd_n_Wrap(aa5m72,aa5o,0)    

 GRmse1l = dim_rmsd_n_Wrap(gfs5m24,aa5o,0) 
 GRmse2l = dim_rmsd_n_Wrap(gfs5m48,aa5o,0)
 GRmse3l = dim_rmsd_n_Wrap(gfs5m72,aa5o,0)

 NRmse1l = dim_rmsd_n_Wrap(n5m24,aa5o,0)  
 NRmse2l = dim_rmsd_n_Wrap(n5m48,aa5o,0)
 NRmse3l = dim_rmsd_n_Wrap(n5m72,aa5o,0)

;;******  compute bias
 bbmm1l=dim_avg_n(aa5m24-aa5o,0)
 bbmm2l=dim_avg_n(aa5m48-aa5o,0)
 bbmm3l=dim_avg_n(aa5m72-aa5o,0)

 bbg1l=dim_avg_n(gfs5m24-aa5o,0)
 bbg2l=dim_avg_n(gfs5m48-aa5o,0)
 bbg3l=dim_avg_n(gfs5m72-aa5o,0)

 bbn1l=dim_avg_n(n5m24-aa5o,0)
 bbn2l=dim_avg_n(n5m48-aa5o,0)
 bbn3l=dim_avg_n(n5m72-aa5o,0)
  
 NRms1l =sqrt(NRmse1l^2- bbn1l^2)
 NRms2l =sqrt(NRmse2l^2- bbn2l^2)
 NRms3l =sqrt(NRmse3l^2- bbn3l^2)

 MRms1l =sqrt(MRmse1l^2- bbmm1l^2)
 MRms2l =sqrt(MRmse2l^2- bbmm2l^2)
 MRms3l =sqrt(MRmse3l^2- bbmm3l^2)

 GRms1l =sqrt(GRmse1l^2- bbg1l^2)
 GRms2l =sqrt(GRmse2l^2- bbg2l^2)
 GRms3l =sqrt(GRmse3l^2- bbg3l^2)
  print("rms la plata OK")
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 MRmse1s = dim_rmsd_n_Wrap(aa4m24,aa4o,0)    
 MRmse2s = dim_rmsd_n_Wrap(aa4m48,aa4o,0)    
 MRmse3s = dim_rmsd_n_Wrap(aa4m72,aa4o,0)    

 GRmse1s = dim_rmsd_n_Wrap(gfs4m24,aa4o,0) 
 GRmse2s = dim_rmsd_n_Wrap(gfs4m48,aa4o,0)
 GRmse3s = dim_rmsd_n_Wrap(gfs4m72,aa4o,0)

 NRmse1s = dim_rmsd_n_Wrap(n4m24,aa4o,0)  
 NRmse2s = dim_rmsd_n_Wrap(n4m48,aa4o,0)
 NRmse3s = dim_rmsd_n_Wrap(n4m72,aa4o,0)

;>>>>>>compute bias
 bbmm1s=dim_avg_n(aa4m24-aa4o,0)
 bbmm2s=dim_avg_n(aa4m48-aa4o,0)
 bbmm3s=dim_avg_n(aa4m72-aa4o,0)

 bbg1s=dim_avg_n(gfs4m24-aa4o,0)
 bbg2s=dim_avg_n(gfs4m48-aa4o,0)
 bbg3s=dim_avg_n(gfs4m72-aa4o,0)
 
 bbn1s=dim_avg_n(n4m24-aa4o,0)
 bbn2s=dim_avg_n(n4m48-aa4o,0)
 bbn3s=dim_avg_n(n4m72-aa4o,0)
 
 NRms1s =sqrt(NRmse1s^2- bbn1s^2)
 NRms2s =sqrt(NRmse2s^2- bbn2s^2)
 NRms3s =sqrt(NRmse3s^2- bbn3s^2)
  
 MRms1s =sqrt(MRmse1s^2- bbmm1s^2)
 MRms2s =sqrt(MRmse2s^2- bbmm2s^2)
 MRms3s =sqrt(MRmse3s^2- bbmm3s^2)
  
 GRms1s =sqrt(GRmse1s^2- bbg1s^2)
 GRms2s =sqrt(GRmse2s^2- bbg2s^2)
 GRms3s =sqrt(GRmse3s^2- bbg3s^2)
  print("rms sudeste OK")
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  
;;;;
 MRmse1c = dim_rmsd_n_Wrap(aa3m24,aa3o,0)    
 MRmse2c = dim_rmsd_n_Wrap(aa3m48,aa3o,0)    
 MRmse3c = dim_rmsd_n_Wrap(aa3m72,aa3o,0)    

 GRmse1c = dim_rmsd_n_Wrap(gfs3m24,aa3o,0) 
 GRmse2c = dim_rmsd_n_Wrap(gfs3m48,aa3o,0)
 GRmse3c = dim_rmsd_n_Wrap(gfs3m72,aa3o,0)

 NRmse1c = dim_rmsd_n_Wrap(n3m24,aa3o,0)  
 NRmse2c = dim_rmsd_n_Wrap(n3m48,aa3o,0)
 NRmse3c = dim_rmsd_n_Wrap(n3m72,aa3o,0)

;;>>>>>>>compute bias
 bbmm1c=dim_avg_n(aa3m24-aa3o,0)
 bbmm2c=dim_avg_n(aa3m48-aa3o,0)
 bbmm3c=dim_avg_n(aa3m72-aa3o,0)

 bbg1c=dim_avg_n(gfs3m24-aa3o,0)
 bbg2c=dim_avg_n(gfs3m48-aa3o,0)
 bbg3c=dim_avg_n(gfs3m72-aa3o,0)

 bbn1c=dim_avg_n(n3m24-aa3o,0)
 bbn2c=dim_avg_n(n3m48-aa3o,0)
 bbn3c=dim_avg_n(n3m72-aa3o,0)
  
 NRms1c =sqrt(NRmse1c^2- bbn1c^2)
 NRms2c =sqrt(NRmse2c^2- bbn2c^2)
 NRms3c =sqrt(NRmse3c^2- bbn3c^2)

 MRms1c =sqrt(MRmse1c^2- bbmm1c^2)
 MRms2c =sqrt(MRmse2c^2- bbmm2c^2)
 MRms3c =sqrt(MRmse3c^2- bbmm3c^2)

 GRms1c =sqrt(GRmse1c^2- bbg1c^2)
 GRms2c =sqrt(GRmse2c^2- bbg2c^2)
 GRms3c =sqrt(GRmse3c^2- bbg3c^2)
print("rms centralw OK")
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;;
 MRmse1n = dim_rmsd_n_Wrap(aa2m24,aa2o,0)    
 MRmse2n = dim_rmsd_n_Wrap(aa2m48,aa2o,0)    
 MRmse3n = dim_rmsd_n_Wrap(aa2m72,aa2o,0)    

 GRmse1n = dim_rmsd_n_Wrap(gfs2m24,aa2o,0) 
 GRmse2n = dim_rmsd_n_Wrap(gfs2m48,aa2o,0)
 GRmse3n = dim_rmsd_n_Wrap(gfs2m72,aa2o,0)

 NRmse1n = dim_rmsd_n_Wrap(n2m24,aa2o,0)  
 NRmse2n = dim_rmsd_n_Wrap(n2m48,aa2o,0)
 NRmse3n = dim_rmsd_n_Wrap(n2m72,aa2o,0)
;;>>>>>>>compute bias
 bbmm1n=dim_avg_n(aa2m24-aa2o,0)
 bbmm2n=dim_avg_n(aa2m48-aa2o,0)
 bbmm3n=dim_avg_n(aa2m72-aa2o,0)

 bbg1n=dim_avg_n(gfs2m24-aa2o,0)
 bbg2n=dim_avg_n(gfs2m48-aa2o,0)
 bbg3n=dim_avg_n(gfs2m72-aa2o,0)

 bbn1n=dim_avg_n(n2m24-aa2o,0)
 bbn2n=dim_avg_n(n2m48-aa2o,0)
 bbn3n=dim_avg_n(n2m72-aa2o,0)


 NRms1n =sqrt(NRmse1n^2- bbn1n^2)
 NRms2n =sqrt(NRmse2n^2- bbn2n^2)
 NRms3n =sqrt(NRmse3n^2- bbn3n^2)

 MRms1n =sqrt(MRmse1n^2- bbmm1n^2)
 MRms2n =sqrt(MRmse2n^2- bbmm2n^2)
 MRms3n =sqrt(MRmse3n^2- bbmm3n^2)

 GRms1n =sqrt(GRmse1n^2- bbg1n^2)
 GRms2n =sqrt(GRmse2n^2- bbg2n^2)
 GRms3n =sqrt(GRmse3n^2- bbg3n^2)

print("rms nordeste OK")
;>>>>>>>>>>>>>>>>>>>>>>>
;;;;
 MRmse1a = dim_rmsd_n_Wrap(aa1m24,aa1o,0)    
 MRmse2a = dim_rmsd_n_Wrap(aa1m48,aa1o,0)    
 MRmse3a = dim_rmsd_n_Wrap(aa1m72,aa1o,0)    
 
 GRmse1a = dim_rmsd_n_Wrap(gfs1m24,aa1o,0) 
 GRmse2a = dim_rmsd_n_Wrap(gfs1m48,aa1o,0)
 GRmse3a = dim_rmsd_n_Wrap(gfs1m72,aa1o,0)
 
 NRmse1a = dim_rmsd_n_Wrap(n1m24,aa1o,0)  
 NRmse2a = dim_rmsd_n_Wrap(n1m48,aa1o,0)
 NRmse3a = dim_rmsd_n_Wrap(n1m72,aa1o,0)
 
;;******  compute bias
 bbmm1a=dim_avg_n(aa1m24-aa1o,0)
 bbmm2a=dim_avg_n(aa1m48-aa1o,0)
 bbmm3a=dim_avg_n(aa1m72-aa1o,0)
 
 bbg1a=dim_avg_n(gfs1m24-aa1o,0)
 bbg2a=dim_avg_n(gfs1m48-aa1o,0)
 bbg3a=dim_avg_n(gfs1m72-aa1o,0)

 bbn1a=dim_avg_n(n1m24-aa1o,0)
 bbn2a=dim_avg_n(n1m48-aa1o,0)
 bbn3a=dim_avg_n(n1m72-aa1o,0)

  print("rms amazon OK")
NRms1a =sqrt(NRmse1a^2- bbn1a^2)
NRms2a =sqrt(NRmse2a^2- bbn2a^2)
NRms3a =sqrt(NRmse3a^2- bbn3a^2)

MRms1a =sqrt(MRmse1a^2- bbmm1a^2)
MRms2a =sqrt(MRmse2a^2- bbmm2a^2)
MRms3a =sqrt(MRmse3a^2- bbmm3a^2)

GRms1a =sqrt(GRmse1a^2- bbg1a^2)
GRms2a =sqrt(GRmse2a^2- bbg2a^2)
GRms3a =sqrt(GRmse3a^2- bbg3a^2)
;;;

;;;   arrays
  y1l=(/NRms1l,NRms2l,NRms3l/)
  y2l=(/MRms1l,MRms2l,MRms3l/)
  y3l=(/GRms1l,GRms2l,GRms3l/)
 
  y1s=(/NRms1s,NRms2s,NRms3s/)
  y2s=(/MRms1s,MRms2s,MRms3s/)
  y3s=(/GRms1s,GRms2s,GRms3s/)
 
  y1c=(/NRms1c,NRms2c,NRms3c/)
  y2c=(/MRms1c,MRms2c,MRms3c/)
  y3c=(/GRms1c,GRms2c,GRms3c/)
 
  y1n=(/NRms1n,NRms2n,NRms3n/)
  y2n=(/MRms1n,MRms2n,MRms3n/)
  y3n=(/GRms1n,GRms2n,GRms3n/)
  
  y1a=(/NRms1a,NRms2a,NRms3a/)
  y2a=(/MRms1a,MRms2a,MRms3a/)
  y3a=(/GRms1a,GRms2a,GRms3a/)

;>>>>>>>>>>>>>>>>>>>>>>>>>>
;;;
  rmsl      = new((/3,dimsizes( y1l)/),double)
  rmsl(0,:)  = y1l
  rmsl(1,:)  = y2l
  rmsl(2,:)  = y3l

  rmss      = new((/3,dimsizes( y1s)/),double)
  rmss(0,:)  = y1s
  rmss(1,:)  = y2s
  rmss(2,:)  = y3s

  rmsc      = new((/3,dimsizes( y1c)/),double)
  rmsc(0,:)  = y1c
  rmsc(1,:)  = y2c
  rmsc(2,:)  = y3c

  rmsn      = new((/3,dimsizes( y1n)/),double)
  rmsn(0,:)  = y1n
  rmsn(1,:)  = y2n
  rmsn(2,:)  = y3n

  rmsa      = new((/3,dimsizes( y1a)/),double)
  rmsa(0,:)  = y1a
  rmsa(1,:)  = y2a
  rmsa(2,:)  = y3a

;>>>>>>>>>>>>>>>>>>>>>>>
  yy1l=(/bbn1l,bbn2l,bbn3l/)     ;>>>new1 => SMG 
  yy2l=(/bbmm1l,bbmm2l,bbmm3l/)  ;>>new2  => NCEP 
  yy3l=(/bbg1l,bbg2l,bbg3l/)     :>>GFS   

  yy1s=(/bbn1s,bbn2s,bbn3s/)
  yy2s=(/bbmm1s,bbmm2s,bbmm3s/)
  yy3s=(/bbg1s,bbg2s,bbg3s/)

  yy1c=(/bbn1c,bbn2c,bbn3c/)
  yy2c=(/bbmm1c,bbmm2c,bbmm3c/)
  yy3c=(/bbg1c,bbg2c,bbg3c/)

  yy1n=(/bbn1n,bbn2n,bbn3n/)
  yy2n=(/bbmm1n,bbmm2n,bbmm3n/)
  yy3n=(/bbg1n,bbg2n,bbg3n/)

  yy1a=(/bbn1a,bbn2a,bbn3a/)
  yy2a=(/bbmm1a,bbmm2a,bbmm3a/)
  yy3a=(/bbg1a,bbg2a,bbg3a/)
;>>>>>>>>>>>>>>>>>>>>>>>>>>>
 biasl      = new((/3,dimsizes( yy1l)/),double)

  biasl(0,:)  = yy1l  
  biasl(1,:)  = yy2l 
  biasl(2,:)  = yy3l 

  biass      = new((/3,dimsizes( yy1s)/),double)

  biass(0,:)  = yy1s
  biass(1,:)  = yy2s
  biass(2,:)  = yy3s

  biasc      = new((/3,dimsizes( yy1c)/),double)

  biasc(0,:)  = yy1c
  biasc(1,:)  = yy2c
  biasc(2,:)  = yy3c

  biasn      = new((/3,dimsizes( yy1n)/),double)

  biasn(0,:)  = yy1n
  biasn(1,:)  = yy2n
  biasn(2,:)  = yy3n

  biasa      = new((/3,dimsizes( yy1a)/),double)

  biasa(0,:)  = yy1a
  biasa(1,:)  = yy2a
  biasa(2,:)  = yy3a

;;;;

;  x1 = (/1,2,3,4/)
;  x1 = (/1,2,3/)

end 