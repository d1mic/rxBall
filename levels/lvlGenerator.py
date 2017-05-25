from random import shuffle

level= []

lvlNum = raw_input("Level number: \n")

emptyFields = raw_input("Empty fields number: \n ")
regular = raw_input("Regular bricks number \n")
greenPow = raw_input("Paddle size power-up number: \n")
yellowPow = raw_input("Slow ball power-up number \n")
purplePow = raw_input("Drunk paddle power-up number \n")
redPow = raw_input("Speed paddle power-up number \n")

for i in range(1,int(emptyFields)):
	level.append('-')
for i in range(1,int(regular)):
	level.append('n')

for i in range(1,int(greenPow)):
	level.append('g')
for i in range(1,int(yellowPow)):
	level.append('y')
for i in range(1,int(purplePow)):
	level.append('p')
for i in range(1,int(redPow)):
	level.append('r')


shuffle(level)

datname = 'lvl' + str(lvlNum) + '.txt'
with open(datname, 'w+') as file:
	for i, val in enumerate(level):
		file.write(val,)
		if (i+1) % 10 == 0:
			file.write('\n')
