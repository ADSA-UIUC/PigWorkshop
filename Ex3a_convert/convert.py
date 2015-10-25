#/usr/bin/jython

@outputSchema("usdresult:chararray")
def convert_currency(value,type):
  if value < 0 or value > 1000000000:
    return str(value) + ' ' + type + ' VALUE ERROR' 
  rate={'USD': 1.0, 'EUR': 0.726,'CNY': 6.095,'CAD': 1.046,'HKD': 7.753,'INR': 61.24,'JPY': 98.19,'SEK':6.376,'AUD': 1.053,'BRL': 2.191}
  for key in rate:
     if key == type:
       return '%.2f USD'%(value/rate[key])
  return str(value) + ' ' + type + ' TYPE ERROR'

