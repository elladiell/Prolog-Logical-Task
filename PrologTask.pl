is(wrong).
is(right).

solve(Sayings):-
  Sayings = [words(S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12)],
  
  is(S1), is(S2), is(S3), is(S4), is(S5), is(S6), is(S7), is(S8), is(S9), is(S10), is(S11), is(S12),
  
  % not(member(words(_, _, _, _, _,_,_,_, _,_,_,_), Sayings)), шаблон
  
  % обязательно две истины, одна ложь
  % исключить тройное тру по тройкам
  % исключить тройную ложь по тройкам
  % 1 - 4
  not(member(words(right, right, right, _, _,_,_,_,_,_,_,_), Sayings)),
  not(member(words(_, _, _, right, right, right,_,_,_,_,_,_), Sayings)),
  not(member(words(_, _, _, _, _, _,right,right,right,_,_,_), Sayings)),
  not(member(words(_, _, _, _, _, _,_,_,_,right,right,right), Sayings)),
  
  % 4 - 8
  not(member(words(wrong, wrong, wrong, _, _,_,_,_,_,_,_,_), Sayings)),
  not(member(words(_, _, _, wrong, wrong, wrong,_,_,_,_,_,_), Sayings)),
  not(member(words(_, _, _, _, _, _,wrong,wrong,wrong,_,_,_), Sayings)),
  not(member(words(_, _, _, _, _, _,_,_,_,wrong,wrong,wrong), Sayings)),
  
  % ------------------------------------------------------------------------
  
  % 9 - 10
  % если в окно попал не фери (S1 = true), то S9 = true too.
  not(member(words(right, _, _, _, _,_,_,_, wrong,_,_,_), Sayings)),
  not(member(words(wrong, _, _, _, _,_,_,_, right,_,_,_), Sayings)),
  
  % 11 - 12
  % шаньи предложил играть на улице(s2), то неверно s12 и наоборот
  not(member(words(_, right, _, _, _,_,_,_, _,_,_,right), Sayings)),
  not(member(words(_, wrong, _, _, _,_,_,_, _,_,_,wrong), Sayings)),
  
  % лаци невиновен (s3), это сделал лаци(s5), лаци невиновен (s7), это сделал лаци (s11).
  % хорошее название для фильма. "Это сделал Лаци."
  
  % s3 и s5 должны быть разные
  
  % 13 - 14
  not(member(words(_, _, wrong, _, wrong,_,_,_, _,_,_,_), Sayings)),
  not(member(words(_, _, right, _, right,_,_,_, _,_,_,_), Sayings)),
  
  % s3 и s7 должны быть одинаковые
  % 15 - 16
  
  not(member(words(_, _, wrong, _, _,_,right,_, _,_,_,_), Sayings)),
  not(member(words(_, _, right, _, _,_,wrong,_, _,_,_,_), Sayings)),
  
  % s3 и s11 должны быть разные
  % 17 - 18
  not(member(words(_, _, wrong, _, _,_,_,_, _,_,wrong,_), Sayings)),
  not(member(words(_, _, right, _, _,_,_,_, _,_,right,_), Sayings)),
  
  % 19 - 20
  % s5 и с7 должны быть разные
  not(member(words(_, _, _, _, wrong,_,wrong,_, _,_,_,_), Sayings)),
  not(member(words(_, _, _, _, right,_,right,_, _,_,_,_), Sayings)),
  
  % 21 - 22
  % с5 и с11 должны быть одинаковые
  not(member(words(_, _, _, _, wrong,_,_,_, _,_,right,_), Sayings)),
  not(member(words(_, _, _, _, right,_,_,_, _,_,wrong,_), Sayings)),
  
  % c7 и с11 должны быть разные
  not(member(words(_, _, _, _, _,_,right,_, _,_,right,_), Sayings)),
  not(member(words(_, _, _, _, _,_,wrong,_, _,_,wrong,_), Sayings)),
 
  % дьюси
 
  % c8 правда, скорее всего
  member(words(_, _, _, _, _,_,_,right, _,_,_,_), Sayings),
  
  % если виноват фери, то все остальные невиновны
  % фери невиновен - с1, лаци не виноват с3, дьюси не виноват с4, лаци разбил окно с5, 
  % лаци не виноват с7, фери не виноват с9, лаци разбил окно с11 
  
  % нет такого, что с1 ложь, а с5 правда (что виноваты и фери и лаци)
  not(member(words(wrong, _, _, _, right,_,_,_, _,_,_,_), Sayings)),
  % не должно быть такого, что с3 ложь и с1 ложь или с4 ложь
  not(member(words(wrong, _, wrong, _, _,_,_,_, _,_,_,_), Sayings)),
  not(member(words(wrong, _, _, wrong, _,_,_,_, _,_,_,_), Sayings)),
  not(member(words(wrong, _, _, _, _,_,_,_, wrong,_,_,_), Sayings)),
  not(member(words(_, _, wrong, wrong, _,_,_,_, _,_,_,_), Sayings)),
  not(member(words(_, _, _,_, _,_,_,_, _,wrong,right,_), Sayings)).
  
start(Solve):-
  solve(Solve), Solve = [words(_,_,_,_,
  _,_,_,_,
  _,_,_,_)].