#This shell script organizes the information from wages.csv in the ways
	#described in the Exercise 6 pdf for problem 1 and returns info 
	#specified in problems 2 and 3.
	#The og row information contains gender, yearsExp, yearsSchool, wage.
#Each row should be sorted first by Gender then by yearsExperience. 

#Usage: bash ex_6.sh

cat wages.csv | sort -n | sed 's/,/ /1' | sort -t, -k1,1 -u > sorted_wages.csv

echo "highest earner"
cat sorted_wages.csv | sort -t, -n -k3,3 | tail -n 1 

echo "lowest earner"
cat sorted_wages.csv | sort -t, -n -k3,3 | head -n 2 | tail -n 1

echo "number of females among top ten earners"
cat sorted_wages.csv | sort -t, -n -k3,3 | tail -n 10 | grep "female" | wc -l

 
echo "effect of graduating college (12 vs. 16 years of school) on minimum wages"
cat wages.csv | cut -d, -f 1,3,4 > justwages.csv

for variable in justwages.csv
do 
echo "(16yrs=$(cat justwages.csv | grep ",16," justwages.csv | sort -n | head -n 1 | cut -d, -f 3)) - (12yrs= $(cat justwages.csv | grep ",12," justwages.csv | sort -n | head -n 1 | cut -d, -f 3))"
done

