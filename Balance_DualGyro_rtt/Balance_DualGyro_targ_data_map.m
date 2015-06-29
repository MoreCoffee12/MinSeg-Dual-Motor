  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (loikxjbxjg)
    ;%
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% loikxjbxjg.ES
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% loikxjbxjg.GS
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% loikxjbxjg.KLQR
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% loikxjbxjg.Rw
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 6;
	
	  ;% loikxjbxjg.TS
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 7;
	
	  ;% loikxjbxjg.DiscreteDerivative1_ICPrevScale
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 8;
	
	  ;% loikxjbxjg.DiscreteDerivative_ICPrevScaled
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% loikxjbxjg.DigitalOutput_pinNumber
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
	  ;% loikxjbxjg.DigitalOutput_pinNum_dkdg0mudn1
	  section.data(2).logicalSrcIdx = 8;
	  section.data(2).dtTransOffset = 1;
	
	  ;% loikxjbxjg.PWM_pinNumber
	  section.data(3).logicalSrcIdx = 9;
	  section.data(3).dtTransOffset = 2;
	
	  ;% loikxjbxjg.PWM_pinNumber_asu2t43y3t
	  section.data(4).logicalSrcIdx = 10;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 38;
      section.data(38)  = dumData; %prealloc
      
	  ;% loikxjbxjg.Constant4_Value
	  section.data(1).logicalSrcIdx = 11;
	  section.data(1).dtTransOffset = 0;
	
	  ;% loikxjbxjg.Constant5_Value
	  section.data(2).logicalSrcIdx = 12;
	  section.data(2).dtTransOffset = 1;
	
	  ;% loikxjbxjg.Constant1_Value
	  section.data(3).logicalSrcIdx = 13;
	  section.data(3).dtTransOffset = 2;
	
	  ;% loikxjbxjg.Constant4_Value_fcvbhpavwu
	  section.data(4).logicalSrcIdx = 14;
	  section.data(4).dtTransOffset = 3;
	
	  ;% loikxjbxjg.Constant5_Value_c1kzczhsb5
	  section.data(5).logicalSrcIdx = 15;
	  section.data(5).dtTransOffset = 4;
	
	  ;% loikxjbxjg.Constant1_Value_nzafqls3qb
	  section.data(6).logicalSrcIdx = 16;
	  section.data(6).dtTransOffset = 5;
	
	  ;% loikxjbxjg.ZBias_Value
	  section.data(7).logicalSrcIdx = 17;
	  section.data(7).dtTransOffset = 6;
	
	  ;% loikxjbxjg.Gain2_Gain
	  section.data(8).logicalSrcIdx = 18;
	  section.data(8).dtTransOffset = 7;
	
	  ;% loikxjbxjg.YBias_Value
	  section.data(9).logicalSrcIdx = 19;
	  section.data(9).dtTransOffset = 8;
	
	  ;% loikxjbxjg.Gain5_Gain
	  section.data(10).logicalSrcIdx = 20;
	  section.data(10).dtTransOffset = 9;
	
	  ;% loikxjbxjg.ZBias_Value_nmxg2ourug
	  section.data(11).logicalSrcIdx = 21;
	  section.data(11).dtTransOffset = 10;
	
	  ;% loikxjbxjg.Gain2_Gain_hzhzx250o5
	  section.data(12).logicalSrcIdx = 22;
	  section.data(12).dtTransOffset = 11;
	
	  ;% loikxjbxjg.YBias_Value_mhoipw0xsf
	  section.data(13).logicalSrcIdx = 23;
	  section.data(13).dtTransOffset = 12;
	
	  ;% loikxjbxjg.Gain5_Gain_hw2tyfthn4
	  section.data(14).logicalSrcIdx = 24;
	  section.data(14).dtTransOffset = 13;
	
	  ;% loikxjbxjg.convertoradianssed1_Gain
	  section.data(15).logicalSrcIdx = 25;
	  section.data(15).dtTransOffset = 14;
	
	  ;% loikxjbxjg.Gain4_Gain
	  section.data(16).logicalSrcIdx = 26;
	  section.data(16).dtTransOffset = 15;
	
	  ;% loikxjbxjg.Gyro1Bias_Value
	  section.data(17).logicalSrcIdx = 27;
	  section.data(17).dtTransOffset = 16;
	
	  ;% loikxjbxjg.Gyro2Bias_Value
	  section.data(18).logicalSrcIdx = 28;
	  section.data(18).dtTransOffset = 17;
	
	  ;% loikxjbxjg.Delay_InitialCondition
	  section.data(19).logicalSrcIdx = 29;
	  section.data(19).dtTransOffset = 18;
	
	  ;% loikxjbxjg.Gain3_Gain
	  section.data(20).logicalSrcIdx = 30;
	  section.data(20).dtTransOffset = 19;
	
	  ;% loikxjbxjg.TSamp_WtEt
	  section.data(21).logicalSrcIdx = 31;
	  section.data(21).dtTransOffset = 20;
	
	  ;% loikxjbxjg.TSamp_WtEt_mbimlljif4
	  section.data(22).logicalSrcIdx = 32;
	  section.data(22).dtTransOffset = 21;
	
	  ;% loikxjbxjg.MotorOrientation_Gain
	  section.data(23).logicalSrcIdx = 33;
	  section.data(23).dtTransOffset = 22;
	
	  ;% loikxjbxjg.ProportionalGain1_Gain
	  section.data(24).logicalSrcIdx = 34;
	  section.data(24).dtTransOffset = 23;
	
	  ;% loikxjbxjg.DiscreteTimeIntegrator1_gainval
	  section.data(25).logicalSrcIdx = 35;
	  section.data(25).dtTransOffset = 24;
	
	  ;% loikxjbxjg.DiscreteTimeIntegrator1_IC
	  section.data(26).logicalSrcIdx = 36;
	  section.data(26).dtTransOffset = 25;
	
	  ;% loikxjbxjg.IntegralGain1_Gain
	  section.data(27).logicalSrcIdx = 37;
	  section.data(27).dtTransOffset = 26;
	
	  ;% loikxjbxjg.SupplyVoltage_Value
	  section.data(28).logicalSrcIdx = 38;
	  section.data(28).dtTransOffset = 27;
	
	  ;% loikxjbxjg.Constant4_Value_k0amvdt1or
	  section.data(29).logicalSrcIdx = 39;
	  section.data(29).dtTransOffset = 28;
	
	  ;% loikxjbxjg.Constant1_Value_i4sewoio01
	  section.data(30).logicalSrcIdx = 40;
	  section.data(30).dtTransOffset = 29;
	
	  ;% loikxjbxjg.Switch1_Threshold
	  section.data(31).logicalSrcIdx = 41;
	  section.data(31).dtTransOffset = 30;
	
	  ;% loikxjbxjg.ProportionalGain_Gain
	  section.data(32).logicalSrcIdx = 42;
	  section.data(32).dtTransOffset = 31;
	
	  ;% loikxjbxjg.DiscreteTimeIntegrator_gainval
	  section.data(33).logicalSrcIdx = 43;
	  section.data(33).dtTransOffset = 32;
	
	  ;% loikxjbxjg.DiscreteTimeIntegrator_IC
	  section.data(34).logicalSrcIdx = 44;
	  section.data(34).dtTransOffset = 33;
	
	  ;% loikxjbxjg.IntegralGain_Gain
	  section.data(35).logicalSrcIdx = 45;
	  section.data(35).dtTransOffset = 34;
	
	  ;% loikxjbxjg.Switch1_Threshold_hdbry2hxtq
	  section.data(36).logicalSrcIdx = 46;
	  section.data(36).dtTransOffset = 35;
	
	  ;% loikxjbxjg.Constant2_Value
	  section.data(37).logicalSrcIdx = 47;
	  section.data(37).dtTransOffset = 36;
	
	  ;% loikxjbxjg.Constant2_Value_nb3hajk2ec
	  section.data(38).logicalSrcIdx = 48;
	  section.data(38).dtTransOffset = 37;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% loikxjbxjg.Delay_DelayLength
	  section.data(1).logicalSrcIdx = 49;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% loikxjbxjg.DualEncoderReading_P1
	  section.data(1).logicalSrcIdx = 50;
	  section.data(1).dtTransOffset = 0;
	
	  ;% loikxjbxjg.DualEncoderReading_P2
	  section.data(2).logicalSrcIdx = 51;
	  section.data(2).dtTransOffset = 2;
	
	  ;% loikxjbxjg.DualEncoderReading_P3
	  section.data(3).logicalSrcIdx = 52;
	  section.data(3).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (n3qi1whofz)
    ;%
      section.nData     = 33;
      section.data(33)  = dumData; %prealloc
      
	  ;% n3qi1whofz.lqkur2kd5v
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% n3qi1whofz.oohaohbg3m
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% n3qi1whofz.o2o0naxsf4
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% n3qi1whofz.dnya3q5o43
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% n3qi1whofz.atxthqdyqr
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% n3qi1whofz.pcduqc2blm
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% n3qi1whofz.kzf1zn2yrb
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% n3qi1whofz.jwlqpmqign
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% n3qi1whofz.e0chvlae1y
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% n3qi1whofz.iztwurq25z
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% n3qi1whofz.kdd4tjfx4v
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% n3qi1whofz.l24k5nr02n
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% n3qi1whofz.k23dwwsp25
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% n3qi1whofz.oofkkz1mez
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% n3qi1whofz.ly0rn1krpo
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
	  ;% n3qi1whofz.fu5tmv0jfh
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15;
	
	  ;% n3qi1whofz.bxjs24fecs
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 16;
	
	  ;% n3qi1whofz.jrop32cnid
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 17;
	
	  ;% n3qi1whofz.e4jjlbyno5
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 18;
	
	  ;% n3qi1whofz.ajcicdyu4u
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 19;
	
	  ;% n3qi1whofz.apclo2a2l4
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 20;
	
	  ;% n3qi1whofz.n5fu2dqsqe
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 21;
	
	  ;% n3qi1whofz.k2iys043hu
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 22;
	
	  ;% n3qi1whofz.as4wheonbm
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 23;
	
	  ;% n3qi1whofz.cvl5khy2g4
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 24;
	
	  ;% n3qi1whofz.c4ma05krue
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 25;
	
	  ;% n3qi1whofz.obe12rkvz5
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 26;
	
	  ;% n3qi1whofz.ofwzrhsjcl
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 27;
	
	  ;% n3qi1whofz.dv22vhliqj
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 28;
	
	  ;% n3qi1whofz.mwzpdxmnif
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 29;
	
	  ;% n3qi1whofz.nqymuhnjmu
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 30;
	
	  ;% n3qi1whofz.caphfymbef
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 31;
	
	  ;% n3qi1whofz.hkg0m3wlbq
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 32;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% n3qi1whofz.fsfuhssvfi
	  section.data(1).logicalSrcIdx = 33;
	  section.data(1).dtTransOffset = 0;
	
	  ;% n3qi1whofz.efgvdccjph
	  section.data(2).logicalSrcIdx = 34;
	  section.data(2).dtTransOffset = 1;
	
	  ;% n3qi1whofz.pwzh2mljsn
	  section.data(3).logicalSrcIdx = 35;
	  section.data(3).dtTransOffset = 2;
	
	  ;% n3qi1whofz.jotnlxrdh2
	  section.data(4).logicalSrcIdx = 36;
	  section.data(4).dtTransOffset = 3;
	
	  ;% n3qi1whofz.jf22rqwwt4
	  section.data(5).logicalSrcIdx = 37;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 2;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (p2mdn4qxag)
    ;%
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% p2mdn4qxag.hyfnvbmkst
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% p2mdn4qxag.etz4isapmi
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% p2mdn4qxag.cpln04xreo
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% p2mdn4qxag.k3ibipnvhw
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% p2mdn4qxag.h5i5jiozdo
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% p2mdn4qxag.aui3fegwmb
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% p2mdn4qxag.dn34ke1ry4
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 22;
      section.data(22)  = dumData; %prealloc
      
	  ;% p2mdn4qxag.gwksmby2oy.LoggedData
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
	  ;% p2mdn4qxag.mte5e5qnnx.LoggedData
	  section.data(2).logicalSrcIdx = 8;
	  section.data(2).dtTransOffset = 1;
	
	  ;% p2mdn4qxag.kbt2clalev.LoggedData
	  section.data(3).logicalSrcIdx = 9;
	  section.data(3).dtTransOffset = 2;
	
	  ;% p2mdn4qxag.pmvnw3xk1o.LoggedData
	  section.data(4).logicalSrcIdx = 10;
	  section.data(4).dtTransOffset = 3;
	
	  ;% p2mdn4qxag.cmc305rqli.LoggedData
	  section.data(5).logicalSrcIdx = 11;
	  section.data(5).dtTransOffset = 4;
	
	  ;% p2mdn4qxag.nub5npz2vw.LoggedData
	  section.data(6).logicalSrcIdx = 12;
	  section.data(6).dtTransOffset = 5;
	
	  ;% p2mdn4qxag.obagvaizo4.LoggedData
	  section.data(7).logicalSrcIdx = 13;
	  section.data(7).dtTransOffset = 6;
	
	  ;% p2mdn4qxag.lecl4zye5f.LoggedData
	  section.data(8).logicalSrcIdx = 14;
	  section.data(8).dtTransOffset = 7;
	
	  ;% p2mdn4qxag.ehnseaecyq.LoggedData
	  section.data(9).logicalSrcIdx = 15;
	  section.data(9).dtTransOffset = 8;
	
	  ;% p2mdn4qxag.jxjzamkv0k.LoggedData
	  section.data(10).logicalSrcIdx = 16;
	  section.data(10).dtTransOffset = 9;
	
	  ;% p2mdn4qxag.joayredzvz.LoggedData
	  section.data(11).logicalSrcIdx = 17;
	  section.data(11).dtTransOffset = 10;
	
	  ;% p2mdn4qxag.m1xlgg4iah.LoggedData
	  section.data(12).logicalSrcIdx = 18;
	  section.data(12).dtTransOffset = 11;
	
	  ;% p2mdn4qxag.fbbtcr4gbi.LoggedData
	  section.data(13).logicalSrcIdx = 19;
	  section.data(13).dtTransOffset = 12;
	
	  ;% p2mdn4qxag.moslzo32pn.LoggedData
	  section.data(14).logicalSrcIdx = 20;
	  section.data(14).dtTransOffset = 13;
	
	  ;% p2mdn4qxag.o4btrvsbsj.LoggedData
	  section.data(15).logicalSrcIdx = 21;
	  section.data(15).dtTransOffset = 14;
	
	  ;% p2mdn4qxag.nxn5nh4beg.LoggedData
	  section.data(16).logicalSrcIdx = 22;
	  section.data(16).dtTransOffset = 15;
	
	  ;% p2mdn4qxag.kn0l2dhvhd.LoggedData
	  section.data(17).logicalSrcIdx = 23;
	  section.data(17).dtTransOffset = 16;
	
	  ;% p2mdn4qxag.oxg5gkohop.LoggedData
	  section.data(18).logicalSrcIdx = 24;
	  section.data(18).dtTransOffset = 17;
	
	  ;% p2mdn4qxag.ibc3l2omcg.LoggedData
	  section.data(19).logicalSrcIdx = 25;
	  section.data(19).dtTransOffset = 18;
	
	  ;% p2mdn4qxag.at0hixyb1v.LoggedData
	  section.data(20).logicalSrcIdx = 26;
	  section.data(20).dtTransOffset = 19;
	
	  ;% p2mdn4qxag.oh4a0f2tr2.LoggedData
	  section.data(21).logicalSrcIdx = 27;
	  section.data(21).dtTransOffset = 20;
	
	  ;% p2mdn4qxag.d3o3co3boy.LoggedData
	  section.data(22).logicalSrcIdx = 28;
	  section.data(22).dtTransOffset = 21;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 2645959988;
  targMap.checksum1 = 3464681430;
  targMap.checksum2 = 494317216;
  targMap.checksum3 = 1531181201;

