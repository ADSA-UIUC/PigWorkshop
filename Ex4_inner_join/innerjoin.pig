--
-- innerjoin.pig
--   join across multiple files
--
-- Load the data sets
student = load '/user/hue/data/student' as (name:chararray, studentid:int);
class = load '/user/hue/data/class' as (classname:chararray, classid:int);
enroll = load '/user/hue/data/enroll' as (studentid:int, classid:int);

temp = join student by studentid, enroll by studentid;
tempenrollnum = group temp by classid;
enrollnum = foreach tempenrollnum generate group as classid, COUNT(temp) as totalnum;
result = join enrollnum by classid, class by classid;
finalresult = foreach result generate classname,class::classid as classid,totalnum;

dump finalresult;
-- store finalresult into 'innerjoin_result';

