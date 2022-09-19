function [ Mu ] = TriFuzzySetX( a,b,c,x )

  if (x<-5)
      Mu=1;
  end
  
  if (x>5)
      Mu=1;
  end
  

  Mu = max(min((x-a)/(b-a),(c-x)/(c-b)),0);
    

    

end

