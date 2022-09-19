function [  Ytrue,YhatTest ] = EstimationYTest(xmin,stepx,Fcentx,RuleBaseFinal,stepy,Fcenty)

%% Calculate MSE and YhatTest  on Test Data

X1test=sort(unifrnd(-5,5,1,13));
 %X1test=rand(1,13)*10-5;
 %X2test=rand(1,13)*10-5;
 X2test=sort(unifrnd(-5,5,1,13));
 p=size(X1test,2);
 
 Ytrue=zeros(13,13);
 YhatTest=zeros(13,13);  %%%%YEstimate
 %err=zeros(1,169);

%%       %%%%%%%Fuzzysets on X1Test

%%%%%%% location of Run For

 for i=1:p
        flag1=0;
        if(X1test(i)==xmin)%Fuzzyset#1 and Fuzzyset#2
            num11=1;
            num12=2;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X1test(i));
            
        end%%%%%%%%%%%%%%%%%
        if((X1test(i)>xmin) && (X1test(i)<xmin+stepx))%Fuzzyset#1 and Fuzzyset#2
            num11=1;
            num12=2;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X1test(i));
            
        end%%%%%%%%%%%%%%%%%
        if(X1test(i)==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            num11=1;
            num12=2;
            num13=3;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X1test(i));
            mutx13=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X1test(i));
            flag1=1;
        end%%%%%%%%%%%%%%%%%
        if(X1test(i)>xmin+stepx && X1test(i)<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            num11=2;
            num12=3;
            mutx11=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X1test(i));
            
        end%%%%%%%%%%%%%%%%%
        if(X1test(i)==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            num11=2;
            num12=3;
            num13=4;
            mutx11=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X1test(i));
            mutx13=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X1test(i));
            flag1=1;
        end%%%%%%%%%%%%%%%
        if(X1test(i)>xmin+2*stepx && X1test(i)<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            num11=3;
            num12=4;
            mutx11=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X1test(i));           
            
        end%%%%%%%%%%%%%%%
        if(X1test(i)==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            num11=3;
            num12=4;
            num13=5;
            mutx11=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X1test(i));
            mutx13=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X1test(i));
            flag1=1;
        end%%%%%%%%%%%%%%%%
        if(X1test(i)>xmin+3*stepx && X1test(i)<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            num11=4;
            num12=5;
            mutx11=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X1test(i));
            
        end%%%%%%%%%%%%%%%%
        if(X1test(i)==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            num11=4;
            num12=5;
            num13=6;
            mutx11=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X1test(i));
            mutx13=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X1test(i));
            flag1=1;
        end%%%%%%%%%%%%%%%
        if(X1test(i)>xmin+4*stepx && X1test(i)<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            num11=5;
            num12=6;
            mutx11=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X1test(i));
            
        end%%%%%%%%%%%%%%
        if(X1test(i)==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            num11=5;
            num12=6;
            num13=7;
            mutx11=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X1test(i));
            mutx13=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,X1test(i));
            flag1=1;
        end%%%%%%%%%%%%%%
        if(X1test(i)>xmin+5*stepx && X1test(i)<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num11=6;
            num12=7;
            mutx11=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,X1test(i));
            
        end%%%%%%%%%%%%%%
        if(X1test(i)==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num11=6;
            num12=7;
            mutx11=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X1test(i));
            mutx12=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,X1test(i));
            
            
        end%%%%%%%%%%%%%
        
%%        %%%%%%Fuzzysets on X2Test
     for j=1:p
         flag2=0;
        if(X2test(j)==xmin)%Fuzzyset#1 and Fuzzyset#2
            num21=1;
            num22=2;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X2test(j));
            
        end%%%%%%%%%%%%%%%%%
        if(X2test(j)>xmin && X2test(j)<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            num21=1;
            num22=2;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X2test(j));
            
        end%%%%%%%%%%%%%%%%%
        if(X2test(j)==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            num21=1;
            num22=2;
            num23=3;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X2test(j));
            mutx23=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X2test(j));
            flag2=1;
            
        end%%%%%%%%%%%%%%%%%
        if(X2test(j)>xmin+stepx && X2test(j)<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            num21=2;
            num22=3;
            mutx21=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X2test(j));
        end%%%%%%%%%%%%%%%%%
        if(X2test(j)==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            num21=2;
            num22=3;
            num23=4;
            mutx21=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X2test(j));
            mutx23=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X2test(j));
            flag2=1;
        end%%%%%%%%%%%%%%%
        if(X2test(j)>xmin+2*stepx && X2test(j)<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            num21=3;
            num22=4;
            mutx21=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X2test(j)); 
            
        end%%%%%%%%%%%%%%%
        if(X2test(j)==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            num21=3;
            num22=4;
            num23=5;
            mutx21=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X2test(j));
            mutx23=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X2test(j));
            flag2=1;
        end%%%%%%%%%%%%%%%%
        if(X2test(j)>xmin+3*stepx && X2test(j)<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            num21=4;
            num22=5;
            mutx21=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X2test(j));
            
        end%%%%%%%%%%%%%%%%
        if(X2test(j)==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            num21=4;
            num22=5;
            num23=6;
            mutx21=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X2test(j));
            mutx23=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X2test(j));
            flag2=1;
            
        end%%%%%%%%%%%%%%%
        if(X2test(j)>xmin+4*stepx && X2test(j)<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            num21=5;
            num22=6;
            mutx21=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X2test(j));
           
        end%%%%%%%%%%%%%%
        if(X2test(j)==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            num21=5;
            num22=6;
            num23=7;
            mutx21=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X2test(j));
            mutx23=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,X2test(j));
            flag2=1;
        end%%%%%%%%%%%%%%
        if(X2test(j)>xmin+5*stepx && X2test(j)<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num21=6;
            num22=7;
            mutx21=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,X2test(j));
            
        end%%%%%%%%%%%%%%
        if(X2test(j)==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num21=6;
            num22=7;
            mutx21=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,X2test(j));
            mutx22=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,X2test(j));
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
         Ytrue(i,j)=(X1test(i).^2+X2test(j).^2);
         YhatTest(i,j) =yhat;
      end%%%%%%%end of second for


end%%%%%%%end of first for








end

