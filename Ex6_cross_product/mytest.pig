
mydata = load '/tutorial/pig/ex6/testa' as (str:chararray); 
dump mydata;
split1 = foreach mydata generate FLATTEN(STRSPLIT(str,':',1)) as (first:chararray,second:chararray); 
dump split1;
split2 = foreach mydata generate FLATTEN(STRSPLIT(str,':',2)) as (first:chararray,second:chararray); 
dump split2;
split3 = foreach mydata generate FLATTEN(STRSPLIT(str,':',3)) as (first:chararray,second:chararray); 
dump split3;

