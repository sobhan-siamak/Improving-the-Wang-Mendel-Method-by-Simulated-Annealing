function [ Mu ] = TriFuzzySetY( a,b,c,y )

  if(y<0)
      Mu=1;
  end
  if(y>50)
      Mu=1;
  end

   Mu = max(min((y-a)/(b-a),(c-y)/(c-b)),0);

   

end

