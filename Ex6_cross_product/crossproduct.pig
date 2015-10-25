mydata = load '/user/hue/data/parsedata' as (str:chararray); 
dump mydata;
describe mydata;

split1 = foreach mydata generate FLATTEN(STRSPLIT(str,'\u0002',2)) as (first:chararray,second:chararray); 
dump split1;
describe split1;

split2 = foreach split1 generate FLATTEN(STRSPLIT(first,'\u0001',2))as (name:chararray, rest:chararray), STRSPLIT(second,'\u0003') as websites;
dump split2;
describe split2;

tempresult1 = foreach split2 generate name, FLATTEN(websites);
dump tempresult1;
describe tempresult1;

tempresult2 = foreach tempresult1 generate $0 as name, FLATTEN(TOBAG(*)) as website; 
dump tempresult2;
describe tempresult2;

result = filter tempresult2 by name != website;   
dump result;
describe result;

