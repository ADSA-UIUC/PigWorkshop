--
-- split.pig
--   Split a file based on different criteria
--
-- Load the data set
infor = load '/user/hue/data/split_text.txt' as (name:chararray, gender:chararray,salary:int);

-- Divide the file based on gender
split infor into female_infor if gender=='F', male_infor if gender =='M';
dump female_infor;
dump male_infor;

-- Divide the file based on salary
split infor into high_salary if salary > 1000, low_salary  if salary <=1000;
dump high_salary;
dump low_salary;

-- Write the results to a file
-- store female_infor into 'split_result1';
-- store male_infor into 'split_result2';
-- store high_salary into 'split_result3';
-- store low_salary into 'split_result4';
