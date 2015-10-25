--
-- helloworld.pig
--    Example Pig program to read the contents of a text
--    file and find all words of hello and world.
--
-- In this example, the text of a book file (book.txt) is
-- parsed for sample words. The file book.txt has been
-- cleaned of all punctuation characters and non-printable
-- characters.


-- Load each line of the book into the bag called input_lines
input_lines = LOAD ‘/user/hue/data/book.txt' AS (line:chararray);
DESCRIBE input_lines;

-- Convert the text to lower case
-- Break apart the line into individual words
-- The new bag called words contains one word per row
-- The field has the name "word" which will be used in each data set
words = FOREACH input_lines GENERATE FLATTEN(TOKENIZE(LOWER(line))) AS word;
DESCRIBE words;

-- You can use this DUMP to see how the words were tokenized
-- DUMP words;

-- Remove all whitespace
-- Note the use of the field "word". The dataset noblank_words inherited
-- the field named "word" from the dataset words.
noblank_words = FILTER words BY word MATCHES '\\w+';

-- Search for the words using the FILTER operation
helloworld = FILTER noblank_words BY (word == 'hello' OR word == 'world');
DUMP helloworld;

-- Create a group for each word
-- One group contains all the "hello" words, the other has "world" words
word_groups = GROUP helloworld BY word;
DESCRIBE word_groups;
DUMP word_groups;
 
-- Count the entries in each group
-- Output is (word, count)
word_count = FOREACH word_groups GENERATE group as word, COUNT(helloworld) AS count;
DUMP word_count;
DESCRIBE word_count;

-- You could reverse the word and count by swapping the order
count_word = FOREACH word_groups GENERATE COUNT(helloworld) AS count, group AS word;
DUMP count_word;
 

