%every list can be represented by difference of two others
%for example [a,b,c] as [a,b,c,d,e,f],[d,e,f]

%not mine, copy
sklej_roznicowo(L - End, End, L). %glue differencially
sklej_roznicowo(L - End, End - End2, L - End2).