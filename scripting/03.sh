#!/bin/bash

# This script will help set up macros for other scripts

OJ='\033[38;5;208m'
GREEN='\033[32m'
RED='\033[31m'
NC='\033[0m'
form_file=srcs/form.txt;
colors_file=srcs/colors.txt;
bgcolors_file=srcs/bgcolors.txt;
ft_prompt_1="${GREEN}[1]${NC}\tAdd Formatting Controls (Bold/Dim/Underline/Inv/Hidden)";
ft_prompt_2="${GREEN}[2]${NC}\tAdd 8/16 colors (30-37) & (90-97)";
ft_prompt_3="${GREEN}[3]${NC}\tAdd background colors (40-47) & (100-107)";
ft_prompt_4="${GREEN}[4]${NC}\tExit";
echo "${OJ}This script will help you set up macros for editing other shell scripts${NC}"
read -p "Enter script name with .sh: " NAME

while true; do
	read -p "Would you like to move this script to a dir? (y/n) " yn

	case $yn in
		[Yy]* ) read -p "Enter a dir (with / at the end): " DIR; break;;
		[Nn]* ) break;;
		* ) echo "Please select y or n..."
	esac
done
echo "Confirmed DIR: $DIR"
MIN="${GREEN}1${NC}";
MAX="${GREEN}4${NC}";
ft_error(){
	echo "${RED}Invalid option${NC}"
}
ft_opt_1(){
	echo "\n Add Formatting Controls (Bold/Dim/Underline/Inv/Hidden)\n"
	cat $form_file >> $DIR$NAME
	read -n 1 -s -r -p "Press any key to continue..."
}
ft_opt_2(){
	echo "\n Add 8/16 colors"
	cat $colors_file >> $DIR$NAME
	read -n 1 -s -r -p "Press any key to continue..."
}
ft_opt_3(){
	echo "\n Add 8/16 bg colors"
	cat $bgcolors_file >> $DIR$NAME
	read -n 1 -s -r -p "Press any key to continue..."
}
ft_opt_4(){
	sleep 1 ; clear
	break
}
ft_menu() {
echo "${OJ}<------------------------MENU------------------------->${NC}"
echo
echo
echo $ft_prompt_1
echo $ft_prompt_2
echo $ft_prompt_3
echo $ft_prompt_4
echo
echo 
echo "Select a number betweeen $MIN and $MAX"
}

while true
do
	ft_menu

	read -e INPUT
	case $INPUT in
		1) ft_opt_1;;
		2) ft_opt_2;;
		3) ft_opt_3;;
		4) ft_opt_4;;
		*) ft_error;;
	esac
done
