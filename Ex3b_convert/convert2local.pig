convertdata = load 'convert_data' as (value:double,type:chararray);
rate1 = load 'rate1' as (ratetype:chararray,rate:double);
temp = join convertdata by type left outer, rate1 by ratetype;
result = foreach temp generate (value < (double)0 or value > (double)1000000000? CONCAT(CONCAT((chararray)value,type), ' VALUE ERROR')
:(rate is null? CONCAT(CONCAT((chararray)value,type), ' TYPE ERROR'):CONCAT((chararray)(ROUND(value/rate*100.0)/100.0),'USD'))) as usdresult;

dump result;
store result into 'convert_result1';

