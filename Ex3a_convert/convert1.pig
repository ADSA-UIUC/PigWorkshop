REGISTER '/user/hue/udf/convert.py' USING jython AS myfuncs;
convertdata = LOAD '/user/hue/data/convert_data' AS (value:double,type:chararray);
result = FOREACH convertdata GENERATE myfuncs.convert_currency(value,type);
DUMP result;
-- store result into 'udf_result';
