function [ YtrueTrain,YhatTrain ] = EstimationY( xmin,stpx,xmax,Fcentx,stepx,RuleBaseFinal,stepy,Fcenty )

%% %%%%%% Calculate MSE on Train Data
YtrueTrain=zeros(41,41);
YhatTrain=zeros(41,41);
indexi=0;
indexj=0;

       %%%%%%Fuzzysets on X1Train
    for x1=xmin:stpx:xmax
        flag1=0;
        indexi=indexi+1;
        if(x1==xmin)%Fuzzyset#1 and Fuzzyset#2
            num11=1;
            num12=2;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%%
        if((x1>xmin) && (x1<xmin+stepx))%Fuzzyset#1 and Fuzzyset#2
            num11=1;
            num12=2;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%%
        if(x1==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            num11=1;
            num12=2;
            num13=3;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%%%
        if(x1>xmin+stepx && x1<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            num11=2;
            num12=3;
            mutx11=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%%
        if(x1==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            num11=2;
            num12=3;
            num13=4;
            mutx11=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%
        if(x1>xmin+2*stepx && x1<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            num11=3;
            num12=4;
            mutx11=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);           
            
        end%%%%%%%%%%%%%%%
        if(x1==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            num11=3;
            num12=4;
            num13=5;
            mutx11=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%%
        if(x1>xmin+3*stepx && x1<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            num11=4;
            num12=5;
            mutx11=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%
        if(x1==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            num11=4;
            num12=5;
            num13=6;
            mutx11=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%
        if(x1>xmin+4*stepx && x1<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            num11=5;
            num12=6;
            mutx11=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            
        end%%%%%%%%%%%%%%
        if(x1==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            num11=5;
            num12=6;
            num13=7;
            mutx11=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%
        if(x1>xmin+5*stepx && x1<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num11=6;
            num12=7;
            mutx11=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            
        end%%%%%%%%%%%%%%
        if(x1==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num11=6;
            num12=7;
            mutx11=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            
            
        end%%%%%%%%%%%%%
        
  
          %%%%%%Fuzzysets on X2Train
  
    for x2=xmin:stpx:xmax
        flag2=0;
        indexj=indexj+1;
        if(x2==xmin)%Fuzzyset#1 and Fuzzyset#2
            num21=1;
            num22=2;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            
        end%%%%%%%%%%%%%%%%%
        if(x2>xmin && x2<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            num21=1;
            num22=2;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            
        end%%%%%%%%%%%%%%%%%
        if(x2==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            num21=1;
            num22=2;
            num23=3;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            flag2=1;
            
        end%%%%%%%%%%%%%%%%%
        if(x2>xmin+stepx && x2<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            num21=2;
            num22=3;
            mutx21=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
        end%%%%%%%%%%%%%%%%%
        if(x2==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            num21=2;
            num22=3;
            num23=4;
            mutx21=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            flag2=1;
        end%%%%%%%%%%%%%%%
        if(x2>xmin+2*stepx && x2<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            num21=3;
            num22=4;
            mutx21=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2); 
            
        end%%%%%%%%%%%%%%%
        if(x2==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            num21=3;
            num22=4;
            num23=5;
            mutx21=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            flag2=1;
        end%%%%%%%%%%%%%%%%
        if(x2>xmin+3*stepx && x2<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            num21=4;
            num22=5;
            mutx21=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            
        end%%%%%%%%%%%%%%%%
        if(x2==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            num21=4;
            num22=5;
            num23=6;
            mutx21=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            flag2=1;
            
        end%%%%%%%%%%%%%%%
        if(x2>xmin+4*stepx && x2<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            num21=5;
            num22=6;
            mutx21=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
           
        end%%%%%%%%%%%%%%
        if(x2==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            num21=5;
            num22=6;
            num23=7;
            mutx21=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            flag2=1;
        end%%%%%%%%%%%%%%
        if(x2>xmin+5*stepx && x2<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num21=6;
            num22=7;
            mutx21=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            
        end%%%%%%%%%%%%%%
        if(x2==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num21=6;
            num22=7;
            mutx21=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
        end%%%%%%%%%%%%%
        %%%%%%%%
        %%%%%%%%%%
        %%%%%%%% location of yhat and call zcoa
         if(flag1==0 && flag2==0)%%%%%ZCOA22
          yhat=ZCOA22(num11,num12,num21,num22,mutx11,mutx12,mutx21,mutx22,RuleBaseFinal,stepy,Fcenty);
         end
         if(flag1==0 && flag2==1)%%%%%ZCOA23
          yhat=ZCOA23(num11,num12,num21,num22,num23,mutx11,mutx12,mutx21,mutx22,mutx23,RuleBaseFinal,stepy,Fcenty );
         end
         if(flag1==1 && flag2==0)%%%%%ZCOA32
          yhat=ZCOA32(num11,num12,num13,num21,num22,mutx11,mutx12,mutx13,mutx21,mutx22,RuleBaseFinal,stepy,Fcenty);
         end
         if(flag1==1 && flag2==1)%%%%%ZCOA33
          yhat=ZCOA33(num11,num12,num13,num21,num22,num23,mutx11,mutx12,mutx13,mutx21,mutx22,mutx23,RuleBaseFinal,stepy,Fcenty);
         end
         YtrueTrain(indexi,indexj)=(x1.^2+x2.^2);
         YhatTrain(indexi,indexj) =yhat;
     end%%%%%%%%%%%%%%%%%%%%end of second for
     indexj=0;
   end%%%%%%%%%%%%%%%end of first for
   
   
   
end

