mydata = load '/tutorial/pig/ex6/parsedata' as (str:chararray); 
split1 = foreach mydata generate FLATTEN(STRSPLIT(str,'\u0002',2)) as (first:chararray,second:chararray); 
split2 = foreach split1 generate FLATTEN(STRSPLIT(first,'\u0001',2))as (name:chararray, rest:chararray), STRSPLIT(second,'\u0003') as websites;
tempresult1 = foreach split2 generate name, FLATTEN(websites);
tempresult2 = foreach tempresult1 generate $0 as name, FLATTEN(TOBAG(*)) as website; 
result = filter tempresult by name != website;   
dump result;
