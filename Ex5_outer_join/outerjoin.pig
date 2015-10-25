instrument = load '/user/hue/data/instrument' as (name:chararray, instrument:chararray);
band = load '/user/hue/data/band' as (name:chararray, band:chararray);
tempouter = join band by name full outer, instrument by name;
fullouter = foreach tempouter generate band::name as name,band,instrument;
dump fullouter;
-- store fullouter into 'outerjoin_result1';
templeft = join band by name left outer, instrument by name;
leftouter = foreach templeft generate band::name as name, band, instrument;
dump leftouter;
-- store leftouter into 'outerjoin_result2';
leftouter = filter leftouter by instrument is null;
-- store leftouter into 'outerjoin_result3';
