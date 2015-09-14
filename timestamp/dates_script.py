import re
f = open("sfcrime_dates.csv", "r")

resp = open("sfcrime-timestamp.csv", "w")
resp.write("year,month,day,hour,minutes,seconds\n")

lines = f.readlines()

for line in lines:
	timestamp = re.split('-| |:', line)
	resp.write(','.join(timestamp))


f.close()
resp.close()


